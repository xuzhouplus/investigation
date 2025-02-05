<?php


namespace api\modules\v1\controllers;


use api\modules\v1\actions\advertisement\CreateAction;
use api\modules\v1\actions\advertisement\DeleteAction;
use api\modules\v1\actions\advertisement\IndexAction;
use api\modules\v1\actions\advertisement\UpdateAction;
use api\modules\v1\models\Advertisement;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\helpers\ArrayHelper;
use yii\rest\ActiveController;

class AdvertisementController extends ActiveController
{
	public $modelClass = Advertisement::class;
	public $optional = [
	];

	/**
	 * {@inheritdoc}
	 */
	protected function verbs()
	{
		return [
			'create' => ['POST'],
			'update' => ['POST', 'PUT', 'PATCH'],
			'delete' => ['POST', 'DELETE'],
			'index' => ['GET', 'POST', 'HEAD'],
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
		$parentActions = parent::actions(); // TODO: Change the autogenerated stub
		$parentActions = ArrayHelper::merge($parentActions, [
			'index' => [
				'class' => IndexAction::class,
				'modelClass' => $this->modelClass,
			],
			'delete' => [
				'class' => DeleteAction::class,
				'modelClass' => $this->modelClass,
			],
			'create' => [
				'class' => CreateAction::class,
				'modelClass' => $this->modelClass,
			],
			'update' => [
				'class' => UpdateAction::class,
				'modelClass' => $this->modelClass,
			]
		]);
		return $parentActions;
	}
}