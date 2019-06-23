<?php


namespace api\modules\v1\actions\incarnation;


use api\modules\v1\models\Incarnation;
use yii\rest\Action;
use Yii;

class DeleteAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			/**
			 * @var $model Incarnation
			 */
			$model = $this->modelClass;
			$result = $model::remove(\Yii::$app->request->getBodyParams());
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