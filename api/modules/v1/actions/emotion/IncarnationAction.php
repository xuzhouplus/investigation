<?php


namespace api\modules\v1\actions\emotion;


use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class IncarnationAction
 * @package api\modules\v1\actions\emotion
 * @property User $modelClass
 */
class IncarnationAction extends Action
{
	public function run()
	{
		try {
			$user = Yii::$app->user->getIdentity();
			if (!$user) {
				throw new \Exception('用户不存在');
			}
			if (!$user->ego_incarnation) {
				throw new \Exception('用户没有相关分组信息');
			}
			if ($user->advertisement_divide == 1) {
				$advertisementFile = $user->egoIncarnation->advertisement->onFile->fileUrl();
			} else {
				$advertisementFile = $user->egoIncarnation->advertisement->sideFile->fileUrl();
			}
			$result = [
				'incarnation_name' => $user->egoIncarnation->name,
				'incarnation_description' => $user->egoIncarnation->description,
				'incarnation_gender' => $user->egoIncarnation->gender,
				'incarnation_file' => $user->egoIncarnation->file->fileUrl(),
				'advertisement_file' => $advertisementFile,
				'advertisement_description' => $user->egoIncarnation->advertisement->description
			];
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