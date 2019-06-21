<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use yii\rest\Action;

class AuditAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$request = \Yii::$app->request;
			/**
			 * @var $model User
			 */
			$model = \Yii::createObject($this->modelClass);
			$result = $model->audit($request->getBodyParams());
			if ($result) {
				return ['message' => '修改成功', 'code' => 200];
			}
			return ['message' => '修改失败', 'code' => 300];
		} catch (\Exception $exception) {
			return ['message' => '修改失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}