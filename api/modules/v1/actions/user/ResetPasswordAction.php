<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

class ResetPasswordAction extends Action
{
	public function run()
	{
		try {
			$request = \Yii::$app->request;
			/**
			 * @var $loginUser User
			 */
			$loginUser = Yii::$app->getUser()->getIdentity();
			if (!$loginUser->administrator()) {
				if ($loginUser->getId() != $request->getBodyParam('id')) {
					throw new \Exception('你没有权限调用此接口');
				}
			}

			/**
			 * @var $model User
			 */
			$model = $this->modelClass;
			$user = $model::findOne($request->getBodyParam('id'));
			if (!$user) {
				throw new \Exception('用户不存在');
			}
			$user->validatePassword($request->getBodyParam('password'));
			$user->setPassword($request->getBodyParam('password2'));
			if ($user->save()) {
				return ['message' => '修改成功', 'code' => 200];
			}
			return ['message' => '修改失败', 'code' => 300];
		} catch (\Exception $exception) {
			return ['message' => '修改失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}