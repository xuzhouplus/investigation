<?php


namespace api\modules\v1\controllers;


use api\modules\v1\actions\ego\SubmitAction;
use api\modules\v1\actions\ego\CreateAction;
use api\modules\v1\actions\ego\DeleteAction;
use api\modules\v1\actions\ego\QuestionAction;
use api\modules\v1\actions\ego\UpdateAction;
use api\modules\v1\actions\ego\ViewAction;
use api\modules\v1\models\EgoAnswer;
use api\modules\v1\models\EgoQuestion;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\rest\ActiveController;

class EgoController extends ActiveController
{
	public $modelClass = EgoQuestion::class;
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
			'question' => ['GET', 'POST', 'HEAD'],
			'view' => ['GET', 'POST'],
			'submit' => ['POST', 'PUT']
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
				'modelClass' => EgoQuestion::class,
			],
			'delete' => [
				'class' => DeleteAction::class,
				'modelClass' => EgoQuestion::class,
			],
			'create' => [
				'class' => CreateAction::class,
				'modelClass' => EgoQuestion::class,
			],
			'update' => [
				'class' => UpdateAction::class,
				'modelClass' => EgoQuestion::class,
			],
			'view' => [
				'class' => ViewAction::class,
				'modelClass' => EgoQuestion::class
			],
			'submit' => [
				'class' => SubmitAction::class,
				'modelClass' => EgoAnswer::class
			]
		];
		return $parentActions;
	}
}