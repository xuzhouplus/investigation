<?php


namespace console\controllers;

use common\components\curl\Curl;
use common\models\AdvertisementAnswer;
use common\models\AdvertisementQuestion;
use common\models\Approve;
use common\models\Config;
use common\models\EgoAnswer;
use common\models\EgoDifferenceGrades;
use common\models\EgoQuestion;
use common\models\EmotionAnswer;
use common\models\EmotionQuestion;
use common\models\Export;
use common\models\Immerse;
use common\models\RoundMean;
use common\models\User;
use common\models\UserIncarnationGrades;
use Yii;
use yii\console\Controller;
use yii\console\Exception;
use yii\console\ExitCode;
use yii\data\Sort;
use yii\helpers\ArrayHelper;
use yii\helpers\Console;
use common\components\swoole\Server;
use yii\log\Logger;

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
			$user = User::findIdentityByAccessToken(ArrayHelper::getValue($data, 'access_token'));
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
		echo 'task id:' . $task_id . PHP_EOL;
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
		if (ArrayHelper::getValue($data, 'data.callback')) {
			$callback = ArrayHelper::getValue($data, 'data');
			Curl::takeCurl('post', ArrayHelper::getValue($data, 'data.callback'), array_merge($callback, $taskData));
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
		//自然大小排序算法
		//计算现实自我每种类型得分总和
		$realisticEgoGrades = [];
		foreach ($realisticEgos as $realisticEgo) {
			$questionType = $realisticEgo->question->type;
			if (!isset($realisticEgoGrades[$questionType])) {
				$realisticEgoGrades[$questionType] = 0;
			}
			$realisticEgoGrades[$questionType] = $realisticEgoGrades[$questionType] + $realisticEgo->grades;
		}
		//计算虚拟自我每种类型得分总和
		$virtualEgoGrades = [];
		foreach ($virtualEgos as $virtualEgo) {
			$incarnationID = $virtualEgo->ego_incarnation;
			if (!isset($virtualEgoGrades[$incarnationID])) {
				$virtualEgoGrades[$incarnationID] = [];
			}
			$questionType = $virtualEgo->question->type;
			if (!isset($virtualEgoGrades[$incarnationID][$questionType])) {
				$virtualEgoGrades[$incarnationID][$questionType] = 0;
			}
			$virtualEgoGrades[$incarnationID][$questionType] = $virtualEgoGrades[$incarnationID][$questionType] + $virtualEgo->grades;
		}
		//计算虚拟和现实的差值
		$egoDifference = [];
		foreach ($virtualEgoGrades as $incarnationID => $virtualEgoGrade) {
			foreach ($virtualEgoGrade as $questionType => $virtualGrades) {
				$realisticGrades = $realisticEgoGrades[$questionType];
				$grades = $virtualGrades - $realisticGrades;
				if ($grades > 0) {
					$sign = 1;
				} elseif ($grades < 0) {
					$sign = 2;
				} else {
					$sign = 3;
				}
				$egoDifference[] = [
					'user_id' => $user->getId(),
					'incarnation_id' => $incarnationID,
					'type' => $questionType,
					'sign' => $sign,
					'grades' => abs($grades)
				];
			}
		}
		EgoDifferenceGrades::getDb()->createCommand()->batchInsert(EgoDifferenceGrades::tableName(), ['user_id', 'incarnation_id', 'type', 'sign', 'grades'], $egoDifference)->execute();
		return $egoDifference;
	}

	/**
	 * 用户分组
	 * @param $data
	 * @return bool
	 * @throws \yii\db\Exception
	 */
	public static function divideIntoGroups($data)
	{
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			$users = User::find()->select(['id', 'username', 'email', 'gender', 'age'])->where(['stage' => '1', 'step' => 3, 'role' => User::ROLE_USER])->all();
			$userID = ArrayHelper::getColumn($users, 'id');
			$systemRound = Config::find()->where(['name' => Config::CONFIG_ROUND_KEY])->limit(1)->one();
			self::divideIncarnationGroup($userID);
			self::divideEgoGroup($userID);
			self::divideAdvertisement();
			self::saveDivideToDatabase($systemRound->value + 1);
			self::saveExportDivide($users, $systemRound->value + 1);
			$systemRound->value = $systemRound->value + 1;
			$systemRound->save();
			User::updateAll(['round' => $systemRound->value, 'step' => 4, 'stage' => 2], ['id' => $userID]);
			$transaction->commit();
			//发送通知邮件
			if (ArrayHelper::getValue(Yii::$app->params, 'emailNotify')) {
				foreach ($users as $user) {
					self::mailer([
						'user' => $user,
						'data' => [
							'view' => 'Invitation'
						]
					]);
				}
			}
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
		$query->andFilterWhere(['!=', 'grades', 3]);
		$query->orderBy(['grades' => SORT_DESC]);
		foreach ($query->each() as $userIncarnationGrades) {
			// 数据从服务端中以 100 个为一组批量获取，
			// $userIncarnationGrades代表 user 表里的一行数据
			if (!Yii::$app->cache->get('IDENTIFY_DIVIDE_' . $userIncarnationGrades->user_id)) {
				if ($userIncarnationGrades->grades > 3) {
					Yii::$app->cache->set('IDENTIFY_DIVIDE_' . $userIncarnationGrades->user_id, 1);
					Yii::$app->cache->set('IDENTIFY_INCARNATION_' . $userIncarnationGrades->user_id, $userIncarnationGrades->incarnation_id);
					Yii::$app->redis->lpush('INV_CACHE:IDENTIFY_DIVIDE_LARGER', json_encode(ArrayHelper::toArray($userIncarnationGrades)));
				} else {
					Yii::$app->cache->set('IDENTIFY_DIVIDE_' . $userIncarnationGrades->user_id, 2);
					Yii::$app->cache->set('IDENTIFY_INCARNATION_' . $userIncarnationGrades->user_id, $userIncarnationGrades->incarnation_id);
					Yii::$app->redis->lpush('INV_CACHE:IDENTIFY_DIVIDE_SMALLER', json_encode(ArrayHelper::toArray($userIncarnationGrades)));
				}
			}
		}
		/**
		 * @var $userIncarnationGrades UserIncarnationGrades
		 */
		$query = UserIncarnationGrades::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['grades' => 3]);
		foreach ($query->each() as $userIncarnationGrades) {
			// 数据从服务端中以 100 个为一组批量获取，
			// $userIncarnationGrades代表 user 表里的一行数据
			if (!Yii::$app->cache->get('IDENTIFY_DIVIDE_' . $userIncarnationGrades->user_id)) {
				Yii::$app->cache->set('IDENTIFY_DIVIDE_' . $userIncarnationGrades->user_id, 3);
				Yii::$app->redis->lpush('INV_CACHE:IDENTIFY_DIVIDE_MIDDLE', json_encode(ArrayHelper::toArray($userIncarnationGrades)));
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
		 * @var $egoDifferenceGrades EgoDifferenceGrades
		 */
		//查询所有分值不等于0的用户
		$query = EgoDifferenceGrades::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['!=', 'grades', 0]);
		$query->orderBy(['grades' => SORT_DESC]);
		$userCount = $query->count();
		$loopIndex = 0;
		foreach ($query->each() as $egoDifferenceGrades) {
			$userEgoDivide = Yii::$app->cache->get('EGO_DIVIDE_SIGN_' . $egoDifferenceGrades->user_id);
			if (!$userEgoDivide) {
				if ($egoDifferenceGrades->sign == EgoDifferenceGrades::SIGN_POSITIVE) {
					Yii::$app->cache->set('EGO_DIVIDE_SIGN_' . $egoDifferenceGrades->user_id, 1);
					Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_POSITIVE', json_encode(ArrayHelper::toArray($egoDifferenceGrades)));
				} elseif ($egoDifferenceGrades->sign == EgoDifferenceGrades::SIGN_NEGATIVE) {
					Yii::$app->cache->set('EGO_DIVIDE_SIGN_' . $egoDifferenceGrades->user_id, 1);
					Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_NEGATIVE', json_encode(ArrayHelper::toArray($egoDifferenceGrades)));
				}
			}
			$loopIndex++;
			if ($loopIndex == $userCount) {
				break;
			}
		}
		//区分正分的大小
		$listLength = Yii::$app->redis->llen('INV_CACHE:EGO_DIVIDE_POSITIVE');
		$halfLength = ceil($listLength / 2);
		$popIndex = 0;
		while ($popIndex < $listLength) {
			$leftItem = Yii::$app->redis->lindex('INV_CACHE:EGO_DIVIDE_POSITIVE', $popIndex);
			$popIndex++;
			if ($leftItem) {
				if ($popIndex <= $halfLength) {
					$egoDifferenceGrades = json_decode($leftItem);
					Yii::$app->cache->set('EGO_DIVIDE_' . $egoDifferenceGrades->user_id, 1);
					Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_POSITIVE_LARGER', $leftItem);
					if ($popIndex == $halfLength) {
						Yii::$app->cache->set('EGO_POSITIVE_MEAN', $egoDifferenceGrades->grades);
					}
				} else {
					$egoDifferenceGrades = json_decode($leftItem);
					Yii::$app->cache->set('EGO_DIVIDE_' . $egoDifferenceGrades->user_id, 2);
					Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_POSITIVE_SMALLER', $leftItem);
				}
			} else {
				break;
			}
		}
		//区分负分的大小
		$listLength = Yii::$app->redis->llen('INV_CACHE:EGO_DIVIDE_NEGATIVE');
		$halfLength = ceil($listLength / 2);
		$popIndex = 0;
		while ($popIndex < $listLength) {
			$leftItem = Yii::$app->redis->lindex('INV_CACHE:EGO_DIVIDE_NEGATIVE', $popIndex);
			$popIndex++;
			if ($leftItem) {
				if ($popIndex <= $halfLength) {
					$egoDifferenceGrades = json_decode($leftItem);
					Yii::$app->cache->set('EGO_DIVIDE_' . $egoDifferenceGrades->user_id, 3);
					Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_NEGATIVE_LARGER', $leftItem);
					if ($popIndex == $halfLength) {
						Yii::$app->cache->set('EGO_NEGATIVE_MEAN', $egoDifferenceGrades->grades);
					}
				} else {
					$egoDifferenceGrades = json_decode($leftItem);
					Yii::$app->cache->set('EGO_DIVIDE_' . $egoDifferenceGrades->user_id, 4);
					Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_NEGATIVE_SMALLER', $leftItem);
				}
			} else {
				break;
			}
		}

		//查询所有分值为0的用户，设置分组为0，即不参与分组
		$query = EgoDifferenceGrades::find();
		$query->andFilterWhere(['user_id' => $users]);
		$query->andFilterWhere(['grades' => 0]);
		foreach ($query->each() as $egoDifferenceGrades) {
			$userEgoDivide = Yii::$app->cache->get('EGO_DIVIDE_' . $egoDifferenceGrades->user_id);
			if (!$userEgoDivide) {
				Yii::$app->cache->set('EGO_DIVIDE_' . $egoDifferenceGrades->user_id, 5);
				Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE', json_encode(ArrayHelper::toArray($egoDifferenceGrades)));
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
		$divides = ['INV_CACHE:EGO_DIVIDE_POSITIVE_LARGER', 'INV_CACHE:EGO_DIVIDE_POSITIVE_SMALLER', 'INV_CACHE:EGO_DIVIDE_NEGATIVE_LARGER', 'INV_CACHE:EGO_DIVIDE_NEGATIVE_SMALLER'];
		foreach ($divides as $divide) {
			$listLength = Yii::$app->redis->llen($divide);
			$popIndex = 0;
			while ($popIndex < $listLength) {
				$leftItem = Yii::$app->redis->lindex($divide, $popIndex);
				$popIndex++;
				var_dump($popIndex . '//' . $leftItem);
				if ($leftItem) {
					if ($popIndex % 2 == 1) {
						$userIncarnationGrades = json_decode($leftItem);
						Yii::$app->cache->set('ADVERTISEMENT_DIVIDE_' . $userIncarnationGrades->user_id, 1);
						Yii::$app->cache->set('ADVERTISEMENT_INCARNATION_' . $userIncarnationGrades->user_id, $userIncarnationGrades->incarnation_id);
						Yii::$app->redis->lpush('INV_CACHE:ADVERTISEMENT_DIVIDE_WITH', $leftItem);
					} else {
						$userIncarnationGrades = json_decode($leftItem);
						Yii::$app->cache->set('ADVERTISEMENT_DIVIDE_' . $userIncarnationGrades->user_id, 2);
						Yii::$app->cache->set('ADVERTISEMENT_INCARNATION_' . $userIncarnationGrades->user_id, $userIncarnationGrades->incarnation_id);
						Yii::$app->redis->lpush('INV_CACHE:ADVERTISEMENT_DIVIDE_WITHOUT', $leftItem);
					}
				} else {
					break;
				}
			}
		}
	}

	/**
	 * 保存分组数据到数据库
	 * @param $round
	 */
	public static function saveDivideToDatabase($round)
	{
		/**
		 * @var $userIncarnationGrades UserIncarnationGrades
		 */
		//化身认同大
		while ($item = Yii::$app->redis->rpop('INV_CACHE:IDENTIFY_DIVIDE_LARGER')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			if (!$user) {
				continue;
			}
			$user->identify_divide = 1;
			$user->identify_incarnation = $userIncarnationGrades->incarnation_id;
			$user->save();
		}
		//化身认同小
		while ($item = Yii::$app->redis->rpop('INV_CACHE:IDENTIFY_DIVIDE_SMALLER')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			if (!$user) {
				continue;
			}
			$user->identify_divide = 2;
			$user->identify_incarnation = $userIncarnationGrades->incarnation_id;
			$user->save();
		}
		//化身认同中间
		while ($item = Yii::$app->redis->rpop('INV_CACHE:IDENTIFY_DIVIDE_MIDDLE')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			if (!$user) {
				continue;
			}
			$user->identify_divide = 3;
			$user->identify_incarnation = $userIncarnationGrades->incarnation_id;
			$user->save();
		}
		//自我差异正大
		$saveData = [];
		while ($item = Yii::$app->redis->rpop('INV_CACHE:EGO_DIVIDE_POSITIVE_LARGER')) {
			$userIncarnationGrades = json_decode($item);
			$saveData[] = $userIncarnationGrades->user_id;
		}
		if (!empty($saveData)) {
			User::updateAll(['ego_divide' => 1], ['id' => $saveData]);
		}
		//自我差异正小
		$saveData = [];
		while ($item = Yii::$app->redis->rpop('INV_CACHE:EGO_DIVIDE_POSITIVE_SMALLER')) {
			$userIncarnationGrades = json_decode($item);
			$saveData[] = $userIncarnationGrades->user_id;
		}
		if (!empty($saveData)) {
			User::updateAll(['ego_divide' => 2], ['id' => $saveData]);
		}
		//自我差异负大
		$saveData = [];
		while ($item = Yii::$app->redis->rpop('INV_CACHE:EGO_DIVIDE_NEGATIVE_LARGER')) {
			$userIncarnationGrades = json_decode($item);
			$saveData[] = $userIncarnationGrades->user_id;
		}
		if (!empty($saveData)) {
			User::updateAll(['ego_divide' => 3], ['id' => $saveData]);
		}
		//自我差异负小
		$saveData = [];
		while ($item = Yii::$app->redis->rpop('INV_CACHE:EGO_DIVIDE_NEGATIVE_SMALLER')) {
			$userIncarnationGrades = json_decode($item);
			$saveData[] = $userIncarnationGrades->user_id;
		}
		if (!empty($saveData)) {
			User::updateAll(['ego_divide' => 4], ['id' => $saveData]);
		}
		//自我差异中
		$saveData = [];
		while ($item = Yii::$app->redis->rpop('INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE')) {
			$userIncarnationGrades = json_decode($item);
			$saveData[] = $userIncarnationGrades->user_id;
		}
		if (!empty($saveData)) {
			User::updateAll(['ego_divide' => 5], ['id' => $saveData]);
		}
		//广告有
		while ($item = Yii::$app->redis->rpop('INV_CACHE:ADVERTISEMENT_DIVIDE_WITH')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			if (!$user) {
				continue;
			}
			$user->advertisement_divide = 1;
			$user->ego_incarnation = $userIncarnationGrades->incarnation_id;
			$user->save();
		}
		//广告无
		while ($item = Yii::$app->redis->rpop('INV_CACHE:ADVERTISEMENT_DIVIDE_WITHOUT')) {
			$userIncarnationGrades = json_decode($item);
			$user = User::findOne($userIncarnationGrades->user_id);
			if (!$user) {
				continue;
			}
			$user->advertisement_divide = 2;
			$user->ego_incarnation = $userIncarnationGrades->incarnation_id;
			$user->save();
		}
		//分组正负大小中间值
		$roundMean = RoundMean::find()->where(['round' => $round])->limit(1)->one();
		if (empty($roundMean)) {
			$roundMean = new RoundMean();
		}
		$roundMean->round = $round;
		$roundMean->positive_mean = Yii::$app->cache->get('EGO_POSITIVE_MEAN');
		$roundMean->negative_mean = Yii::$app->cache->get('EGO_NEGATIVE_MEAN');
		$roundMean->save();
	}

	/**
	 * @param $users User[]
	 * @param $round
	 */
	public static function saveExportDivide($users, $round)
	{
		//自我差异问题总数
		$egoQuestionCount = EgoQuestion::find()->count('id');
		//情绪量化问题总数
		$emotionQuestionCount = EmotionQuestion::find()->count('id');
		//化身认同分组设置
		$identifyLevelList = ArrayHelper::map(User::IDENTIFY_DIVIDE_LEVEL, 'value', 'key');
		//自我差异分组设置
		$egoLevelList = ArrayHelper::map(User::EGO_DIVIDE_LEVEL, 'value', 'key');
		//广告强弱分组设置
		$advLevelList = ArrayHelper::map(User::ADVERTISEMENT_DIVIDE_LEVEL, 'value', 'key');
		//遍历用户信息
		foreach ($users as $user) {
			//化身认同分组结果标识
			$identifyDivide = Yii::$app->cache->get('IDENTIFY_DIVIDE_' . $user->id);
			//化身认同分组落在的化身id
			$identifyIncarnation = Yii::$app->cache->get('IDENTIFY_INCARNATION_' . $user->id);
			//自我差异分组结果标识
			$egoDivide = Yii::$app->cache->get('EGO_DIVIDE_' . $user->id);
			//广告强弱分组结果标识
			$advDivide = Yii::$app->cache->get('ADVERTISEMENT_DIVIDE_' . $user->id);
			//广告强弱分组落在的化身id
			$advIncarnation = Yii::$app->cache->get('ADVERTISEMENT_INCARNATION_' . $user->id);
			//如果数据已存在则更新，不存在则新建
			$exportData = Export::find()->where(['user_id' => $user->id, 'round' => $round])->limit(1)->one();
			if (!$exportData) {
				$exportData = new Export();
			}
			//用户id
			$exportData->user_id = $user->id;
			//分组轮次
			$exportData->round = $round;
			//总分组标识
			$exportData->divide_stamp = ArrayHelper::getValue($identifyLevelList, $identifyDivide) . ArrayHelper::getValue($egoLevelList, $egoDivide) . ArrayHelper::getValue($advLevelList, $advDivide);
			//用户的化身认同答题得分
			if ($identifyIncarnation) {
				//分组到高、低的用户
				$approve = Approve::find()->select(['grades'])->where(['user_id' => $user->id, 'incarnation_id' => $identifyIncarnation])->limit(1)->one();
				$immerse = Immerse::find()->select(['grades'])->where(['user_id' => $user->id, 'incarnation_id' => $identifyIncarnation])->limit(1)->one();
				$exportData->approve_grades = $approve->grades;
				$exportData->immerse_grades = $immerse->grades;
			} else {
				//分组到中的用户，即得分平均值为3的用户
				$exportData->approve_grades = 3;
				$exportData->immerse_grades = 3;
			}
			//现实自我
			$realityEgoTypeAnswers = [];
			$realityEgoAnswers = EgoAnswer::find()->where(['user_id' => $user->id, 'incarnation_id' => -1])->limit($egoQuestionCount)->all();
			//把答题得分按照问题类型组装数据
			foreach ($realityEgoAnswers as $egoAnswer) {
				$realityEgoTypeAnswers[$egoAnswer->question->type][] = $egoAnswer->grades;
			}
			//外倾
			$extravertReality = ArrayHelper::getValue($realityEgoTypeAnswers, 'extravert');
			$exportData->extravert_reality1 = reset($extravertReality);
			$exportData->extravert_reality2 = end($extravertReality);
			//宜人
			$pleasantReality = ArrayHelper::getValue($realityEgoTypeAnswers, 'pleasant');
			$exportData->pleasant_reality1 = reset($pleasantReality);
			$exportData->pleasant_reality2 = end($pleasantReality);
			//尽责
			$conscientiousReality = ArrayHelper::getValue($realityEgoTypeAnswers, 'conscientious');
			$exportData->conscientious_reality1 = reset($conscientiousReality);
			$exportData->conscientious_reality2 = end($conscientiousReality);
			//情稳
			$nervousReality = ArrayHelper::getValue($realityEgoTypeAnswers, 'nervous');
			$exportData->nervous_reality1 = reset($nervousReality);
			$exportData->nervous_reality2 = end($nervousReality);
			//开放
			$openReality = ArrayHelper::getValue($realityEgoTypeAnswers, 'open');
			$exportData->open_reality1 = reset($openReality);
			$exportData->open_reality2 = end($openReality);
			//虚拟自我
			$inventedEgoTypeAnswers = [];
			$inventedEgoAnswers = EgoAnswer::find()->where(['user_id' => $user->id, 'incarnation_id' => $advIncarnation])->limit($egoQuestionCount)->all();
			//把答题得分按照问题类型组装数据
			foreach ($inventedEgoAnswers as $egoAnswer) {
				$inventedEgoTypeAnswers[$egoAnswer->question->type][] = $egoAnswer->grades;
			}
			//外倾
			$extravertInvented = ArrayHelper::getValue($realityEgoTypeAnswers, 'extravert');
			$exportData->extravert_invented1 = reset($extravertInvented);
			$exportData->extravert_invented2 = end($extravertInvented);
			//宜人
			$pleasantInvented = ArrayHelper::getValue($realityEgoTypeAnswers, 'pleasant');
			$exportData->pleasant_invented1 = reset($pleasantInvented);
			$exportData->pleasant_invented2 = end($pleasantInvented);
			//尽责
			$conscientiousInvented = ArrayHelper::getValue($realityEgoTypeAnswers, 'conscientious');
			$exportData->conscientious_invented1 = reset($conscientiousInvented);
			$exportData->conscientious_invented2 = end($conscientiousInvented);
			//情稳
			$nervousInvented = ArrayHelper::getValue($realityEgoTypeAnswers, 'nervous');
			$exportData->nervous_invented1 = reset($nervousInvented);
			$exportData->nervous_invented2 = end($nervousInvented);
			//开放
			$openInvented = ArrayHelper::getValue($realityEgoTypeAnswers, 'open');
			$exportData->open_invented1 = reset($openInvented);
			$exportData->open_invented2 = end($openInvented);
			//情绪量化
			$emotionTypeAnswers = [];
			//有广告强弱化身的才有情绪量化答题
			if ($advIncarnation) {
				$emotionAnswers = EmotionAnswer::find()->where(['user_id' => $user->id])->limit($emotionQuestionCount)->all();
				//把答题得分按照问题类型组装数据
				foreach ($emotionAnswers as $emotionAnswer) {
					$emotionTypeAnswers[$emotionAnswer->question->type] = $emotionAnswer->grades;
				}
			}
			//活跃
			$exportData->ego_alive = ArrayHelper::getValue($emotionTypeAnswers, 'alive') ?: 0;
			//热情
			$exportData->ego_warmth = ArrayHelper::getValue($emotionTypeAnswers, 'warmth') ?: 0;
			//快乐
			$exportData->ego_happy = ArrayHelper::getValue($emotionTypeAnswers, 'happy') ?: 0;
			//兴高采烈
			$exportData->ego_jubilant = ArrayHelper::getValue($emotionTypeAnswers, 'jubilant') ?: 0;
			//兴奋
			$exportData->ego_excited = ArrayHelper::getValue($emotionTypeAnswers, 'excited') ?: 0;
			//自豪
			$exportData->ego_proud = ArrayHelper::getValue($emotionTypeAnswers, 'proud') ?: 0;
			//欣喜
			$exportData->ego_delighted = ArrayHelper::getValue($emotionTypeAnswers, 'delighted') ?: 0;
			//精神充沛
			$exportData->ego_energetic = ArrayHelper::getValue($emotionTypeAnswers, 'energetic') ?: 0;
			//感激
			$exportData->ego_grateful = ArrayHelper::getValue($emotionTypeAnswers, 'grateful') ?: 0;
			//难过
			$exportData->ego_sad = ArrayHelper::getValue($emotionTypeAnswers, 'sad') ?: 0;
			//害怕
			$exportData->ego_scared = ArrayHelper::getValue($emotionTypeAnswers, 'scared') ?: 0;
			//紧张
			$exportData->ego_nervous = ArrayHelper::getValue($emotionTypeAnswers, 'nervous') ?: 0;
			//惊恐
			$exportData->ego_terrified = ArrayHelper::getValue($emotionTypeAnswers, 'terrified') ?: 0;
			//内疚
			$exportData->ego_guilt = ArrayHelper::getValue($emotionTypeAnswers, 'guilt') ?: 0;
			//战战兢兢
			$exportData->ego_trembled = ArrayHelper::getValue($emotionTypeAnswers, 'trembled') ?: 0;
			//恼怒
			$exportData->ego_annoyed = ArrayHelper::getValue($emotionTypeAnswers, 'annoyed') ?: 0;
			//羞愧
			$exportData->ego_ashamed = ArrayHelper::getValue($emotionTypeAnswers, 'ashamed') ?: 0;
			//易怒
			$exportData->ego_irritable = ArrayHelper::getValue($emotionTypeAnswers, 'irritable') ?: 0;
			//品牌态度
			$brandAttitudeAnswer = AdvertisementAnswer::find()->joinWith(['question'])->where([self::tableName() . '.user_id' => $user->id, AdvertisementQuestion::tableName() . '.type' => 'brandAttitude'])->all();
			if ($brandAttitudeAnswer) {
				/**
				 * @var $brandAttitude AdvertisementAnswer
				 */
				$brandAttitude = array_shift($brandAttitudeAnswer);
				$exportData->brand_attitude_a = $brandAttitude->grades;
				$brandAttitude = array_shift($brandAttitudeAnswer);
				$exportData->brand_attitude_b = $brandAttitude->grades;
				$brandAttitude = array_shift($brandAttitudeAnswer);
				$exportData->brand_attitude_c = $brandAttitude->grades;
				$brandAttitude = array_shift($brandAttitudeAnswer);
				$exportData->brand_attitude_d = $brandAttitude->grades;
			} else {
				$exportData->brand_attitude_a = 0;
				$exportData->brand_attitude_b = 0;
				$exportData->brand_attitude_c = 0;
				$exportData->brand_attitude_d = 0;
			}
			//品牌记忆
			$brandMemoryAnswer = AdvertisementAnswer::find()->joinWith(['question'])->where([self::tableName() . '.user_id' => $user->id, AdvertisementQuestion::tableName() . '.type' => 'brandMemory'])->all();
			if ($brandMemoryAnswer) {
				/**
				 * @var $brandMemory AdvertisementAnswer
				 */
				$brandMemory = array_shift($brandMemoryAnswer);
				$exportData->brand_memory_1 = $brandMemory->grades;
				$brandMemory = array_shift($brandMemoryAnswer);
				$exportData->brand_memory_2 = $brandMemory->grades;
				$brandMemory = array_shift($brandMemoryAnswer);
				$exportData->brand_memory_3 = $brandMemory->grades;
			} else {
				$exportData->brand_memory_1 = 0;
				$exportData->brand_memory_2 = 0;
				$exportData->brand_memory_3 = 0;
			}
			//性别
			$exportData->gender = $user->gender;
			//年龄
			$exportData->age = $user->age;
			//化身认同分组结果标识
			$exportData->identify_stamp = ArrayHelper::getValue($identifyLevelList, $identifyDivide) ?: 3;
			//自我差异分组结果，结果标识是放在一起的，需要拆分
			if ($egoDivide) {
				$egoDivideKey = ArrayHelper::getValue($egoLevelList, $egoDivide);
				//差异大小
				$exportData->difference_size = mb_substr($egoDivideKey, -1, 1, 'utf-8');
				//差异正负
				$exportData->difference_direction = mb_substr($egoDivideKey, -1, 1, 'utf-8');
			} else {
				//差异大小
				$exportData->difference_size = '中';
				//差异正负
				$exportData->difference_direction = '零';
			}
			//广告强弱分组
			$exportData->association_strength = ArrayHelper::getValue($advLevelList, $advDivide) ?: 0;
			$exportData->save();
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