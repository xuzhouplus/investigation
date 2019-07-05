<?php


namespace api\modules\v1\actions\emotion;


use api\modules\v1\models\EgoQuestion;
use yii\rest\Action;

/**
 * Class DeleteAction
 * @package api\modules\v1\actions\question
 * @property EgoQuestion $modelClass
 */
class DeleteAction extends Action
{
	public function run()
	{
		try {
			if (!\Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$result = call_user_func_array([$this->modelClass, 'deleteQuestion'], ['id' => \Yii::$app->request->getBodyParam('id')]);
			if ($result) {
				return [
					'code' => 200,
					'message' => '删除成功'
				];
			}
			return [
				'code' => 300,
				'message' => '删除失败'
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