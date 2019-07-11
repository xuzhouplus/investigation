<?php


namespace api\modules\v1\actions\swoole;


use api\modules\v1\models\User;
use common\components\swoole\Client;
use Yii;
use yii\rest\Action;

/**
 * Class CallbackAction
 * @package api\modules\v1\actions\swoole
 * @property User $modelClass
 */
class CallbackAction extends Action
{
	public function run()
	{
		try {
			$request = Yii::$app->request;
			if ($request->getBodyParam('lock')) {
				Client::unlock(json_decode($request->getBodyParam('lock'), 'true'));
			}
			Yii::$app->cache->delete($request->getBodyParam('access_token'));
			return ['message' => '处理成功', 'code' => 200];
		} catch (\Exception $exception) {
			\Yii::error($exception->__toString());
			return ['message' => '处理失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}