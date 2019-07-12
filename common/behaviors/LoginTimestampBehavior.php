<?php

namespace common\behaviors;

use yii\base\Behavior;
use yii\helpers\ArrayHelper;
use yii\web\User;

/**
 * @author Eugene Terentev <eugene@terentev.net>
 */
class LoginTimestampBehavior extends Behavior
{
	/**
	 * @var string
	 */
	public $attribute = 'logged_at';


	/**
	 * @inheritdoc
	 */
	public function events()
	{
		return [
			User::EVENT_AFTER_LOGIN => 'afterLogin'
		];
	}

	/**
	 * @param $event \yii\web\UserEvent
	 */
	public function afterLogin($event)
	{
		$user = $event->identity;
		$user->touch($this->attribute);
		$accessToken = $user->access_token;
		//去除access_token，因为数据库没有access_token字段，不然会报错
		unset($user->access_token);
		$user->save(false);
		//重新复制access_token，不然Yii::$app->getUser()->getIdentity()登录对象没有access_token数据
		$user->access_token = $accessToken;
	}
}
