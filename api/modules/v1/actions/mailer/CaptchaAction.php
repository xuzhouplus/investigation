<?php


namespace api\modules\v1\actions\mailer;


use api\modules\v1\models\User;
use common\components\swoole\Client;
use Yii;
use yii\rest\Action;

class CaptchaAction extends Action
{
	public function run()
	{
		try {
			/**
			 * @var $loginUser User
			 */
			$loginUser = Yii::$app->getUser()->getIdentity();
			$accessToken = $loginUser->generateAccessToken();
			Client::request([
				'action' => 'mailer',
				'view' => '@console/mail/views/Captcha',
				'params' => [
					'topic' => '验证码',
					'captcha'=>$loginUser->generateCaptcha()
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