<?php


namespace api\modules\v1\controllers;


use api\modules\v1\actions\approve\IndexAction;
use api\modules\v1\actions\approve\SubmitAction;
use api\modules\v1\models\Approve;
use common\filters\AccessTokenAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\rest\ActiveController;

/**
 * 化身认同
 * Class ApproveController
 * @package api\modules\v1\controllers
 */
class ApproveController extends ActiveController
{
	public $modelClass = Approve::class;
	public $optional = [
	];

	/**
	 * {@inheritdoc}
	 */
	protected function verbs()
	{
		return [
			'index' => ['GET', 'POST'],
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
			'index' => [
				'class' => IndexAction::class,
				'modelClass' => $this->modelClass,
			],
			'submit' => [
				'class' => SubmitAction::class,
				'modelClass' => $this->modelClass,
			]
		];
		return $parentActions;
	}
}