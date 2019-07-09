<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\Approve;
use api\modules\v1\models\EgoAnswer;
use api\modules\v1\models\EmotionAnswer;
use api\modules\v1\models\Immerse;
use api\modules\v1\models\User;
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
			//化身认同分组
			if ($user->incarnation_divide) {
				/**
				 * @var $approves Approve[]
				 */
				$approves = Approve::find()->joinWith(['incarnation'])->where([Approve::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
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
				$immerses = Immerse::find()->joinWith(['incarnation'])->where([Immerse::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
				foreach ($immerses as $immerse) {
					$result['immerse'][] = [
						'incarnation_name' => $immerse->incarnation->name,
						'incarnation_file' => $immerse->incarnation->file->fileUrl(),
						'incarnation_description' => $immerse->incarnation->description,
						'incarnation_gender' => $immerse->incarnation->gender,
						'grades' => $immerse->grades
					];
				}
			}
			//品牌记忆答题
			if ($user->advertisement_grades) {
				/**
				 * @var $answers AdvertisementAnswer[]
				 */
				$answers = AdvertisementAnswer::find()->joinWith(['question', 'option'])->where([AdvertisementAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
				foreach ($answers as $answer) {
					if ($answer->option->file_id) {
						$optionFile = $answer->option->file->fileUrl();
					} else {
						$optionFile = '';
					}
					$result['advertisement'][] = [
						'question_title' => $answer->question->title,
						'question_description' => $answer->question->description,
						'option_name' => $answer->option->name,
						'option_file' => $optionFile,
						'grades' => $answer->grades
					];
				}
			}
			//自我差异分组
			if ($user->ego_divide) {
				/**
				 * @var $egoAnswers EgoAnswer[]
				 */
				$egoAnswers = EgoAnswer::find()->joinWith(['incarnation', 'question', 'option'])->where([EgoAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
				$result = [];
				foreach ($egoAnswers as $egoAnswer) {
					$result['ego'][] = [
						'incarnation_name' => $egoAnswer->incarnation->name,
						'incarnation_file' => $egoAnswer->incarnation->file->fileUrl(),
						'incarnation_description' => $egoAnswer->incarnation->description,
						'incarnation_gender' => $egoAnswer->incarnation->gender,
						'question_title' => $egoAnswer->question->title,
						'question_description' => $egoAnswer->question->description,
						'option_name' => $egoAnswer->option->name,
						'option_description' => $egoAnswer->option->description,
						'grades' => $egoAnswer->grades
					];
				}
			}
			//情绪量化答题
			if ($user->incarnation_id) {
				/**
				 * @var $emotionAnswers EmotionAnswer[]
				 */
				$emotionAnswers = EmotionAnswer::find()->joinWith(['incarnation', 'question', 'option'])->where([EmotionAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
				$result['emotion']['incarnation'] = [
					'incarnation_name' => $user->incarnation->name,
					'incarnation_file' => $user->incarnation->file->fileUrl(),
					'incarnation_description' => $user->incarnation->description,
					'incarnation_gender' => $user->incarnation->gender,
				];
				foreach ($emotionAnswers as $emotionAnswer) {
					$result['emotion']['answer'][] = [
						'question_title' => $emotionAnswer->question->title,
						'question_description' => $emotionAnswer->question->description,
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