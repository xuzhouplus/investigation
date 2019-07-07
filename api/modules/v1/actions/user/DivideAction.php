<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use common\components\swoole\Client;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

class DivideAction extends Action
{
	public function run()
	{
		try {
			/**
			 * @var $loginUser User
			 */
			$loginUser = Yii::$app->getUser()->getIdentity();
			if (!$loginUser->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$request = \Yii::$app->request;
			if ($request->getBodyParam('action')) {
				$lock = Client::lock();
				if ($lock) {
					Client::request([
						'action' => 'divideIntoGroups',
						'accessToken' => $loginUser->generateAccessToken(),
						'callback' => ArrayHelper::getValue(Yii::$app->params, 'baseUrl'),
						'lock' => $lock
					]);
				} else {
					return ['message' => '处理失败：有分组任务在进行中请稍后重试', 'code' => 300];
				}
			} else {
				Client::unlock($request->getBodyParam('lock'));
			}
			return ['message' => '处理成功', 'code' => 200];
		} catch (\Exception $exception) {
			\Yii::error($exception->__toString());
			return ['message' => '处理失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}