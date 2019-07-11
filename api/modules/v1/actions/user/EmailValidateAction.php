<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use Yii;
use yii\rest\Action;

/**
 * Class EmailValidateAction
 * @package api\modules\v1\actions\user
 * @property User $modelClass
 */
class EmailValidateAction extends Action
{
	public function run()
	{
		try {
			/**
			 * @var $loginUser User
			 */
			$loginUser = Yii::$app->getUser()->getIdentity();
			$request = \Yii::$app->request;
			$result = $loginUser->validateCaptcha($request->getBodyParam('captcha'));
			if ($result) {
				return ['message' => '验证成功', 'code' => 200];
			}
			return ['message' => '验证失败', 'code' => 300];
		} catch (\Exception $exception) {
			return ['message' => '验证失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}