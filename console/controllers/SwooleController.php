<?php


namespace console\controllers;

use common\models\Approve;
use common\models\Config;
use common\models\EgoAnswer;
use common\models\EgoDifferences;
use common\models\Immerse;
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
	 * 准备用户化身分组得分数据
	 * @param $taskData
	 * @return array
	 * @throws \Exception
	 */
	public static function userIncarnationTask($taskData)
	{
		/**
		 * @var $user User
		 */
		$user = ArrayHelper::getValue($taskData, 'user');
		if (!$user) {
			throw new \Exception('用户accessToken验证失败');
		}
		$approves = Approve::find()->where(['user_id' => $user->getId()])->indexBy('incarnation_id')->all();
		$immerses = Immerse::find()->where(['user_id' => $user->getId()])->indexBy('incarnation_id')->all();
		$incarnationGrades = [];
		foreach ($approves as $incarnationID => $approve) {
			$approveGrades = $approve->grades;
			$immerseGrades = $immerses[$incarnationID]->grades;
			$incarnationGrades[] = [
				'user_id' => $user->getId(),
				'incarnation_id' => $incarnationID,
				'grades' => ($approveGrades + $immerseGrades) / 2
			];
		}
		UserIncarnationGrades::getDb()->createCommand()->batchInsert(UserIncarnationGrades::tableName(), ['user_id', 'incarnation_id', 'grades'], $incarnationGrades)->execute();
		return $incarnationGrades;
	}

	/**
	 * 准备用户自我差异分组数据
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

	/**
	 * 用户分组
	 * @param $data
	 */
	public static function divideIntoGroups($data)
	{
		$users = User::find()->where(['stage' => '0'])->asArray()->all();
		$userID = ArrayHelper::getColumn($users, 'id');
		$systemRound = Config::find()->where(['name' => Config::CONFIG_ROUND_KEY])->limit(1)->one();
		User::updateAll(['round' => $systemRound->value]);
		$systemRound->value = $systemRound + 1;
		$systemRound->save();
		self::divideIncarnationGroup($userID);
		self::divideEgoGroup($userID);
	}

	/**
	 * 根据用户化身得分按大小分组，分值为3的不参与分组
	 * @param $users
	 */
	public static function divideIncarnationGroup($users)
	{
		$query = UserIncarnationGrades::find();
		$query->andFilterWhere(['user_id' => $users]);
		foreach ($query->each() as $userIncarnationGrades) {
			/**
			 * @var $userIncarnationGrades UserIncarnationGrades
			 */
			// 数据从服务端中以 100 个为一组批量获取，
			// 但是 $user 代表 user 表里的一行数据
			if ($userIncarnationGrades->grades > 3) {
				Yii::$app->cache->set('incarnation_divide_' . $userIncarnationGrades->user_id, 1);
			} else if ($userIncarnationGrades->grades < 3) {
				Yii::$app->cache->set('incarnation_divide_' . $userIncarnationGrades->user_id, 2);
			} else {
				Yii::$app->cache->set('incarnation_divide_' . $userIncarnationGrades->user_id, 0);
			}
		}
	}

	/**
	 * 根据用户自我差异按正负、大小分组，按绝对值分组，分值0不参与分组
	 * @param $users
	 */
	public static function divideEgoGroup($users)
	{
		//查询所有分值大于0的用户，设置分组为正，再按从大到小不重复取用户，用户数为一半
		$query = EgoDifferences::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['>', ['grades', 0]]);
		$query->orderBy(['grades' => SORT_DESC]);
		$positiveDivideCount = $query->count();
		$divideCount = 0;
		foreach ($query->each() as $userIncarnationGrades) {
			$divideCount++;
			$userEgoDivide = Yii::$app->cache->get('ego_divide_' . $userIncarnationGrades->user_id);
			if (!$userEgoDivide) {
				if ($divideCount <= ($positiveDivideCount / 2)) {
					Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 1);
				} else {
					Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 2);
				}
			}
		}
		//查询所有分值小于0的用户，按分值倒序排列，再按从小到大不重复取用户，用户数为一半
		$query = EgoDifferences::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['<', ['grades', 0]]);
		$query->orderBy(['grades' => SORT_ASC]);
		$negativeDivideCount = $query->count();
		$divideCount = 0;
		foreach ($query->each() as $userIncarnationGrades) {
			$divideCount++;
			$userEgoDivide = Yii::$app->cache->get('ego_divide_' . $userIncarnationGrades->user_id);
			if (!$userEgoDivide) {
				if ($divideCount <= ($negativeDivideCount / 2)) {
					Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 3);
				} else {
					Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 4);
				}
			}
		}
		//查询所有分值为0的用户，设置分组为0，即不参与分组
		$query = EgoDifferences::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['grades', 0]);
		foreach ($query->each() as $userIncarnationGrades) {
			$userEgoDivide = Yii::$app->cache->get('ego_divide_' . $userIncarnationGrades->user_id);
			if (!$userEgoDivide) {
				Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 0);
			}
		}
	}

	/**
	 * 随机一般用户是否有广告
	 * @param $users
	 */
	public static function divideAdvertisement($users)
	{

	}
}