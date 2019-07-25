<?php


namespace api\modules\v1\actions\divide;

use api\modules\v1\models\Export;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class ExportAction
 * @package api\modules\v1\actions\divide
 * @property Export $modelClass
 */
class ExportAction extends Action
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
			call_user_func_array([$this->modelClass, 'export'], ['data' => $requestParams]);
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => ''
			];
		}
	}
}