<?php


namespace console\controllers;

use common\models\Answer;
use common\models\Approve;
use common\models\EgoAnswer;
use common\models\EgoDifferences;
use common\models\Immerse;
use common\models\EgoQuestion;
use common\models\User;
use common\models\UserIncarnationGrades;
use Yii;
use yii\console\Controller;
use yii\console\Exception;
use yii\console\ExitCode;
use yii\helpers\ArrayHelper;
use yii\helpers\Console;
use common\components\swoole\Server;

class SwooleController extends Controller
{
	/**
	 * @throws Exception
	 */
	public function init()
	{
		if (!extension_loaded('swoole')) {
			$this->stderr('Swoole is not installed');
			throw new Exception('Swoole is not installed');
		}
		$this->stdout('A PHP program based on Swoole' . PHP_EOL, Console::BOLD);
		$this->stdout('Swoole version:' . SWOOLE_VERSION . PHP_EOL);
		$this->stdout('PHP version:' . PHP_VERSION . PHP_EOL);
		Server::run($this);
	}

	public function actionIndex()
	{
		return ExitCode::OK;
	}

	/**
	 * @param \Swoole\Server $server
	 */
	public function onInit($server)
	{
		Server::setProcessName('php-ms');
	}

	/**
	 * @param \Swoole\Server $server
	 */
	public function onStart($server)
	{
		Server::setProcessName('php-sm');
	}

	/**
	 * @param \Swoole\Server $server
	 * @param $workerId
	 */
	public function onWorkerStart($server, $workerId)
	{
		Server::setProcessName('php-sw');
	}

	/**
	 * @param \Swoole\Server $server
	 * @param $taskId
	 * @param $from_id
	 * @param $data
	 * @link https://wiki.swoole.com/wiki/page/50.html
	 */
	public function onReceive($server, $taskId, $from_id, $data)
	{
		/**
		 * 必须要有close，不然客户端会一直等待，先返回响应数据，再执行异步长时间任务
		 */
		$data = json_decode($data, true);
		if (!empty($data)) {
			$user = User::findIdentityByAccessToken(ArrayHelper::getValue($data, 'accessToken'));
			if ($user) {
				$server->task(['user' => $user, 'data' => $data]);
			}
			$server->send($taskId, 'success', $from_id);
			$server->close($taskId);
		} else {
			$server->send($taskId, 'fail', $from_id);
			$server->close($taskId);
		}
	}

	/**
	 * task进程接收任务
	 * @param \Swoole\Server $server
	 * @param $task_id string 进程id
	 * @param $from_id string 来源worker进程id
	 * @param $data
	 * @link https://wiki.swoole.com/wiki/page/54.html
	 */
	public function onTask($server, $task_id, $from_id, $data)
	{
		echo $task_id . PHP_EOL;
		try {
			switch (ArrayHelper::getValue($data, 'data.action')) {
				case 'userIncarnation':
					$result = self::userIncarnationTask($data);
					break;
				case 'egoDifferences':
					$result = self::userEgoDifferences($data);
					break;
			}
			$taskData['status'] = 'success';
			$taskData['message'] = $result;
		} catch (\Exception $exception) {
			echo $exception->__toString();
			$taskData['status'] = 'fail';
			$taskData['message'] = $exception->getMessage();
		}
		$server->finish(json_encode($taskData));
		Yii::getLogger()->flush(true);
	}

	/**
	 * @param \Swoole\Server $server
	 * @param $taskId
	 * @param $data
	 * @link https://wiki.swoole.com/wiki/page/136.html
	 */
	public function onFinish($server, $taskId, $data)
	{
		echo $data . PHP_EOL;
	}

	/**
	 * @param \Swoole\Server $server
	 * @link https://wiki.swoole.com/wiki/page/p-event/onShutdown.html
	 */
	public function onShutdown($server)
	{
		echo $server->master_pid . ' existed' . PHP_EOL;
	}

	/**
	 * @param $taskData
	 * @return array
	 * @throws \Exception
	 */
	public static function userIncarnationTask($taskData)
	{
		Yii::error($taskData);
		$user = ArrayHelper::getValue($taskData, 'user');
		if (!$user) {
			throw new \Exception('用户accessToken验证失败');
		}
		$approves = Approve::find()->where(['user_id' => $user->getId()])->indexBy('incarnation_id')->all();
		$immerses = Immerse::find()->where(['user_id' => $user->getId()])->indexBy('incarnation_id')->all();
		$result = [];
		foreach ($approves as $incarnationID => $approve) {
			$approveGrades = $approve->grades;
			$immerseGrades = $immerses[$incarnationID]->grades;
			$userIncarnationGrades = new UserIncarnationGrades();
			$userIncarnationGrades->user_id = $user->getId();
			$userIncarnationGrades->incarnation_id = $incarnationID;
			$userIncarnationGrades->grades = ($approveGrades + $immerseGrades) / 2;
			$userIncarnationGrades->save();
			$result[] = $userIncarnationGrades;
		}
		return $result;
	}

	/**
	 * @param $taskData
	 * @return array
	 * @throws \Exception
	 */
	public static function userEgoDifferences($taskData)
	{
		/**
		 * @var $user User
		 */
		$user = ArrayHelper::getValue($taskData, 'user');
		if (!$user) {
			throw new \Exception('用户accessToken验证失败');
		}
		$virtualEgos = EgoAnswer::find()->joinWith(['question'])->where([EgoAnswer::tableName() . '.user_id' => $user->getId()])->andFilterWhere(['not', [EgoAnswer::tableName() . '.incarnation_id' => -1]])->all();
		if (!$virtualEgos) {
			throw new \Exception('虚拟自我答题为空');
		}
		$realisticEgos = EgoAnswer::find()->joinWith(['question'])->where([EgoAnswer::tableName() . '.user_id' => $user->getId(), EgoAnswer::tableName() . '.incarnation_id' => -1])->all();
		if (!$realisticEgos) {
			throw new \Exception('现实自我答题为空');
		}
		$realisticEgoGrades = [];
		foreach ($realisticEgos as $realisticEgo) {
			$questionType = $realisticEgo->question->type;
			if (!isset($realisticEgoGrades[$questionType])) {
				$realisticEgoGrades[$questionType] = 0;
			}
			$realisticEgoGrades[$questionType] = $realisticEgoGrades[$questionType] + $realisticEgo->grades;
		}
		$virtualEgoGrades = [];
		foreach ($virtualEgos as $virtualEgo) {
			$incarnationID = $virtualEgo->incarnation_id;
			if (!isset($virtualEgoGrades[$incarnationID])) {
				$virtualEgoGrades[$incarnationID] = [];
			}
			$questionType = $virtualEgo->question->type;
			if (!isset($virtualEgoGrades[$incarnationID][$questionType])) {
				$virtualEgoGrades[$incarnationID][$questionType] = 0;
			}
			$virtualEgoGrades[$incarnationID][$questionType] = $virtualEgoGrades[$incarnationID][$questionType] + $virtualEgo->grades;
		}
		$egoDifference = [];
		foreach ($virtualEgoGrades as $incarnationID => $virtualEgoGrade) {
			foreach ($virtualEgoGrade as $questionType => $virtualGrades) {
				$realisticGrades = $realisticEgoGrades[$questionType];
				$egoDifference[] = [
					'user_id' => $user->getId(),
					'incarnation_id' => $incarnationID,
					'type' => $questionType,
					'grades' => $virtualGrades - $realisticGrades
				];
			}
		}
		EgoDifferences::getDb()->createCommand()->batchInsert(EgoDifferences::tableName(), ['user_id', 'incarnation_id', 'type', 'grades'], $egoDifference)->execute();
		return $egoDifference;
	}

	public static function divideIntoGroups($data)
	{

	}
}