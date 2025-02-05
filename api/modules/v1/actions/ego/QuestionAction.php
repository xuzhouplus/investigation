<?php


namespace api\modules\v1\actions\ego;


use api\modules\v1\models\EgoQuestion;
use Yii;
use yii\rest\Action;

/**
 * Class QuestionAction
 * @package api\modules\v1\actions\question
 * @property  EgoQuestion $modelClass
 */
class QuestionAction extends Action
{
	public function run()
	{
		try {
			$requestParams = Yii::$app->getRequest()->getBodyParams();
			if (empty($requestParams)) {
				$requestParams = Yii::$app->getRequest()->getQueryParams();
			}
			$result = call_user_func_array([$this->modelClass, 'getList'], ['data' => $requestParams]);
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