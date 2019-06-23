<?php


namespace api\modules\v1\actions\approve;


use api\modules\v1\models\Approve;
use yii\rest\Action;

/**
 * Class CommitAction
 * @package api\modules\v1\actions\approve
 * @property Approve $modelClass
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