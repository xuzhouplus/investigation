<?php


namespace api\modules\v1\actions\advertisement;


use api\modules\v1\models\Advertisement;
use yii\rest\Action;
use Yii;

/**
 * Class UpdateAction
 * @package api\modules\v1\actions\advertisement
 * @property Advertisement $modelClass
 */
class UpdateAction extends Action
{
	public $scenario = 'update';

	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$request = Yii::$app->request;
			$result = call_user_func_array([$this->modelClass, 'modify'], ['data' => $request->getBodyParams()]);
			return [
				'code' => 200,
				'message' => '更新成功',
				'data' => $result
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