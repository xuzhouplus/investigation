<?php


namespace api\modules\v1\actions\type;


use api\modules\v1\models\Type;
use yii\rest\Action;

/**
 * Class UpdateAction
 * @package api\modules\v1\actions\type
 * @property Type $modelClass
 */
class UpdateAction extends Action
{
	public function run()
	{
		try {
			if (!\Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$request = \Yii::$app->request;
			$result = call_user_func_array([$this->modelClass, 'updateType'], ['data' => $request->getBodyParams()]);
			if ($result) {
				return [
					'code' => 200,
					'message' => '更新成功',
					'data' => $result
				];
			}
			return [
				'code' => 300,
				'message' => '更新失败',
				'data' => (new \stdClass())
			];
		} catch (\Exception $exception) {
			\Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => (new \stdClass())
			];
		}
	}
}