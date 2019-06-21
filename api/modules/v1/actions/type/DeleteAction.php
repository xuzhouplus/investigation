<?php


namespace api\modules\v1\actions\type;


use api\modules\v1\models\Type;
use yii\rest\Action;

class DeleteAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$request = \Yii::$app->request;
			/**
			 * @var $model Type
			 */
			$model = $this->modelClass;
			$result = $model::deleteType($request->getBodyParam('id'));
			if ($result) {
				return [
					'code' => 200,
					'message' => '删除成功'
				];
			}
			return [
				'code' => 300,
				'message' => '删除失败'
			];
		} catch (\Exception $exception) {
			\Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage()
			];
		}
	}
}