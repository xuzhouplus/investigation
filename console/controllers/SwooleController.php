<?php


namespace console\controllers;

use common\components\curl\Curl;
use common\models\Approve;
use common\models\Config;
use common\models\EgoAnswer;
use common\models\EgoDifferenceGrades;
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
		$this->stdout('Swoole:' . SWOOLE_VERSION . PHP_EOL);
		$this->stdout('PHP:' . PHP_VERSION . PHP_EOL);
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
				case 'divideIntoGroups':
					$result = self::divideIntoGroups($data);
					break;
				case 'mailer':
					$result = self::mailer($data);
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
		EgoDifferenceGrades::getDb()->createCommand()->batchInsert(EgoDifferenceGrades::tableName(), ['user_id', 'incarnation_id', 'type', 'grades'], $egoDifference)->execute();
		return $egoDifference;
	}

	/**
	 * 用户分组
	 * @param $data
	 * @return bool
	 */
	public static function divideIntoGroups($data)
	{
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			$users = User::find()->where(['stage' => '0', 'step' => 4])->asArray()->all();
			$userID = ArrayHelper::getColumn($users, 'id');
			$systemRound = Config::find()->where(['name' => Config::CONFIG_ROUND_KEY])->limit(1)->one();
			$systemRound->value = $systemRound + 1;
			$systemRound->save();
			User::updateAll(['round' => $systemRound->value], ['id' => $userID]);
			self::divideIncarnationGroup($userID);
			self::divideEgoGroup($userID);
			self::divideAdvertisement();
			self::saveDivideToDatabase();
			Curl::takeCurl('post', ArrayHelper::getValue($data, 'data.callback'), ArrayHelper::getValue($data, 'data.lock'));
			$transaction->commit();
			return true;
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			var_dump($exception->__toString());
			$transaction->rollBack();
			return false;
		}
	}

	/**
	 * 根据用户化身得分按大小分组，分值为3的不参与分组
	 * @param $users
	 */
	public static function divideIncarnationGroup($users)
	{
		/**
		 * @var $userIncarnationGrades UserIncarnationGrades
		 */
		$query = UserIncarnationGrades::find();
		$query->andFilterWhere(['user_id' => $users]);
		foreach ($query->each() as $userIncarnationGrades) {
			// 数据从服务端中以 100 个为一组批量获取，
			// 但是 $user 代表 user 表里的一行数据
			if ($userIncarnationGrades->grades > 3) {
				Yii::$app->cache->set('incarnation_divide_' . $userIncarnationGrades->user_id, 1);
				Yii::$app->redis->lPush('incarnation_divide_larger', json_encode($userIncarnationGrades));
			} else if ($userIncarnationGrades->grades < 3) {
				Yii::$app->cache->set('incarnation_divide_' . $userIncarnationGrades->user_id, 2);
				Yii::$app->redis->lPush('incarnation_divide_smaller', json_encode($userIncarnationGrades));
			} else {
				Yii::$app->cache->set('incarnation_divide_' . $userIncarnationGrades->user_id, 3);
				Yii::$app->redis->lPush('incarnation_divide_middle', json_encode($userIncarnationGrades));
			}
		}
	}

	/**
	 * 根据用户自我差异按正负、大小分组，按绝对值分组，分值0不参与分组
	 * @param $users
	 */
	public static function divideEgoGroup($users)
	{
		/**
		 * @var $userIncarnationGrades UserIncarnationGrades
		 */
		//查询所有分值大于0的用户，设置分组为正，再按从大到小不重复取用户，用户数为一半
		$query = EgoDifferenceGrades::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['>', ['grades', 0]]);
		$query->orderBy(['grades' => SORT_DESC]);
		$positiveDivideCount = $query->count();
		$positiveDivideHalf = ceil($positiveDivideCount / 2);
		$divideCount = 0;
		foreach ($query->each() as $userIncarnationGrades) {
			$divideCount++;
			$userEgoDivide = Yii::$app->cache->get('ego_divide_' . $userIncarnationGrades->user_id);
			if (!$userEgoDivide) {
				if ($divideCount <= $positiveDivideHalf) {
					Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 1);
					Yii::$app->redis->rPush('ego_divide_positive_larger', json_encode($userIncarnationGrades));
				} else {
					Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 2);
					Yii::$app->redis->rPush('ego_divide_positive_smaller', json_encode($userIncarnationGrades));
				}
			}
		}
		//查询所有分值小于0的用户，按分值倒序排列，再按从小到大不重复取用户，用户数为一半
		$query = EgoDifferenceGrades::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['<', ['grades', 0]]);
		$query->orderBy(['grades' => SORT_ASC]);
		$negativeDivideCount = $query->count();
		$negativeDivideHalf = ceil($negativeDivideCount / 2);
		$divideCount = 0;
		foreach ($query->each() as $userIncarnationGrades) {
			$divideCount++;
			$userEgoDivide = Yii::$app->cache->get('ego_divide_' . $userIncarnationGrades->user_id);
			if (!$userEgoDivide) {
				if ($divideCount <= $negativeDivideHalf) {
					Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 3);
					Yii::$app->redis->rPush('ego_divide_negative_larger', json_encode($userIncarnationGrades));
				} else {
					Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 4);
					Yii::$app->redis->rPush('ego_divide_negative_smaller', json_encode($userIncarnationGrades));
				}
			}
		}
		//查询所有分值为0的用户，设置分组为0，即不参与分组
		$query = EgoDifferenceGrades::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['grades', 0]);
		foreach ($query->each() as $userIncarnationGrades) {
			$userEgoDivide = Yii::$app->cache->get('ego_divide_' . $userIncarnationGrades->user_id);
			if (!$userEgoDivide) {
				Yii::$app->cache->set('ego_divide_' . $userIncarnationGrades->user_id, 5);
				Yii::$app->redis->rPush('ego_divide_negative_middle', json_encode($userIncarnationGrades));
			}
		}
	}

	/**
	 * 随机一半用户是否有广告，从key指定的redis列表中获取用户角色信息，从左获取一个然后再从右获取一个
	 */
	public static function divideAdvertisement()
	{
		/**
		 * @var $userIncarnationGrades UserIncarnationGrades
		 */
		$divides = ['ego_divide_positive_larger', 'ego_divide_positive_smaller', 'ego_divide_negative_larger', 'ego_divide_negative_smaller'];
		foreach ($divides as $divide) {
			$listLength = Yii::$app->redis->lLen($divide);
			$halfLength = ceil($listLength / 2);
			$indexLength = 0;
			while (true) {
				$leftItem = Yii::$app->redis->lPop($divide);
				if ($leftItem) {
					if ($indexLength <= $halfLength) {
						$indexLength++;
						$userIncarnationGrades = json_decode($leftItem);
						Yii::$app->cache->set('advertisement_divide_' . $userIncarnationGrades->user_id, 1);
						Yii::$app->cache->set('advertisement_incarnation_' . $userIncarnationGrades->user_id, $userIncarnationGrades->incarnation_id);
						Yii::$app->redis->lPush('advertisement_divide_with', $leftItem);
						$rightItem = Yii::$app->redis->rPop($divide);
						$indexLength++;
						if ($rightItem) {
							$userIncarnationGrades = json_decode($rightItem);
							Yii::$app->cache->set('advertisement_divide_' . $userIncarnationGrades->user_id, 1);
							Yii::$app->cache->set('advertisement_incarnation_' . $userIncarnationGrades->user_id, $userIncarnationGrades->incarnation_id);
							Yii::$app->redis->lPush('advertisement_divide_with', $rightItem);
						}
					} else {
						$userIncarnationGrades = json_decode($leftItem);
						Yii::$app->cache->set('advertisement_divide_' . $userIncarnationGrades->user_id, 2);
						Yii::$app->cache->set('advertisement_incarnation_' . $userIncarnationGrades->user_id, $userIncarnationGrades->incarnation_id);
						Yii::$app->redis->lPush('advertisement_divide_without', $leftItem);
					}
				} else {
					break;
				}
			}
		}
	}

	/**
	 * 保存分组数据到数据库
	 */
	public static function saveDivideToDatabase()
	{
		/**
		 * @var $userIncarnationGrades UserIncarnationGrades
		 */
		//化身认同大
		while ($item = Yii::$app->redis->rPop('incarnation_divide_larger')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->incarnation_divide = 1;
			$user->save();
		}
		//化身认同小
		while ($item = Yii::$app->redis->rPop('incarnation_divide_smaller')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->incarnation_divide = 2;
			$user->save();
		}
		//化身认同中间
		while ($item = Yii::$app->redis->rPop('incarnation_divide_middle')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->incarnation_divide = 0;
			$user->save();
		}
		//情绪差异正大
		while ($item = Yii::$app->redis->rPop('ego_divide_positive_smaller')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->ego_divide = 1;
			$user->save();
		}
		//情绪差异正小
		while ($item = Yii::$app->redis->rPop('ego_divide_positive_smaller')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->ego_divide = 2;
			$user->save();
		}
		//情绪差异负大
		while ($item = Yii::$app->redis->rPop('ego_divide_negative_larger')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->ego_divide = 3;
			$user->save();
		}
		//情绪差异负小
		while ($item = Yii::$app->redis->rPop('ego_divide_negative_smaller')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->ego_divide = 4;
			$user->save();
		}
		//情绪差异中
		while ($item = Yii::$app->redis->rPop('ego_divide_negative_middle')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->ego_divide = 0;
			$user->save();
		}
		//广告有
		while ($item = Yii::$app->redis->rPop('advertisement_divide_with')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->advertisement_divide = 1;
			$user->incarnation_id=$userIncarnationGrades->incarnation_id;
			$user->save();
		}
		//广告无
		while ($item = Yii::$app->redis->rPop('advertisement_divide_without')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			$user->advertisement_divide = 2;
			$user->incarnation_id=$userIncarnationGrades->incarnation_id;
			$user->save();
		}
	}

	/**
	 * 发送邮件
	 * @param $data array
	 * user User对象
	 * data 请求参数
	 * data.param.text 邮件内容
	 * data.param.view 邮件模板
	 * @return bool
	 */
	public static function mailer($data)
	{
		/**
		 * @var $user User
		 */
		$user = ArrayHelper::getValue($data, 'user');
		$view = ArrayHelper::getValue($data, 'data.view');
		if ($view) {
			$mail = Yii::$app->mailer->compose($view, ['user' => ArrayHelper::getValue($data, 'user'), 'params' => ArrayHelper::getValue($data, 'data.params')]);
		} else {
			$mail = Yii::$app->mailer->compose();
			$mail->setTextBody(ArrayHelper::getValue($data, 'data.params.text'));
		}
		$mail->setTo($user->email);
		$mail->setSubject(ArrayHelper::getValue($data, 'data.params.topic'));
		return $mail->send();
	}
}