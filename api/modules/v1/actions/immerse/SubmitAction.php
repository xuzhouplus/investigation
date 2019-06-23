<?php


namespace api\modules\v1\actions\immerse;


use api\modules\v1\models\Immerse;
use yii\rest\Action;

/**
 * Class SubmitAction
 * @package api\modules\v1\actions\immerse
 * @property Immerse $modelClass
 */
class SubmitAction extends Action
{
	public function run()
	{
		try {
			$result = call_user_func_array([$this->modelClass, 'submit'], ['data' => \Yii::$app->request->getBodyParams()]);
			if ($result) {
				return [
					'code' => 200,
					'message' => '提交成功',
					'data' => $result
				];
			}
		}catch (\Exception $exception){
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => (new \stdClass())
			];
		}
	}
}