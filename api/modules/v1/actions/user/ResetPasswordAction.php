<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
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
			$loginUser = \Yii::$app->getUser()->getIdentity();
			if (!$loginUser) {
				throw new \Exception('用户不存在');
			}
			$loginUser->setPassword($request->getBodyParam('password'));
			if ($loginUser->save()) {
				return ['message' => '修改成功', 'code' => 200];
			}
			return ['message' => '修改失败', 'code' => 300];
		} catch (\Exception $exception) {
			return ['message' => '修改失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}