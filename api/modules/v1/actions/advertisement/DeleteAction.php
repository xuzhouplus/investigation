<?php


namespace api\modules\v1\actions\advertisement;


use api\modules\v1\models\Advertisement;
use yii\rest\Action;
use Yii;

/**
 * Class DeleteAction
 * @package api\modules\v1\actions\advertisement
 * @property Advertisement $modelClass
 */
class DeleteAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$request = Yii::$app->getRequest();
			$result=call_user_func_array([$this->modelClass,'remove'],['data'=>$request->getBodyParams()]);
			if ($result) {
				return [
					'code' => 200,
					'message' => '删除成功'
				];
			}
			throw new \Exception('删除失败');
		} catch (\Exception $exception) {
			\Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
			];
		}
	}
}