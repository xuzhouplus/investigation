<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\EgoAnswer;
use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class EgoAnswerAction
 * @package api\modules\v1\actions\divide
 * @property EgoAnswer $modelClass
 */
class EgoAnswerAction extends Action
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
			if (is_null($user->ego_divide)) {
				throw new \Exception('该用户没有参与自我差异答题');
			}
			/**
			 * @var $egoAnswers EgoAnswer[]
			 */
			$egoAnswers = EgoAnswer::find()->joinWith(['incarnation', 'question', 'option'])->where([EgoAnswer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
			$result = [];
			foreach ($egoAnswers as $egoAnswer) {
				$result[] = [
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