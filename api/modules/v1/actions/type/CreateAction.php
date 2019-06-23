<?php


namespace api\modules\v1\actions\type;


use api\modules\v1\models\Type;
use yii\rest\Action;

/**
 * Class CreateAction
 * @package api\modules\v1\actions\type
 * @property Type $modelClass
 */
class CreateAction extends Action
{
	public function run()
	{
		$request = \Yii::$app->request;
		try {
			if (!\Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$type = call_user_func_array([$this->modelClass, 'createType'], ['data' => $request->getBodyParams()]);
			if ($type) {
				return [
					'code' => 200,
					'message' => '新建成功',
					'data' => $type
				];
			}
			return [
				'code' => 300,
				'message' => '新建失败',
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