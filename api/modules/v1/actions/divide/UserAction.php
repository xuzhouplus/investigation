<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\AdvertisementQuestion;
use api\modules\v1\models\Approve;
use api\modules\v1\models\EgoAnswer;
use api\modules\v1\models\EgoQuestion;
use api\modules\v1\models\EmotionAnswer;
use api\modules\v1\models\EmotionQuestion;
use api\modules\v1\models\Immerse;
use api\modules\v1\models\Incarnation;
use api\modules\v1\models\User;
use common\models\UserIncarnationGrades;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class UserAction
 * @package api\modules\v1\actions\divide
 * @property User $modelClass
 */
class UserAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$requestParams = Yii::$app->getRequest()->getBodyParams();
			if (empty($requestParams)) {
				$requestParams = Yii::$app->getRequest()->getQueryParams();
			}
			$userID = ArrayHelper::getValue($requestParams, 'user_id');
			if (!$userID) {
				throw new \Exception('用户参数错误');
			}
			$user = User::find()->where([User::tableName() . '.id' => $userID])->limit(1)->one();
			if (!$user) {
				throw new \Exception('用户不存在');
			}
			$result = [
				'user' => $user,
				'approve' => [],
				'immerse' => [],
				'advertisement' => [],
				'ego' => [],
				'emotion' => []
			];
			//获取化身总数，添加到获取答题的limit参数中可以提升性能
			$incarnationCount = Incarnation::find()->where(['gender' => $user->gender])->count('id');
			//化身认同分组
			if ($user->identify_divide) {
				/**
				 * @var $approves Approve[]
				 */
				$approves = Approve::find()->joinWith(['incarnation'])->where([Approve::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->limit($incarnationCount)->cache()->all();
				foreach ($approves as $approve) {
					$result['approves'][] = [
						'incarnation_name' => $approve->incarnation->name,
						'incarnation_file' => $approve->incarnation->file->fileUrl(),
						'incarnation_description' => $approve->incarnation->description,
						'incarnation_gender' => $approve->incarnation->gender,
						'grades' => $approve->grades
					];
				}
				/**
				 * @var $immerses Immerse[]
				 */
				$immerses = Immerse::find()->joinWith(['incarnation'])->where([Immerse::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->limit($incarnationCount)->cache()->all();
				foreach ($immerses as $immerse) {
					$result['immerse'][] = [
						'incarnation_name' => $immerse->incarnation->name,
						'incarnation_file' => $immerse->incarnation->file->fileUrl(),
						'incarnation_description' => $immerse->incarnation->description,
						'incarnation_gender' => $immerse->incarnation->gender,
						'grades' => $immerse->grades
					];
				}
				$approve = Approve::find()->where(['user_id' => $user->id, 'incarnation_id' => $user->identify_incarnation])->limit(1)->one();
				$immerse = Immerse::find()->where(['user_id' => $user->id, 'incarnation_id' => $user->identify_incarnation])->limit(1)->one();
				$userIncarnationGrades = UserIncarnationGrades::find()->where(['user_id' => $user->id, 'incarnation_id' => $user->identify_incarnation])->limit(1)->one();
				$result['identify'] = [
					'incarnation_name' => $user->identifyIncarnation->name,
					'incarnation_file' => $user->identifyIncarnation->file->fileUrl(),
					'incarnation_description' => $user->identifyIncarnation->description,
					'incarnation_gender' => $user->identifyIncarnation->gender,
					'approve_grades' => $approve->grades,
					'immerse_grades' => $immerse->grades,
					'identify_grades' => $userIncarnationGrades->grades
				];
			}
			//品牌记忆答题
			$questionCount = AdvertisementQuestion::find()->where(['status' => AdvertisementQuestion::STATUS_ACTIVE])->count('id');
			/**
			 * @var $answers AdvertisementAnswer[]
			 */
			$answers = AdvertisementAnswer::find()->joinWith(['question', 'option'])->where([AdvertisementAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->limit($questionCount)->cache()->all();
			foreach ($answers as $answer) {
				$question = $answer->question;
				if ($question->kind == AdvertisementQuestion::KIND_CHOICE) {
					if (!isset($result[$question->type])) {
						$result[$question->type] = [];
					}
					$option = $answer->option;
					if ($option->file_id) {
						$optionFile = $option->file->fileUrl();
					} else {
						$optionFile = '';
					}
					$result[$question->type][] = [
						'question_title' => $question->title,
						'question_description' => $question->description,
						'question_type' => $question->type,
						'question_kind' => $question->kind,
						'option_name' => $option->name,
						'option_file' => $optionFile,
						'option_answer' => $answer->answer,
						'grades' => $answer->grades
					];
				} else {
					if (!isset($result[$question->type])) {
						$result[$question->type] = [];
					}
					$result[$question->type][] = [
						'question_title' => $question->title,
						'question_description' => $question->description,
						'question_type' => $question->type,
						'question_kind' => $question->kind,
						'option_answer' => $answer->answer,
						'grades' => $answer->grades
					];
				}
			}
			//自我差异分组
			if ($user->ego_divide) {
				$egoQuestionCount = EgoQuestion::find()->count('id');
				/**
				 * 包含一个现实自我和每种化身的虚拟自我
				 * @var $egoAnswers EgoAnswer[]
				 */
				$egoAnswers = EgoAnswer::find()->joinWith(['incarnation', 'question', 'option'])->where([EgoAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->limit($egoQuestionCount * ($incarnationCount + 1))->cache()->all();
				$result = [];
				foreach ($egoAnswers as $egoAnswer) {
					if ($egoAnswer->incarnation_id == -1) {
						$result['ego'][] = [
							'incarnation_name' => '',
							'incarnation_file' => '',
							'incarnation_description' => '',
							'incarnation_gender' => '',
							'question_title' => $egoAnswer->question->title,
							'question_description' => $egoAnswer->question->description,
							'question_type' => $egoAnswer->question->type,
							'option_name' => $egoAnswer->option->name,
							'option_description' => $egoAnswer->option->description,
							'grades' => $egoAnswer->grades
						];
					} else {
						$result['ego'][] = [
							'incarnation_name' => $egoAnswer->incarnation->name,
							'incarnation_file' => $egoAnswer->incarnation->file->fileUrl(),
							'incarnation_description' => $egoAnswer->incarnation->description,
							'incarnation_gender' => $egoAnswer->incarnation->gender,
							'question_title' => $egoAnswer->question->title,
							'question_description' => $egoAnswer->question->description,
							'question_type' => $egoAnswer->question->type,
							'option_name' => $egoAnswer->option->name,
							'option_description' => $egoAnswer->option->description,
							'grades' => $egoAnswer->grades
						];
					}
				}
			}
			//情绪量化答题
			if ($user->ego_incarnation) {
				$emotionQuestionCount = EmotionQuestion::find()->count('id');
				/**
				 * @var $emotionAnswers EmotionAnswer[]
				 */
				$emotionAnswers = EmotionAnswer::find()->joinWith(['question', 'option'])->where([EmotionAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->limit($emotionQuestionCount)->cache()->all();
				$result['emotion']['incarnation'] = [
					'incarnation_name' => $user->egoIncarnation->name,
					'incarnation_file' => $user->egoIncarnation->file->fileUrl(),
					'incarnation_description' => $user->egoIncarnation->description,
					'incarnation_gender' => $user->egoIncarnation->gender,
					'advertisement_description' => $user->egoIncarnation->advertisement->description
				];
				if ($user->advertisement_divide == 1) {
					$result['emotion']['incarnation']['advertisement_file'] = $user->egoIncarnation->advertisement->onFile->fileUrl();
				} else {
					$result['emotion']['incarnation']['advertisement_file'] = $user->egoIncarnation->advertisement->sideFile->fileUrl();
				}
				foreach ($emotionAnswers as $emotionAnswer) {
					$result['emotion']['answer'][] = [
						'question_title' => $emotionAnswer->question->title,
						'question_description' => $emotionAnswer->question->description,
						'question_type' => $emotionAnswer->question->type,
						'option_name' => $emotionAnswer->option->name,
						'option_description' => $emotionAnswer->option->description,
						'grades' => $emotionAnswer->grades
					];
				}
			}
			return [
				'code' => 200,
				'message' => '获取成功',
				'data' => $result
			];
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => new \stdClass()
			];
		}
	}
}