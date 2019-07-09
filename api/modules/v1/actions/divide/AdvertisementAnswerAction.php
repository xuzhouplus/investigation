<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class AdvertisementAnswerAction
 * @package api\modules\v1\actions\divide
 * @property AdvertisementAnswer $modelClass
 */
class AdvertisementAnswerAction extends Action
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
			/**
			 * @var $user User
			 */
			$user = User::findIdentity(ArrayHelper::getValue($requestParams, 'user_id'));
			if (!$user) {
				throw new \Exception('用户不存在');
			}
			if (is_null($user->advertisement_grades)) {
				throw new \Exception('该用户没有参与品牌记忆答题');
			}
			/**
			 * @var $answers AdvertisementAnswer[]
			 */
			$answers = AdvertisementAnswer::find()->joinWith(['question', 'option'])->where([AdvertisementAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
			$result = [];
			foreach ($answers as $answer) {
				if ($answer->option->file_id) {
					$optionFile = $answer->option->file->fileUrl();
				} else {
					$optionFile = '';
				}
				$result[] = [
					'question_title' => $answer->question->title,
					'question_description' => $answer->question->description,
					'option_name' => $answer->option->name,
					'option_file' => $optionFile,
					'grades' => $answer->grades
				];
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