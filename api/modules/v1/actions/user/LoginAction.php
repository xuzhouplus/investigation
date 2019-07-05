<?php

namespace api\modules\v1\actions\user;

use api\modules\v1\models\User;
use common\components\swoole\Client;
use yii\rest\Action;

class LoginAction extends Action
{
	public function run()
	{
		try {
			$request = \Yii::$app->request;
			/* @var $model User */
			$model = \Yii::createObject($this->modelClass);
			$result = $model->login($request->getBodyParams());
			if ($result) {
				return ['data' => $result, 'message' => '登录成功', 'code' => 200];
			}
			return ['data' => new \stdClass(), 'message' => '登录失败：登录名或密码错误', 'code' => 300];
		} catch (\Exception $exception) {
			return ['data' => new \stdClass(), 'message' => '登录失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}