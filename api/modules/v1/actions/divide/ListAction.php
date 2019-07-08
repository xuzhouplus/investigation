<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\User;
use Yii;
use yii\rest\Action;

/**
 * Class ListAction
 * @package api\modules\v1\actions\divide
 * @property User $modelClass
 */
class ListAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$requestParams = Yii::$app->getRequest()->getBodyParams();
			if (empty($requestParams)) {
				$requestParams = Yii::$app->getRequest()->getQueryParams();
			}
			$requestParams['role'] = User::ROLE_USER;
			$requestParams['divide'] = true;
			$result = call_user_func_array([$this->modelClass, 'getList'], ['data' => $requestParams]);
			return [
				'code' => 200,
				'message' => '获取成功',
				'data' => $result
			];
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => new \stdClass()
			];
		}
	}
}