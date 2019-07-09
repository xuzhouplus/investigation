<?php


namespace api\modules\v1\actions\mailer;


use api\modules\v1\models\User;
use common\components\swoole\Client;
use Yii;
use yii\rest\Action;

class ResetPasswordAction extends Action
{
	public function run()
	{
		try {
			$request = Yii::$app->request;
			/**
			 * @var $loginUser User
			 */
			$loginUser = User::findByUsername($request->getBodyParam('username'));
			if (!$loginUser) {
				throw new \Exception('用户名错误');
			}
			if (!$loginUser->validateEmail($request->getBodyParam('email'))) {
				throw new \Exception('邮箱验证失败');
			}
			$accessToken = $loginUser->generateAccessToken();
			Client::request([
				'action' => 'mailer',
				'view' => '@console/mail/views/ResetPassword',
				'params' => [
					'topic' => '重置密码'
				],
				'accessToken' => $accessToken
			]);
			return ['message' => '创建成功', 'code' => 200];
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			return ['message' => '发送失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}