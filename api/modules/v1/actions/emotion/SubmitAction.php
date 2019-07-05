<?php


namespace api\modules\v1\actions\emotion;


use api\modules\v1\models\EmotionAnswer;
use Yii;
use yii\rest\Action;

/**
 * Class AnswerAction
 * @package api\modules\v1\actions\emotion
 * @property EmotionAnswer $modelClass
 */
class SubmitAction extends Action
{
	public function run()
	{
		try {
			$request = Yii::$app->request;
			$result = call_user_func_array([$this->modelClass, 'submit'], ['data' => $request->getBodyParams()]);
			return [
				'code' => 200,
				'message' => '提交成功',
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