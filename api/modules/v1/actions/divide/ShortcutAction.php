<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class ShortcutAction
 * @package api\modules\v1\actions\divide
 * @property User $modelClass
 */
class ShortcutAction extends Action
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

			$countParams = $requestParams;
			$total = intval(call_user_func_array([$this->modelClass, 'count'], ['data' => $countParams]));
			$countParams['advertisement_status'] = User::ADVERTISEMENT_STATUS_WAIT;
			$ongoing = intval(call_user_func_array([$this->modelClass, 'count'], ['data' => $countParams]));
			$identifyDivide = [];
			$identifyParams = $requestParams;
			foreach (User::IDENTIFY_DIVIDE_LEVEL as $divide) {
				$identifyParams['identify_divide'] = ArrayHelper::getValue($divide, 'value');
				$identifyDivide[] = [
					'name' => ArrayHelper::getValue($divide, 'key'),
					'count' => intval(call_user_func_array([$this->modelClass, 'count'], ['data' => $identifyParams])),
				];
			}
			unset($requestParams['identify_divide']);
			$egoDivide = [];
			foreach (User::EGO_DIVIDE_LEVEL as $divide) {
				$requestParams['ego_divide'] = ArrayHelper::getValue($divide, 'value');
				$egoDivide[] = [
					'name' => ArrayHelper::getValue($divide, 'key'),
					'count' => intval(call_user_func_array([$this->modelClass, 'count'], ['data' => $requestParams]))
				];
			}
			unset($requestParams['ego_divide']);
			$advertisementDivide = [];
			foreach (User::ADVERTISEMENT_DIVIDE_LEVEL as $divide) {
				$requestParams['advertisement_divide'] = ArrayHelper::getValue($divide, 'value');
				$advertisementDivide[] = [
					'name' => ArrayHelper::getValue($divide, 'key'),
					'count' => intval(call_user_func_array([$this->modelClass, 'count'], ['data' => $requestParams]))
				];
			}
			return [
				'code' => 200,
				'message' => '获取成功',
				'data' => compact('identifyDivide', 'egoDivide', 'advertisementDivide', 'total', 'ongoing')
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