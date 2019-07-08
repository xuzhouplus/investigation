<?php

namespace api\modules\v1\controllers;


use api\modules\v1\actions\user\AuditAction;
use api\modules\v1\actions\user\DeleteAction;
use api\modules\v1\actions\user\DivideAction;
use api\modules\v1\actions\user\ExportAction;
use api\modules\v1\actions\user\IndexAction;
use api\modules\v1\actions\user\LoginAction;
use api\modules\v1\actions\user\RegisterAction;
use api\modules\v1\actions\user\ResetPasswordAction;
use api\modules\v1\actions\user\StateAction;
use api\modules\v1\actions\user\ViewAction;
use api\modules\v1\models\User;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\helpers\ArrayHelper;
use yii\rest\ActiveController;

/**
 * @author Eugene Terentev <eugene@terentev.net>
 */
class UserController extends ActiveController
{
	public $modelClass = User::class;
	public $optional = [
		'login',
		'register'
	];

	/**
	 * {@inheritdoc}
	 */
	protected function verbs()
	{
		return [
			'register' => ['POST'],
			'login' => ['POST'],
			'audit' => ['POST', 'PUT', 'PATCH'],
			'resetPassword' => ['POST', 'PUT', 'PATCH'],
			'delete' => ['POST', 'DELETE'],
			'index' => ['GET', 'POST', 'HEAD'],
			'export' => ['GET', 'POST', 'HEAD'],
			'divide' => ['GET', 'POST']
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
			'login' => [
				'class' => LoginAction::class,
				'modelClass' => $this->modelClass,
			],
			'register' => [
				'class' => RegisterAction::class,
				'modelClass' => $this->modelClass,
			],
			'audit' => [
				'class' => AuditAction::class,
				'modelClass' => $this->modelClass,
			],
			'index' => [
				'class' => IndexAction::class,
				'modelClass' => $this->modelClass,
			],
			'view' => [
				'class' => ViewAction::class,
				'modelClass' => $this->modelClass
			],
			'delete' => [
				'class' => DeleteAction::class,
				'modelClass' => $this->modelClass,
			],
			'resetPassword' => [
				'class' => ResetPasswordAction::class,
				'modelClass' => $this->modelClass,
			],
			'export' => [
				'class' => ExportAction::class,
				'modelClass' => $this->modelClass,
			],
			'state' => [
				'class' => StateAction::class,
				'modelClass' => $this->modelClass
			],
			'divide' => [
				'class' => DivideAction::class,
				'modelClass' => $this->modelClass
			]
		];
		return $parentActions;
	}
}
