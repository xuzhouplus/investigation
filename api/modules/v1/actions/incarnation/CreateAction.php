<?php


namespace api\modules\v1\actions\incarnation;


use api\modules\v1\models\Incarnation;
use yii\rest\Action;

class CreateAction extends Action
{
	public $scenario = 'create';

	public function run()
	{
		try {
			if (!\Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$request = \Yii::$app->request;
			/**
			 * @var $model Incarnation
			 */
			$model = $this->modelClass;
			/**
			 * @var $model Incarnation
			 */
			$result = $model::create($request->getBodyParams());
			if ($result) {
				return [
					'data' => [
						'id' => $result->id,
						'name' => $result->name,
						'description' => $result->description,
						'file' => $result->file->fileUrl()
					],
					'message' => '创建成功',
					'code' => 200
				];
			}
			return ['data' => (new \stdClass()), 'message' => '创建失败', 'code' => 300];
		} catch (\Exception $exception) {
			return ['data' => (new \stdClass()), 'message' => '创建失败：' . $exception->getMessage(), 'code' => 300];
		}
	}
}