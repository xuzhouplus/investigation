<?php


namespace api\modules\v1\controllers;


use api\modules\v1\actions\divide\AdvertisementAnswerAction;
use api\modules\v1\actions\divide\ApproveAction;
use api\modules\v1\actions\divide\EgoAnswerAction;
use api\modules\v1\actions\divide\EmotionAnswerAction;
use api\modules\v1\actions\divide\ImmerseAction;
use api\modules\v1\actions\divide\UserAction;
use api\modules\v1\actions\divide\ListAction;
use api\modules\v1\actions\divide\RoundAction;
use api\modules\v1\actions\divide\ShortcutAction;
use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\Approve;
use api\modules\v1\models\EgoAnswer;
use api\modules\v1\models\EmotionAnswer;
use api\modules\v1\models\Immerse;
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
			'shortcut' => ['GET', 'POST'],
			'user' => ['GET', 'POST'],
			'approve' => ['GET', 'POST'],
			'immerse' => ['GET', 'POST'],
			'egoAnswer' => ['GET', 'POST'],
			'emotionAnswer' => ['GET', 'POST'],
			'advertisementAnswer' => ['GET', 'POST']
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
			],
			'user' => [
				'class' => UserAction::class,
				'modelClass' => $this->modelClass
			],
			'approve' => [
				'class' => ApproveAction::class,
				'modelClass' => Approve::class
			],
			'immerse' => [
				'class' => ImmerseAction::class,
				'modelClass' => Immerse::class
			],
			'egoAnswer' => [
				'class' => EgoAnswerAction::class,
				'modelClass' => EgoAnswer::class
			],
			'emotionAnswer' => [
				'class' => EmotionAnswerAction::class,
				'modelClass' => EmotionAnswer::class
			],
			'advertisementAnswer' => [
				'class' => AdvertisementAnswerAction::class,
				'modelClass' => AdvertisementAnswer::class
			]
		];
		return $parentActions;
	}
}