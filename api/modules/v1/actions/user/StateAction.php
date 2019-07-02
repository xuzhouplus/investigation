<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use Yii;
use yii\rest\Action;

/**
 * Class StateAction
 * @package api\modules\v1\actions\user
 * @property User $modelClass
 */
class StateAction extends Action
{
	/**
	 * @return array
	 * @throws \Throwable
	 */
	public function run()
	{
		try {
			$request = \Yii::$app->request;
			$result = call_user_func_array([$this->modelClass, 'setStates'], ['states' => $request->getBodyParam('states')]);
			if ($result) {
				return ['message' => '修改成功', 'code' => 200, 'data' => $result];
			}
			return ['message' => '修改失败', 'code' => 300];
		} catch (\Exception $exception) {
			return ['message' => '修改失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}