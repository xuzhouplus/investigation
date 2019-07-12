<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use Yii;
use yii\rest\Action;

/**
 * Class LogoutAction
 * @package api\modules\v1\actions\user
 * @property User $modelClass
 */
class LogoutAction extends Action
{
	public function run()
	{
		try {
			/**
			 * @var $loginUser User
			 */
			$loginUser = Yii::$app->getUser()->getIdentity();
			$loginUser->logout();
			return ['message' => '登出成功', 'code' => 200];
		} catch (\Exception $exception) {
			return ['message' => '登出失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}