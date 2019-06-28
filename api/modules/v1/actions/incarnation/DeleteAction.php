<?php


namespace api\modules\v1\actions\incarnation;


use api\modules\v1\models\Incarnation;
use yii\rest\Action;
use Yii;

/**
 * Class DeleteAction
 * @package api\modules\v1\actions\incarnation
 * @property Incarnation $modelClass
 */
class DeleteAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$result = call_user_func_array([$this->modelClass, 'remove'], ['data' => Yii::$app->request->getBodyParam('id')]);
			if ($result) {
				return [
					'code' => 200,
					'message' => '删除成功'
				];
			}
			return ['code' => 300, 'message' => '删除失败'];
		} catch (\Exception $exception) {
			return ['code' => 300, 'message' => $exception->getMessage()];
		}
	}
}