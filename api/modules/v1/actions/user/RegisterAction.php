<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use yii\rest\Action;

class RegisterAction extends Action
{
	public function run()
	{
		try {
			$request = \Yii::$app->request;
			/**
			 * @var $model User
			 */
			$model = \Yii::createObject($this->modelClass);
			$result = $model->register($request->getBodyParams());
			return ['data' => $result, 'message' => '注册成功', 'code' => 200];
		} catch (\Exception $exception) {
			return ['data' => new \stdClass(), 'message' => '注册失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}