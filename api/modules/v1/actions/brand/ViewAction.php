<?php


namespace api\modules\v1\actions\brand;


use api\modules\v1\models\EgoQuestion;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class ViewAction
 * @package api\modules\v1\actions\brand
 * @property EgoQuestion $modelClass
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
			$result = call_user_func_array([$this->modelClass, 'getView'], ['id' => ArrayHelper::getValue($requestParams, 'id')]);
			return [
				'code' => 200,
				'message' => '获取成功',
				'data' => $result
			];
		} catch (\Exception $exception) {
			\Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => (new \stdClass())
			];
		}
	}
}