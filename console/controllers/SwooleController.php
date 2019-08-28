<?php


namespace console\controllers;

use common\components\curl\Curl;
use common\models\Advertisement;
use common\models\AdvertisementAnswer;
use common\models\AdvertisementOption;
use common\models\AdvertisementQuestion;
use common\models\Approve;
use common\models\Config;
use common\models\EgoAnswer;
use common\models\EgoDifferenceGrades;
use common\models\EgoOption;
use common\models\EgoQuestion;
use common\models\EmotionAnswer;
use common\models\EmotionOption;
use common\models\EmotionQuestion;
use common\models\Export;
use common\models\File;
use common\models\Immerse;
use common\models\Incarnation;
use common\models\RoundMean;
use common\models\Type;
use common\models\User;
use common\models\UserIncarnationGrades;
use Yii;
use yii\console\Controller;
use yii\console\Exception;
use yii\console\ExitCode;
use yii\db\ActiveRecord;
use yii\db\TableSchema;
use yii\helpers\ArrayHelper;
use yii\helpers\Console;
use common\components\swoole\Server;

class SwooleController extends Controller
{
	public $daemonize = YII_ENV_PROD;
	/**
	 * @var $user User
	 */
	protected static $user;

	public function options($actionID)
	{
		return ['daemonize'];
	}

	public function optionAliases()
	{
		return ['d' => 'daemonize'];
	}

	/**
	 * @throws Exception
	 */
	public function init()
	{
		Yii::getLogger()->flushInterval = 1;
		if (!extension_loaded('swoole')) {
			$this->stderr('Swoole is not installed');
			throw new Exception('Swoole is not installed');
		}
		$this->stdout('A PHP program based on Yii2 with Swoole' . PHP_EOL, Console::BOLD);
		$this->stdout('Yii2:' . Yii::getVersion() . PHP_EOL);
		$this->stdout('Swoole:' . SWOOLE_VERSION . PHP_EOL);
		$this->stdout('PHP:' . PHP_VERSION . PHP_EOL);
	}

	public function actionIndex()
	{
		Server::run($this);
		return ExitCode::OK;
	}

	public function actionDivide()
	{
		$user = User::find()->where(['role' => User::ROLE_ADMINISTRATOR])->limit(1)->one();
		Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/user/divide', [
			'access_token' => $user->generateAccessToken()
		]);
		return ExitCode::OK;
	}

	public function actionRedivide($round)
	{
		if (!$round) {
			$this->stderr('no parameter "round"' . PHP_EOL);
			return ExitCode::DATAERR;
		}
		try {
			$round = intval($round);
			$this->stdout('redivide groups ' . $round . PHP_EOL);
			self::divideIntoGroups(['round' => $round]);
			foreach (Export::find()->where(['round' => $round])->each() as $item) {
				try {
					/**
					 * @var $item Export
					 */
					$this->stdout('preparing export data for ' . $item->user_id . PHP_EOL);
					self::$user = User::find()->where(['id' => $item->user_id])->limit(1)->one();
					self::emotion(['round' => $round]);
					self::brandAttitude(['round' => $round]);
					self::brandMemory(['round' => $round]);
				} catch (\Exception $exception) {
					$this->stderr($exception->getMessage() . PHP_EOL);
					$this->stdout($exception->__toString() . PHP_EOL);
				}
			}
			return ExitCode::OK;
		} catch (\Exception $exception) {
			$this->stderr($exception->getMessage() . PHP_EOL);
			$this->stdout($exception->__toString() . PHP_EOL);
			return ExitCode::UNSPECIFIED_ERROR;
		}
	}

	public function actionDivideExport($round = null)
	{
		try {
			ini_set('memory_limit', '100M');
			\Yii::$app->divideExport->createExcel();
			\Yii::$app->divideExport->setTitle();
			\Yii::$app->divideExport->renderTitle();
			\Yii::$app->divideExport->renderHead();
			$query = Export::find();
			$query->andFilterWhere(['round' => $round]);
			$query->orderBy(['divide_mark' => SORT_ASC]);
			//每次循环取100个
			$divideIndex = 0;
			foreach ($query->each() as $export) {
				/**
				 * @var $export Export
				 */
				$divideIndex++;
				$exportData = [
					'divideIndex' => $divideIndex,
					'divideStamp' => $export->divide_stamp,
					'approveGrades' => $export->approve_grades,
					'immerseGrades' => $export->immerse_grades,
					'extravertReality1' => $export->extravert_reality1,
					'extravertReality2' => $export->extravert_reality2,
					'pleasantReality1' => $export->pleasant_reality1,
					'pleasantReality2' => $export->pleasant_reality2,
					'conscientiousReality1' => $export->conscientious_reality1,
					'conscientiousReality2' => $export->conscientious_reality2,
					'nervousReality1' => $export->nervous_reality1,
					'nervousReality2' => $export->nervous_reality2,
					'openReality1' => $export->open_reality1,
					'openReality2' => $export->open_reality2,
					'extravertInvented1' => $export->extravert_invented1,
					'extravertInvented2' => $export->extravert_invented2,
					'pleasantInvented1' => $export->pleasant_invented1,
					'pleasantInvented2' => $export->pleasant_invented2,
					'conscientiousInvented1' => $export->conscientious_invented1,
					'conscientiousInvented2' => $export->conscientious_invented2,
					'nervousInvented1' => $export->nervous_invented1,
					'nervousInvented2' => $export->nervous_invented2,
					'openInvented1' => $export->open_invented1,
					'openInvented2' => $export->open_invented2,
					'emotionAlive' => $export->emotion_alive,
					'emotionWarmth' => $export->emotion_warmth,
					'emotionHappy' => $export->emotion_happy,
					'emotionJubilant' => $export->emotion_excited,
					'emotionExcited' => $export->emotion_excited,
					'emotionProud' => $export->emotion_proud,
					'emotionDelighted' => $export->emotion_delighted,
					'emotionEnergetic' => $export->emotion_energetic,
					'emotionGrateful' => $export->emotion_grateful,
					'emotionSad' => $export->emotion_sad,
					'emotionScared' => $export->emotion_scared,
					'emotionNervous' => $export->emotion_nervous,
					'emotionTerrified' => $export->emotion_terrified,
					'emotionGuilt' => $export->emotion_guilt,
					'emotionTrembled' => $export->emotion_trembled,
					'emotionAnnoyed' => $export->emotion_annoyed,
					'emotionAshamed' => $export->emotion_ashamed,
					'emotionIrritable' => $export->emotion_irritable,
					'brandAttitudeA' => $export->brand_attitude_a,
					'brandAttitudeB' => $export->brand_attitude_b,
					'brandAttitudeC' => $export->brand_attitude_c,
					'brandAttitudeD' => $export->brand_attitude_d,
					'brandMemory1' => $export->brand_memory_1,
					'brandMemory2' => $export->brand_memory_2,
					'brandMemory3' => $export->brand_memory_3,
					'brandMemory4' => $export->brand_memory_4,
					'brandMemory5' => $export->brand_memory_5,
					'userID' => $export->user_id,
					'userName' => $export->user_name,
					'userEmail' => $export->user_email,
					'gender' => $export->gender,
					'age' => $export->age,
					'identifyStamp' => $export->identify_stamp,
					'differenceSize' => $export->difference_size,
					'differenceDirection' => $export->difference_direction,
					'associationStrength' => $export->association_strength
				];
				\Yii::$app->divideExport->addRow($exportData);

			}
			$exportFile = Yii::$app->getRuntimePath() . DIRECTORY_SEPARATOR . 'export' . DIRECTORY_SEPARATOR . date('Y-m-d') . DIRECTORY_SEPARATOR . $round ?: 'all' . time() . '.xlsx';
			\Yii::$app->divideExport->setBodyStyle();
			\Yii::$app->divideExport->save($exportFile);
			$this->stdout('file saved as ' . $exportFile . PHP_EOL);
			$this->stdout('done' . PHP_EOL);
			return ExitCode::OK;
		} catch (\Exception $exception) {
			$this->stderr($exception->getMessage() . PHP_EOL);
			$this->stdout($exception->__toString() . PHP_EOL);
			return ExitCode::UNSPECIFIED_ERROR;
		}
	}

	public function actionMigrate($migrateModel = null, $migrateData = 'true')
	{
		if ($migrateModel) {
			$migrateModel = 'common\\models\\' . ucfirst($migrateModel);
			if (!class_exists($migrateModel)) {
				$this->stderr('模型不存在：' . $migrateData . PHP_EOL);
				return ExitCode::UNSPECIFIED_ERROR;
			}
			$modelList = [
				$migrateModel => $migrateData
			];
		} else {
			$modelList = [
				Advertisement::class => true,
				AdvertisementAnswer::class => false,
				AdvertisementOption::class => true,
				AdvertisementQuestion::class => true,
				Approve::class => false,
				Config::class => true,
				EgoAnswer::class => false,
				EgoDifferenceGrades::class => false,
				EgoOption::class => true,
				EgoQuestion::class => true,
				EmotionAnswer::class => false,
				EmotionOption::class => true,
				EmotionQuestion::class => true,
				Export::class => false,
				File::class => true,
				Immerse::class => false,
				Incarnation::class => true,
				RoundMean::class => false,
				Type::class => true,
				User::class => false,
				UserIncarnationGrades::class => false
			];
		}
		foreach ($modelList as $migrateModel => $migrateData) {
			$this->stdout($migrateModel . PHP_EOL);
			$define = file_get_contents(Yii::$app->getRuntimePath() . DIRECTORY_SEPARATOR . 'tmp.php');
			$struct = '$this->createTable($this->tableName, [
			$attribute
		], $tableOptions);';
			/**
			 * @var $migrateModel ActiveRecord
			 * @var $tableSchema TableSchema
			 */
			$tableSchema = call_user_func([$migrateModel, 'getTableSchema']);
			$define = str_replace('$name', str_replace(Yii::$app->getDb()->tablePrefix, '', $tableSchema->name), $define);
			Yii::error(ArrayHelper::toArray($tableSchema));
			$columnDefines = [];
			$primaryKey = [];
			foreach ($tableSchema->columns as $column) {
				$columnDefine = '\'' . $column->name . '\'=>$this';
				if ($column->isPrimaryKey && $column->autoIncrement) {
					$primaryKey[] = $column->name;
					$columnDefine .= '->primaryKey(' . $column->size . ')';
				} else {
					$columnDefine .= '->' . $column->type . '(' . $column->size . ')';
				}
				if ($column->defaultValue) {
					if (is_string($column->defaultValue)) {
						$column->defaultValue = '\'' . $column->defaultValue . '\'';
					}
					$columnDefine .= '->defaultValue(' . $column->defaultValue . ')';
				}
				if ($column->comment) {
					$columnDefine .= '->comment(\'' . $column->comment . '\')';
				}
				if (!$column->allowNull) {
					$columnDefine .= '->notNull()';
				}
				$columnDefines[] = $columnDefine;
			}
			$attributes = $tableSchema->getColumnNames();
			$struct = str_replace('$attribute', implode(',' . PHP_EOL, $columnDefines), $struct);
			if ($tableSchema->primaryKey) {
				$tableSchema->primaryKey = array_diff($tableSchema->primaryKey, $primaryKey);
				$struct = $struct . PHP_EOL . '$this->addPrimaryKey(\'primaryKey\', $this->tableName, [\'' . implode('\',\'', $tableSchema->primaryKey) . '\']);';
			}
			$tmp = '';
			$delete = '';
			if ($migrateData == 'true') {
				$tmp = PHP_EOL . '$this->batchInsert($this->tableName,[\'$attribute\'],
			[
			$data
		]);';
				$tmp = str_replace('$attribute', implode('\',\'', $attributes), $tmp);
				$data = [];
				$records = $migrateModel::find()->all();
				foreach ($records as $record) {
					$single = [];
					foreach ($attributes as $attribute) {
						if (is_null(ArrayHelper::getValue($record, $attribute))) {
							$single[] = '\'' . $attribute . '\'=>null';
						} else {
							$single[] = '\'' . $attribute . '\'=>\'' . ArrayHelper::getValue($record, $attribute) . '\'';
						}
					}
					$data[] = '[' . implode(',', $single) . '],';
				}
				$tmp = str_replace('$data', implode(PHP_EOL, $data), $tmp);
				$delete = '$this->delete($this->tableName);' . PHP_EOL;
			}
			$define = str_replace('$schema', $struct, $define);
			$define = str_replace('$data', $tmp, $define);
			$define = str_replace('$delete', $delete, $define);
			file_put_contents(call_user_func([$migrateModel, 'tableName']), $define);
			$this->stdout('done' . PHP_EOL);
		}
		return ExitCode::OK;
	}

	public function actionTest()
	{
		return ExitCode::OK;
	}

	public function actionFillTest($userOffset = 0, $userCount = 1000)
	{
		Yii::$app->getDb()->dsn = env('TEST_DB_DSN');
		Yii::$app->getDb()->username = env('TEST_DB_USERNAME');
		Yii::$app->getDb()->password = env('TEST_DB_PASSWORD');
		$userIndex = $userOffset;
		$mobile = 13400000000 + $userOffset;
		$egoQuestions = EgoQuestion::find()->all();
		$allIncarnations = [
			User::GENDER_MALE => [],
			User::GENDER_FEMALE => []
		];
		while ($userIndex <= $userCount) {
			$this->stdout($userIndex . PHP_EOL);
			$userModel = new User();
			$userModel->setScenario('create');
			$userModel->username = 'test_' . $userIndex;
			$userModel->role = User::ROLE_USER;
			$userModel->mobile = (string)(++$mobile);
			$userModel->email = $userIndex . '@t.com';
			$userModel->department = 'test';
			$userModel->age = 21;
			$userModel->stage = 1;
			$rand = mt_rand(1, 2);
			if ($rand == 1) {
				$userModel->gender = User::GENDER_MALE;
			} else {
				$userModel->gender = User::GENDER_FEMALE;
			}
			$userModel->setPassword(md5('123456'));
			if ($userModel->validate() && $userModel->save()) {
				$this->stdout('save ' . $userIndex . PHP_EOL);
				$incarnations = ArrayHelper::getValue($allIncarnations, $userModel->gender);
				if (!$incarnations) {
					$incarnations = Incarnation::find()->where(['gender' => $userModel->gender])->all();
				}
				$approve = $immerse = [];
				foreach ($incarnations as $incarnation) {
					$approve[$incarnation->id] = mt_rand(1, 5);
					$immerse[$incarnation->id] = mt_rand(1, 5);
				}
				$accessToken = $userModel->generateAccessToken();
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/incarnation/grades', [
					'access_token' => $accessToken,
					'grades' => json_encode([
						'approve' => $approve,
						'immerse' => $immerse
					])
				]);
				$this->stdout('/incarnation/grades ' . $userIndex . PHP_EOL);
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/user/state', [
					'access_token' => $accessToken,
					'states' => json_encode(['step' => 1])
				]);
				$this->stdout('/user/state ' . $userIndex . PHP_EOL);
				$answers = [];
				foreach ($egoQuestions as $egoQuestion) {
					$egoQuestionOptions = $egoQuestion->option;
					$rand = mt_rand(1, count($egoQuestionOptions));
					/**
					 * @var $selectOption EgoOption
					 */
					$selectOption = ArrayHelper::getValue($egoQuestionOptions, $rand - 1);
					$answers[$egoQuestion->id] = $selectOption->id;
				}
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/ego/submit', [
					'access_token' => $accessToken,
					'answers' => json_encode($answers)
				]);
				$this->stdout('/ego/submit ' . $userIndex . PHP_EOL);
				foreach ($incarnations as $incarnation) {
					$answers = [];
					foreach ($egoQuestions as $egoQuestion) {
						$egoQuestionOptions = $egoQuestion->option;
						$rand = mt_rand(1, count($egoQuestionOptions));
						/**
						 * @var $selectOption EgoOption
						 */
						$selectOption = ArrayHelper::getValue($egoQuestionOptions, $rand - 1);
						$answers[$egoQuestion->id] = $selectOption->id;
					}
					Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/ego/submit', [
						'access_token' => $accessToken,
						'incarnation_id' => $incarnation->id,
						'answers' => json_encode($answers)
					]);
					$this->stdout('/ego/submit ' . $userIndex . ' ' . $incarnation->id . PHP_EOL);
				}
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/user/state', [
					'access_token' => $accessToken,
					'states' => json_encode(['step' => 3])
				]);
				$this->stdout('/user/state ' . $userIndex . PHP_EOL);
			}
			$userIndex++;
		}
		return ExitCode::OK;
	}

	public function actionBrandFixture()
	{
		/**
		 * @var $each User
		 */
		$emotionQuestions = EmotionQuestion::find()->joinWith(['option'])->all();
		$advertisementQuestions = AdvertisementQuestion::find()->joinWith(['option'])->where([AdvertisementQuestion::tableName() . '.status' => AdvertisementQuestion::STATUS_ACTIVE])->all();
		foreach (User::find()->where(['step' => 4])->each() as $each) {
			if ($each->advertisement_divide) {
				$accessToken = $each->generateAccessToken();
				$answers = [];
				foreach ($emotionQuestions as $emotionQuestion) {
					$emotionOptions = $emotionQuestion->option;
					$rand = mt_rand(1, count($emotionOptions));
					$emotionOption = ArrayHelper::getValue($emotionOptions, $rand - 1);
					$answers[$emotionQuestion->id] = $emotionOption->id;
				}
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/emotion/submit', [
					'access_token' => $accessToken,
					'answers' => json_encode($answers)
				]);
				$this->stdout('/emotion/submit ' . $each->id . PHP_EOL);
				$brandMemoryAnswers = $brandAttitudeAnswers = [];
				foreach ($advertisementQuestions as $advertisementQuestion) {
					$advertisementOptions = $advertisementQuestion->option;
					if ($advertisementQuestion->type == 'brandMemory') {
						$optionIndex = 0;
						$options = [];
						while ($optionIndex < count($advertisementOptions)) {
							$rand = mt_rand(1, 2);
							if ($rand == 1) {
								$advertisementOption = ArrayHelper::getValue($advertisementOptions, $optionIndex);
								$brandMemoryAnswers[$advertisementQuestion->id] = $advertisementOption->name;
							} else {
								$brandMemoryAnswers[$advertisementQuestion->id] = 'test';
							}
							$optionIndex = $optionIndex + 2;
						}
						$brandMemoryAnswers[$advertisementQuestion->id] = $options;
					} else {
						$rand = mt_rand(1, count($advertisementOptions));
						$advertisementOption = ArrayHelper::getValue($advertisementOptions, $rand - 1);
						$brandAttitudeAnswers[$advertisementQuestion->id] = $advertisementOption->id;
					}
				}
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/brand/memory', [
					'access_token' => $accessToken,
					'answers' => json_encode($brandMemoryAnswers)
				]);
				$this->stdout('/emotion/memory ' . $each->id . PHP_EOL);
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/brand/attitude', [
					'access_token' => $accessToken,
					'answers' => json_encode($brandAttitudeAnswers)
				]);
				$this->stdout('/emotion/attitude ' . $each->id . PHP_EOL);
			}
		}
		return ExitCode::OK;
	}

	public function actionCalculateUser($id)
	{
		$user = User::find()->where(['id' => $id])->one();
		if ($user->step > 1) {
			$accessToken = $user->generateAccessToken();
			Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/user/state', [
				'access_token' => $accessToken,
				'states' => json_encode(['step' => 1])
			]);
			$this->stdout('/user/state 1 ' . $user->id . PHP_EOL);
			if ($user->step > 3) {
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/user/state', [
					'access_token' => $accessToken,
					'states' => json_encode(['step' => 3])
				]);
				$this->stdout('/user/state 3 ' . $user->id . PHP_EOL);
			}
		}
		return ExitCode::OK;
	}

	public function actionCalculate($round = null)
	{
		/**
		 * @var $each User
		 */
		foreach (User::find()->where(['role' => User::ROLE_USER])->andWhere(['>', 'step', 1])->each() as $each) {
			if ($each->step > 1) {
				$accessToken = $each->generateAccessToken();
				Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/user/state', [
					'access_token' => $accessToken,
					'states' => json_encode(['step' => 1])
				]);
				$this->stdout('/user/state 1 ' . $each->id . PHP_EOL);
				if ($each->step > 3) {
					Curl::takeCurl('post', Yii::$app->params['backendBaseUrl'] . '/v1/user/state', [
						'access_token' => $accessToken,
						'states' => json_encode(['step' => 3])
					]);
					$this->stdout('/user/state 3 ' . $each->id . PHP_EOL);
				}
			}
		}
		return ExitCode::OK;
	}

	public function actionFixtures()
	{
		$modelList = [
			AdvertisementAnswer::class,
			Approve::class,
			EgoAnswer::class,
			EgoDifferenceGrades::class,
			EmotionAnswer::class,
			Export::class,
			Immerse::class,
			RoundMean::class,
			UserIncarnationGrades::class
		];
		$tmp = '<?php

namespace tests\common\fixtures;

use common\models\$modelName;
use yii\test\ActiveFixture;

/**
 * $modelName fixture
 */
class $modelNameFixture extends ActiveFixture
{
    public $modelClass = $modelName::class;
}
		';
		foreach ($modelList as $item) {
			$explode = explode('\\', $item);
			$modelName = end($explode);
			$content = str_replace('$modelName', $modelName, $tmp);
			$file = str_replace('\\', '/', '/home/vagrant/code/investigation/tests/common/fixtures/' . $modelName . 'Fixture.php');
			file_put_contents($file, $content);
		}
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
			$server->task($data);
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
		try {
			Yii::$app->redis->open();
			Yii::$app->getDb()->open();
			/**
			 * @var $user User
			 */
			$user = User::findIdentityByAccessToken(ArrayHelper::getValue($data, 'access_token'));
			if (!$user) {
				throw new \Exception('access_token校验失败');
			}
			static::$user = $user;
			echo 'task id:' . $task_id . ',action:' . ArrayHelper::getValue($data, 'action') . PHP_EOL;
			switch (ArrayHelper::getValue($data, 'action')) {
				case 'userIncarnation':
					$result = self::userIncarnationTask($data);
					break;
				case 'egoDifferences':
					$result = self::userEgoDifferences($data);
					break;
				case 'divideIntoGroups':
					$result = self::divideIntoGroups($data);
					break;
				case 'emotion':
					$result = self::emotion($data);
					break;
				case 'brandAttitude':
					$result = self::brandAttitude($data);
					break;
				case 'brandMemory':
					$result = self::brandMemory($data);
					break;
				case 'mailer':
					$result = self::mailer($data);
					break;
			}
			$taskData['status'] = 'success';
			$taskData['message'] = $result;
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			$taskData['status'] = 'fail';
			$taskData['message'] = $exception->getMessage();
		} catch (\Throwable $throwable) {
			Yii::error($throwable->__toString());
			$taskData['status'] = 'fail';
			$taskData['message'] = $throwable->getMessage();
		}
		if (ArrayHelper::getValue($data, 'callback')) {
			Curl::takeCurl('post', ArrayHelper::getValue($data, 'callback'), array_merge($data, $taskData));
		}
		$server->finish(json_encode($taskData));
		Yii::$app->getDb()->close();
		Yii::$app->redis->close();
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
		$approves = Approve::find()->where(['user_id' => static::$user->getId()])->indexBy('incarnation_id')->all();
		$immerses = Immerse::find()->where(['user_id' => static::$user->getId()])->indexBy('incarnation_id')->all();
		$incarnationGrades = [];
		foreach ($approves as $incarnationID => $approve) {
			$approveGrades = $approve->grades;
			$immerseGrades = $immerses[$incarnationID]->grades;
			$incarnationGrades[] = [
				'user_id' => static::$user->getId(),
				'incarnation_id' => $incarnationID,
				'grades' => ($approveGrades + $immerseGrades) / 2
			];
		}
		UserIncarnationGrades::deleteAll(['user_id' => array_column($incarnationGrades, 'user_id')]);
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
		$virtualEgos = EgoAnswer::find()->joinWith(['question'])->where([EgoAnswer::tableName() . '.user_id' => static::$user->getId()])->andFilterWhere(['not', [EgoAnswer::tableName() . '.incarnation_id' => -1]])->all();
		if (!$virtualEgos) {
			throw new \Exception('虚拟自我答题为空');
		}
		$realisticEgos = EgoAnswer::find()->joinWith(['question'])->where([EgoAnswer::tableName() . '.user_id' => static::$user->getId(), EgoAnswer::tableName() . '.incarnation_id' => -1])->all();
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
					'user_id' => static::$user->getId(),
					'incarnation_id' => $incarnationID,
					'type' => $questionType,
					'sign' => $sign,
					'grades' => abs($grades)
				];
			}
		}
		EgoDifferenceGrades::deleteAll(['user_id' => array_column($egoDifference, 'user_id')]);
		EgoDifferenceGrades::getDb()->createCommand()->batchInsert(EgoDifferenceGrades::tableName(), ['user_id', 'incarnation_id', 'type', 'sign', 'grades'], $egoDifference)->execute();
		return $egoDifference;
	}

	/**
	 * 用户分组
	 * @param $data
	 * @return bool
	 * @throws \Exception
	 */
	public static function divideIntoGroups($data)
	{
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			//当传递了round时，表示是重新分组
			$round = ArrayHelper::getValue($data, 'round');
			if ($round) {
				$users = User::find()->select(['id', 'username', 'email', 'gender', 'age'])->where(['round' => $round])->all();
				if (empty($users)) {
					throw new \Exception('没有可以分组的用户');
				}
				$userID = ArrayHelper::getColumn($users, 'id');
			} else {
				$users = User::find()->select(['id', 'username', 'email', 'gender', 'age'])->where(['stage' => '1', 'step' => 3, 'role' => User::ROLE_USER])->all();
				if (empty($users)) {
					throw new \Exception('没有可以分组的用户');
				}
				$systemRound = Config::find()->where(['name' => Config::CONFIG_ROUND_KEY])->limit(1)->one();
				$systemRound->value = $systemRound->value + 1;
				$systemRound->save();
				$round = $systemRound->value;
				$userID = ArrayHelper::getColumn($users, 'id');
				User::updateAll(['round' => $round, 'step' => 4, 'stage' => 2], ['id' => $userID]);
			}
			self::divideIncarnationGroup($userID);
			self::divideEgoGroup($userID);
			self::divideAdvertisement();
			self::saveDivideToDatabase($round);
			self::saveExportDivide($users, $round);
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
			throw $exception;
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
				$loopIndex++;
			}
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
			//保存答题结果，用于随机分配到化身
//			Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE_' . $egoDifferenceGrades->user_id, json_encode(ArrayHelper::toArray($egoDifferenceGrades)));
			//用户分组结果
			$userEgoDivide = Yii::$app->cache->get('EGO_DIVIDE_' . $egoDifferenceGrades->user_id);
			if (!$userEgoDivide) {
				Yii::$app->cache->set('EGO_DIVIDE_' . $egoDifferenceGrades->user_id, 5);
				//保存为middle的用户到临时数据
//				Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE_TMP', $egoDifferenceGrades->user_id);
				//当自我差异得分为0的用户不用随机到化身上时，注释上边的代码，取消下边的注释
				Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE', json_encode(ArrayHelper::toArray($egoDifferenceGrades)));
			}
		}
	}

	/**
	 * 随机一半用户是否有广告，从key指定的redis列表中获取用户角色信息，从左获取一个然后再从右获取一个
	 */
	public static function divideAdvertisement()
	{
		//为自我差异得分为0的用户随机一个化身,当自我差异得分为0的用户不用随机到化身上时，注释下边的注释
//		$middleListLength = Yii::$app->redis->llen('EGO_DIVIDE_NEGATIVE_MIDDLE_TMP');
//		if ($middleListLength > 0) {
//			$middleUser = Yii::$app->redis->lpop('EGO_DIVIDE_NEGATIVE_MIDDLE_TMP');
//			$middleUserEgoGrades = Yii::$app->redis->lrange('INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE_' . $middleUser, 0, Yii::$app->redis->llen('INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE_' . $middleUser));
//			$randIndex = mt_rand(1, count($middleUserEgoGrades));
//			Yii::$app->redis->rpush('INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE', ArrayHelper::getValue($middleUserEgoGrades, $randIndex - 1));
//		}
		/**
		 * @var $userIncarnationGrades UserIncarnationGrades
		 */
		//当自我差异得分为0的用户不用随机到化身上时，把INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE从数组中删除
		$divides = ['INV_CACHE:EGO_DIVIDE_POSITIVE_LARGER', 'INV_CACHE:EGO_DIVIDE_POSITIVE_SMALLER', 'INV_CACHE:EGO_DIVIDE_NEGATIVE_LARGER', 'INV_CACHE:EGO_DIVIDE_NEGATIVE_SMALLER',];
//		$divides = ['INV_CACHE:EGO_DIVIDE_POSITIVE_LARGER', 'INV_CACHE:EGO_DIVIDE_POSITIVE_SMALLER', 'INV_CACHE:EGO_DIVIDE_NEGATIVE_LARGER', 'INV_CACHE:EGO_DIVIDE_NEGATIVE_SMALLER', 'INV_CACHE:EGO_DIVIDE_NEGATIVE_MIDDLE'];
		foreach ($divides as $divide) {
			$listLength = Yii::$app->redis->llen($divide);
			$popIndex = 0;
			while ($popIndex < $listLength) {
				$leftItem = Yii::$app->redis->lindex($divide, $popIndex);
				$popIndex++;
				Console::stdout($popIndex . '//' . $leftItem . PHP_EOL);
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
	 * 保存分组数据到导出数据表，情绪量化、广告品牌问题需单独处理
	 * @param $users User[]
	 * @param $round
	 * @throws \yii\db\Exception
	 */
	public static function saveExportDivide($users, $round)
	{
		//自我差异问题总数
		$egoQuestionCount = EgoQuestion::find()->count('id');
		//化身认同分组设置
		$identifyLevelList = ArrayHelper::map(User::IDENTIFY_DIVIDE_LEVEL, 'value', 'key');
		//自我差异分组设置
		$egoLevelList = ArrayHelper::map(User::EGO_DIVIDE_LEVEL, 'value', 'key');
		//广告强弱分组设置
		$advLevelList = ArrayHelper::map(User::ADVERTISEMENT_DIVIDE_LEVEL, 'value', 'key');
		//用于保存分组类型标识，方便导出时一次查询所有
		$divideLevels = [];
		$divideLevelMark = 0;
		foreach (User::IDENTIFY_DIVIDE_LEVEL as $identifyDivideLevel) {
			foreach (User::EGO_DIVIDE_LEVEL as $egoDivideLevel) {
				foreach (User::ADVERTISEMENT_DIVIDE_LEVEL as $advertisementDivideLevel) {
					$divideLevels[$identifyDivideLevel['key'] . $egoDivideLevel['key'] . $advertisementDivideLevel['key']] = (++$divideLevelMark);
				}
			}
		}
		//遍历用户信息
		$exportDataArray = [];
		foreach ($users as $user) {
			//化身认同分组结果标识
			$identifyDivide = Yii::$app->cache->get('IDENTIFY_DIVIDE_' . $user->id) ?: 3;
			//化身认同分组落在的化身id
			$identifyIncarnation = Yii::$app->cache->get('IDENTIFY_INCARNATION_' . $user->id);
			//自我差异分组结果标识
			$egoDivide = Yii::$app->cache->get('EGO_DIVIDE_' . $user->id) ?: 5;
			//广告强弱分组结果标识
			$advDivide = Yii::$app->cache->get('ADVERTISEMENT_DIVIDE_' . $user->id) ?: 3;
			//广告强弱分组落在的化身id
			$advIncarnation = Yii::$app->cache->get('ADVERTISEMENT_INCARNATION_' . $user->id);
			//如果数据已存在则更新，不存在则新建
			$exportData = Export::find()->where(['user_id' => $user->id, 'round' => $round])->limit(1)->one();
			if (!$exportData) {
				$exportData = new Export();
			}
			//用户id
			$exportData->user_id = $user->id;
			$exportData->user_name = $user->username;
			$exportData->user_email = $user->email;
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
			//活跃
			$exportData->emotion_alive = 0;
			//热情
			$exportData->emotion_warmth = 0;
			//快乐
			$exportData->emotion_happy = 0;
			//兴高采烈
			$exportData->emotion_jubilant = 0;
			//兴奋
			$exportData->emotion_excited = 0;
			//自豪
			$exportData->emotion_proud = 0;
			//欣喜
			$exportData->emotion_delighted = 0;
			//精神充沛
			$exportData->emotion_energetic = 0;
			//感激
			$exportData->emotion_grateful = 0;
			//难过
			$exportData->emotion_sad = 0;
			//害怕
			$exportData->emotion_scared = 0;
			//紧张
			$exportData->emotion_nervous = 0;
			//惊恐
			$exportData->emotion_terrified = 0;
			//内疚
			$exportData->emotion_guilt = 0;
			//战战兢兢
			$exportData->emotion_trembled = 0;
			//恼怒
			$exportData->emotion_annoyed = 0;
			//羞愧
			$exportData->emotion_ashamed = 0;
			//易怒
			$exportData->emotion_irritable = 0;
			//品牌态度
			$exportData->brand_attitude_a = 0;
			$exportData->brand_attitude_b = 0;
			$exportData->brand_attitude_c = 0;
			$exportData->brand_attitude_d = 0;
			//品牌记忆
			$exportData->brand_memory_1 = 0;
			$exportData->brand_memory_2 = 0;
			$exportData->brand_memory_3 = 0;
			$exportData->brand_memory_4 = 0;
			$exportData->brand_memory_5 = 0;
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
				$exportData->difference_size = mb_substr($egoDivideKey, 0, 1, 'utf-8');
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
			$exportData->divide_mark = ArrayHelper::getValue($divideLevels, $exportData->divide_stamp);
//			$exportData->save();
			$exportDataArray[] = ArrayHelper::toArray($exportData);
			Console::stdout($exportData->id . ' ' . $exportData->user_id . PHP_EOL);
		}
		Export::deleteAll(['round' => $round]);
		Export::getDb()->createCommand()->batchInsert(Export::tableName(), array_keys(reset($exportDataArray)), $exportDataArray)->execute();
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
		$view = ArrayHelper::getValue($data, 'view');
		if ($view) {
			$mail = Yii::$app->mailer->compose($view, ['user' => static::$user, 'params' => ArrayHelper::getValue($data, 'params')]);
		} else {
			$mail = Yii::$app->mailer->compose();
			$mail->setTextBody(ArrayHelper::getValue($data, 'params.text'));
		}
		$mail->setTo(static::$user->email);
		$mail->setSubject(ArrayHelper::getValue($data, 'params.topic'));
		return $mail->send();
	}

	/**
	 * @param $data
	 * User $user
	 * @throws
	 */
	public static function brandAttitude($data)
	{
		//品牌态度
		$brandAttitudeAnswer = AdvertisementAnswer::find()->joinWith(['question'])->where([AdvertisementAnswer::tableName() . '.user_id' => self::$user->id, AdvertisementQuestion::tableName() . '.type' => 'brandAttitude'])->all();
		if (empty($brandAttitudeAnswer)) {
			throw new \Exception('用户没有品牌态度答题信息');
		}
		$exportData = Export::find()->where(['user_id' => self::$user->id])->limit(1)->one();
		if (empty($exportData)) {
			throw new \Exception('没有用户导出数据实例');
		}
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
		$exportData->save();
		self::$user->advertisement_status = User::ADVERTISEMENT_STATUS_FINISH;
		self::$user->save();
	}

	/**
	 * @param $data
	 * User $user
	 * @throws
	 */
	public static function brandMemory($data)
	{
		//品牌记忆
		$brandMemoryAnswer = AdvertisementAnswer::find()->joinWith(['question'])->where([AdvertisementAnswer::tableName() . '.user_id' => self::$user->id, AdvertisementQuestion::tableName() . '.type' => 'brandMemory'])->all();
		if (empty($brandMemoryAnswer)) {
			throw new \Exception('用户没有品牌记忆答题信息');
		}
		$exportData = Export::find()->where(['user_id' => self::$user->id])->limit(1)->one();
		if (empty($exportData)) {
			throw new \Exception('没有用户导出数据实例');
		}
		/**
		 * @var $brandMemory AdvertisementAnswer
		 */
		$brandMemory = array_shift($brandMemoryAnswer);
		$exportData->brand_memory_1 = $brandMemory->grades;
		$brandMemory = array_shift($brandMemoryAnswer);
		$exportData->brand_memory_2 = $brandMemory->grades;
		$brandMemory = array_shift($brandMemoryAnswer);
		$exportData->brand_memory_3 = $brandMemory->grades;
		$brandMemory = array_shift($brandMemoryAnswer);
		$exportData->brand_memory_4 = $brandMemory->grades;
		$brandMemory = array_shift($brandMemoryAnswer);
		$exportData->brand_memory_5 = $brandMemory->grades;
		$exportData->save();
	}

	/**
	 * 情绪量化导出数据
	 * @param $data
	 * @throws \Exception
	 */
	public static function emotion($data)
	{
		$exportData = Export::find()->where(['user_id' => self::$user->id])->limit(1)->one();
		if (empty($exportData)) {
			throw new \Exception('没有用户导出数据实例');
		}
		//情绪量化问题总数
		$emotionQuestionCount = EmotionQuestion::find()->count('id');
		//情绪量化
		$emotionTypeAnswers = [];
		//有广告强弱化身的才有情绪量化答题
		if (self::$user->ego_incarnation) {
			$emotionAnswers = EmotionAnswer::find()->where(['user_id' => self::$user->id])->limit($emotionQuestionCount)->all();
			//把答题得分按照问题类型组装数据
			foreach ($emotionAnswers as $emotionAnswer) {
				$emotionTypeAnswers[$emotionAnswer->question->type] = $emotionAnswer->grades;
			}
		}
		//活跃
		$exportData->emotion_alive = ArrayHelper::getValue($emotionTypeAnswers, 'alive') ?: 0;
		//热情
		$exportData->emotion_warmth = ArrayHelper::getValue($emotionTypeAnswers, 'warmth') ?: 0;
		//快乐
		$exportData->emotion_happy = ArrayHelper::getValue($emotionTypeAnswers, 'happy') ?: 0;
		//兴高采烈
		$exportData->emotion_jubilant = ArrayHelper::getValue($emotionTypeAnswers, 'jubilant') ?: 0;
		//兴奋
		$exportData->emotion_excited = ArrayHelper::getValue($emotionTypeAnswers, 'excited') ?: 0;
		//自豪
		$exportData->emotion_proud = ArrayHelper::getValue($emotionTypeAnswers, 'proud') ?: 0;
		//欣喜
		$exportData->emotion_delighted = ArrayHelper::getValue($emotionTypeAnswers, 'delighted') ?: 0;
		//精神充沛
		$exportData->emotion_energetic = ArrayHelper::getValue($emotionTypeAnswers, 'energetic') ?: 0;
		//感激
		$exportData->emotion_grateful = ArrayHelper::getValue($emotionTypeAnswers, 'grateful') ?: 0;
		//难过
		$exportData->emotion_sad = ArrayHelper::getValue($emotionTypeAnswers, 'sad') ?: 0;
		//害怕
		$exportData->emotion_scared = ArrayHelper::getValue($emotionTypeAnswers, 'scared') ?: 0;
		//紧张
		$exportData->emotion_nervous = ArrayHelper::getValue($emotionTypeAnswers, 'nervous') ?: 0;
		//惊恐
		$exportData->emotion_terrified = ArrayHelper::getValue($emotionTypeAnswers, 'terrified') ?: 0;
		//内疚
		$exportData->emotion_guilt = ArrayHelper::getValue($emotionTypeAnswers, 'guilt') ?: 0;
		//战战兢兢
		$exportData->emotion_trembled = ArrayHelper::getValue($emotionTypeAnswers, 'trembled') ?: 0;
		//恼怒
		$exportData->emotion_annoyed = ArrayHelper::getValue($emotionTypeAnswers, 'annoyed') ?: 0;
		//羞愧
		$exportData->emotion_ashamed = ArrayHelper::getValue($emotionTypeAnswers, 'ashamed') ?: 0;
		//易怒
		$exportData->emotion_irritable = ArrayHelper::getValue($emotionTypeAnswers, 'irritable') ?: 0;
		$exportData->save();
	}
}