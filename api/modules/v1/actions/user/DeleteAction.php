<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use yii\rest\Action;
use Yii;

class DeleteAction extends Action
{
	public function run()
	{
		try {
			$request = \Yii::$app->request;
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			/* @var $model User */
			$model = $this->modelClass;
			$user = $model::findOne($request->getBodyParam('id'));
			if (!$user) {
				throw new \Exception('用户不存在：' . $request->getBodyParam('id'));
			}
			if ($user->delete()) {
				return ['data' => $user, 'message' => '删除成功', 'code' => 200];
			}
			throw new \Exception('删除失败');
		} catch (\Exception $exception) {
			return ['data' => new \stdClass(), 'message' => '删除失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}