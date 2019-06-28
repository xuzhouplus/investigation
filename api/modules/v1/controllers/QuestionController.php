<?php


namespace api\modules\v1\controllers;


use api\modules\v1\actions\question\AnswerAction;
use api\modules\v1\actions\question\CreateAction;
use api\modules\v1\actions\question\DeleteAction;
use api\modules\v1\actions\question\IndexAction;
use api\modules\v1\actions\question\UpdateAction;
use api\modules\v1\actions\question\ViewAction;
use api\modules\v1\models\Question;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\helpers\ArrayHelper;
use yii\rest\ActiveController;

class QuestionController extends ActiveController
{
	public $modelClass = Question::class;
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
			'view' => ['GET', 'POST'],
			'answer' => ['POST', 'PUT']
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
			],
			'view' => [
				'class' => ViewAction::class,
				'modelClass' => $this->modelClass
			],
			'answer' => [
				'class' => AnswerAction::class,
				'modelClass' => $this->modelClass
			]
		];
		return $parentActions;
	}
}