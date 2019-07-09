<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\EmotionAnswer;
use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class EmotionAnswerAction
 * @package api\modules\v1\actions\divide
 * @property EmotionAnswer $modelClass
 */
class EmotionAnswerAction extends Action
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
			if (is_null($user->incarnation_id)) {
				throw new \Exception('该用户没有参与情绪量化答题');
			}
			/**
			 * @var $emotionAnswers EmotionAnswer[]
			 */
			$emotionAnswers = EmotionAnswer::find()->joinWith(['question', 'option'])->where([EmotionAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
			$result = [
				'incarnation_name' => $user->incarnation->name,
				'incarnation_file' => $user->incarnation->file->fileUrl(),
				'incarnation_description' => $user->incarnation->description,
				'incarnation_gender' => $user->incarnation->gender,
			];
			foreach ($emotionAnswers as $emotionAnswer) {
				$result['answer'][] = [
					'question_title' => $emotionAnswer->question->title,
					'question_description' => $emotionAnswer->question->description,
					'option_name' => $emotionAnswer->option->name,
					'option_description' => $emotionAnswer->option->description,
					'grades' => $emotionAnswer->grades
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