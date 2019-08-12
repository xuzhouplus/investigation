<?php


namespace api\modules\v1\actions\brand;


use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\User;
use common\components\swoole\Client;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * 品牌记忆答题提交
 * Class CommitAction
 * @package api\modules\v1\actions\brand
 * @property AdvertisementAnswer $modelClass
 */
class SubmitAction extends Action
{
	public function run()
	{
		try {
			$result = call_user_func_array([$this->modelClass, 'submit'], ['data' => \Yii::$app->request->getBodyParams()]);
			if ($result) {
				/**
				 * @var $loginUser User
				 */
				$loginUser = Yii::$app->getUser()->getIdentity();
				Client::request([
					'action' => 'brandMemory',
					'access_token' => $loginUser->generateAccessToken(),
					'callback' => ArrayHelper::getValue(Yii::$app->params, 'backendBaseUrl') . '/v1/swoole/callback',
				]);
				return [
					'code' => 200,
					'message' => '提交成功',
					'data' => $result
				];
			}
		} catch (\Exception $exception) {
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => (new \stdClass())
			];
		}
	}
}