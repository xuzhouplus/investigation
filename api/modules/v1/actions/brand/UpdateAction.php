<?php


namespace api\modules\v1\actions\brand;


use api\modules\v1\models\EgoQuestion;
use yii\rest\Action;
use Yii;

/**
 * Class UpdateAction
 * @package api\modules\v1\actions\brand
 * @property EgoQuestion $modelClass
 */
class UpdateAction extends Action
{
	public $scenario = 'update';

	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$result = call_user_func_array([$this->modelClass, 'updateQuestion'], ['data' => \Yii::$app->request->getBodyParams()]);
			return [
				'code' => 200,
				'message' => '新建成功',
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