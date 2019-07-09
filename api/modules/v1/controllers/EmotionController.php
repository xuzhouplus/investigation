<?php


namespace api\modules\v1\controllers;

use api\modules\v1\actions\emotion\IncarnationAction;
use api\modules\v1\actions\emotion\SubmitAction;
use api\modules\v1\actions\emotion\CreateAction;
use api\modules\v1\actions\emotion\DeleteAction;
use api\modules\v1\actions\emotion\QuestionAction;
use api\modules\v1\actions\emotion\UpdateAction;
use api\modules\v1\actions\emotion\ViewAction;
use api\modules\v1\models\EmotionAnswer;
use api\modules\v1\models\EmotionQuestion;
use api\modules\v1\models\User;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\rest\ActiveController;

class EmotionController extends ActiveController
{
	public $modelClass = EmotionQuestion::class;
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
			'submit' => ['POST', 'PUT'],
			'incarnation' => ['GET', 'POST']
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
			'incarnation' => [
				'class' => IncarnationAction::class,
				'modelClass' => User::class,
			],
			'question' => [
				'class' => QuestionAction::class,
				'modelClass' => EmotionQuestion::class,
			],
			'delete' => [
				'class' => DeleteAction::class,
				'modelClass' => EmotionQuestion::class,
			],
			'create' => [
				'class' => CreateAction::class,
				'modelClass' => EmotionQuestion::class,
			],
			'update' => [
				'class' => UpdateAction::class,
				'modelClass' => EmotionQuestion::class,
			],
			'view' => [
				'class' => ViewAction::class,
				'modelClass' => EmotionQuestion::class
			],
			'submit' => [
				'class' => SubmitAction::class,
				'modelClass' => EmotionAnswer::class
			]
		];
		return $parentActions;
	}
}