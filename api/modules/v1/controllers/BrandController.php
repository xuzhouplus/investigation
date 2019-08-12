<?php


namespace api\modules\v1\controllers;


use api\modules\v1\actions\brand\AttitudeAction;
use api\modules\v1\actions\brand\CreateAction;
use api\modules\v1\actions\brand\DeleteAction;
use api\modules\v1\actions\brand\MemoryAction;
use api\modules\v1\actions\brand\QuestionAction;
use api\modules\v1\actions\brand\SubmitAction;
use api\modules\v1\actions\brand\UpdateAction;
use api\modules\v1\actions\brand\ViewAction;
use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\AdvertisementQuestion;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\rest\ActiveController;

class BrandController extends ActiveController
{
	public $modelClass = AdvertisementQuestion::class;
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
			'question' => ['GET', 'POST'],
			'view' => ['GET', 'POST'],
			'submit' => ['POST']
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
			'question' => [
				'class' => QuestionAction::class,
				'modelClass' => AdvertisementQuestion::class,
			],
			'attitude' => [
				'class' => AttitudeAction::class,
				'modelClass' => AdvertisementAnswer::class
			],
			'memory'=>[
				'class' => MemoryAction::class,
				'modelClass' => AdvertisementAnswer::class
			],
			'delete' => [
				'class' => DeleteAction::class,
				'modelClass' => AdvertisementQuestion::class,
			],
			'create' => [
				'class' => CreateAction::class,
				'modelClass' => AdvertisementQuestion::class,
			],
			'update' => [
				'class' => UpdateAction::class,
				'modelClass' => AdvertisementQuestion::class,
			],
			'view' => [
				'class' => ViewAction::class,
				'modelClass' => AdvertisementQuestion::class
			],
			'submit' => [
				'class' => SubmitAction::class,
				'modelClass' => AdvertisementAnswer::class
			]
		];
		return $parentActions;
	}
}