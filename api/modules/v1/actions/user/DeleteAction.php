<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\Approve;
use api\modules\v1\models\EgoAnswer;
use api\modules\v1\models\EmotionAnswer;
use api\modules\v1\models\Export;
use api\modules\v1\models\Immerse;
use api\modules\v1\models\User;
use common\models\EgoDifferenceGrades;
use common\models\UserIncarnationGrades;
use yii\rest\Action;
use Yii;

class DeleteAction extends Action
{
	public function run()
	{
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			$request = \Yii::$app->request;
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			/* @var $model User */
			$model = $this->modelClass;
			$user = $model::findOne($request->getBodyParam('id'));
			if (!$user) {
				throw new \Exception('用户不存在：' . $request->getBodyParam('id'));
			}
			if ($user->advertisement_divide) {
				AdvertisementAnswer::deleteAll(['user_id' => $user->id]);
			}
			if ($user->ego_divide) {
				EgoAnswer::deleteAll(['user_id' => $user->id]);
				EgoDifferenceGrades::deleteAll(['user_id' => $user->id]);
			}
			if ($user->identify_divide) {
				Approve::deleteAll(['user_id' => $user->id]);
				Immerse::deleteAll(['user_id' => $user->id]);
				UserIncarnationGrades::deleteAll(['user_id' => $user->id]);
			}
			EmotionAnswer::deleteAll(['user_id' => $user->id]);
			Export::find()->where(['user_id' => $user->id])->limit(1)->one()->delete();
			if ($user->delete()) {
				$transaction->commit();
				return ['data' => $user, 'message' => '删除成功', 'code' => 200];
			}
			throw new \Exception('删除失败');
		} catch (\Exception $exception) {
			$transaction->rollBack();
			return ['data' => new \stdClass(), 'message' => '删除失败：' . $exception->getMessage(), 'code' => 300];
		} catch (\Throwable $e) {
			$transaction->rollBack();
			return ['data' => new \stdClass(), 'message' => '删除失败：' . $e->getMessage(), 'code' => 300];
		}
	}
}