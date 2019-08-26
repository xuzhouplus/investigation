<?php


namespace api\modules\v1\controllers;


use api\modules\v1\models\Export;
use api\modules\v1\models\User;
use common\components\swoole\Client;
use Yii;
use yii\helpers\ArrayHelper;
use yii\web\Controller;

class TestController extends Controller
{
	public $enableCsrfValidation = false;

	public function actionIndex()
	{
		/**
		 * @var $loginUser User
		 */
		$loginUser = \Yii::$app->user->loginByAccessToken(Yii::$app->request->post('access_token'));
		if (empty($loginUser) || !$loginUser->administrator()) {
			\Yii::$app->response->statusCode = 404;
			return \Yii::$app->response;
		}
		foreach (Export::find()->each() as $item) {
			/**
			 * @var $item Export
			 */
			$currentUser = User::find()->where(['id' => $item->user_id])->limit(1)->one();

			Client::request([
				'action' => 'emotion',
				'access_token' => $currentUser->generateAccessToken(),
			]);
			Client::request([
				'action' => 'brandAttitude',
				'access_token' => $currentUser->generateAccessToken(),
			]);
			Client::request([
				'action' => 'brandMemory',
				'access_token' => $currentUser->generateAccessToken(),
				'callback' => ArrayHelper::getValue(Yii::$app->params, 'backendBaseUrl') . '/v1/swoole/callback',
			]);
		}
		Yii::$app->response->data = 'success';
		return Yii::$app->response;
	}
}