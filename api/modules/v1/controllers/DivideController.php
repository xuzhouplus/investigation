<?php


namespace api\modules\v1\controllers;


use api\modules\v1\actions\divide\ListAction;
use api\modules\v1\actions\divide\RoundAction;
use api\modules\v1\actions\divide\ShortcutAction;
use api\modules\v1\models\User;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\rest\ActiveController;

class DivideController extends ActiveController
{
	public $modelClass = User::class;
	public $optional = [
	];

	/**
	 * {@inheritdoc}
	 */
	protected function verbs()
	{
		return [
			'round' => ['GET', 'POST'],
			'list' => ['GET', 'POST'],
			'shortcut' => ['GET', 'POST']
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
			'list' => [
				'class' => ListAction::class,
				'modelClass' => $this->modelClass,
			],
			'round' => [
				'class' => RoundAction::class,
				'modelClass' => $this->modelClass
			],
			'shortcut' => [
				'class' => ShortcutAction::class,
				'modelClass' => $this->modelClass
			]
		];
		return $parentActions;
	}
}