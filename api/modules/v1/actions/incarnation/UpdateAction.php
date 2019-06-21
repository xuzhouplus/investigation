<?php


namespace api\modules\v1\actions\incarnation;


use api\modules\v1\models\Incarnation;
use common\models\File;
use yii\rest\Action;

class UpdateAction extends Action
{
	public $scenario = 'update';

	public function run()
	{
		try {
			if (!\Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			/**
			 * @var $model Incarnation
			 */
			$model = $this->modelClass;
			$result = $model::modify(\Yii::$app->request->getBodyParams());
			if ($result) {
				return [
					'data' => [
						'id' => $result->id,
						'name' => $result->name,
						'description' => $result->description,
						'file' => $result->file->fileUrl()
					],
					'message' => '更新成功',
					'code' => 200
				];
			}
			return ['data' => (new \stdClass()), 'message' => '更新失败', 'code' => 300];
		} catch (\Exception $exception) {
			return ['code' => 300, 'message' => $exception->getMessage(), 'data' => (new \stdClass())];
		}
	}
}