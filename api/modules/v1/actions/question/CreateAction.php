<?php


namespace api\modules\v1\actions\question;


use api\modules\v1\models\Question;
use yii\rest\Action;

/**
 * Class CreateAction
 * @package api\modules\v1\actions\question
 * @property Question $modelClass
 */
class CreateAction extends Action
{
	public $scenario = 'create';

	public function run()
	{
		try {
			if (!\Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$result = call_user_func_array([$this->modelClass, 'createQuestion'], ['data' => \Yii::$app->request->getBodyParams()]);
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