<?php


namespace api\modules\v1\actions\brand;


use api\modules\v1\models\AdvertisementAnswer;
use common\components\swoole\Client;
use yii\rest\Action;

/**
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
				Client::request([
					'action' => 'countAdvertisementGrades',
					'accessToken' => \Yii::$app->user->getIdentity()->generateAccessToken()
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