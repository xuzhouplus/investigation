<?php


namespace api\modules\v1\controllers;


use api\modules\v1\actions\mailer\CaptchaAction;
use api\modules\v1\actions\mailer\ResetPasswordAction;
use api\modules\v1\models\User;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\rest\ActiveController;

class MailerController extends ActiveController
{
	public $modelClass = User::class;
	public $optional = [
		'resetPassword',
		'captcha'
	];

	/**
	 * {@inheritdoc}
	 */
	protected function verbs()
	{
		return [
			'resetPassword' => ['POST'],
			'captcha'=>['POST']
		];
	}

	public function behaviors()
	{
		$behaviors = parent::behaviors();
		$behaviors['authenticator'] = [
			'class' => CompositeAuth::class,
			'authMethods' => [
				HttpBearerAuth::class,
				AccessTokenAuth::class
			],
			'optional' => $this->optional,
		];
		return $behaviors;
	}

	public function actions()
	{
		$parentActions = [
			'resetPassword' => [
				'class' => ResetPasswordAction::class,
				'modelClass' => $this->modelClass,
			],
			'captcha' => [
				'class' => CaptchaAction::class,
				'modelClass' => $this->modelClass
			]
		];
		return $parentActions;
	}
}