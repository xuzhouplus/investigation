<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class ViewAction
 * @package api\modules\v1\actions\user
 * @property User $modelClass
 */
class ViewAction extends Action
{
	public function run()
	{
		try {
			$requestParams = Yii::$app->getRequest()->getBodyParams();
			if (empty($requestParams)) {
				$requestParams = Yii::$app->getRequest()->getQueryParams();
			}
			$user = call_user_func_array([$this->modelClass, 'view'], ['id' => ArrayHelper::getValue($requestParams, 'id')]);
			if ($user) {
				return [
					'code' => 200,
					'message' => '获取成功',
					'data' => $user
				];
			}
			throw new \Exception('获取失败');
		} catch (\Exception $exception) {
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => new \stdClass()
			];
		}
	}
}