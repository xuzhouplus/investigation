<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\Approve;
use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class ApproveAction
 * @package api\modules\v1\actions\divide
 * @property Approve $modelClass
 */
class ApproveAction extends Action
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
			/**
			 * @var $user User
			 */
			$user = User::findIdentity(ArrayHelper::getValue($requestParams, 'user_id'));
			if (!$user) {
				throw new \Exception('用户不存在');
			}
			if (is_null($user->identify_divide)) {
				throw new \Exception('该用户没有参与化身认同答题');
			}
			/**
			 * @var $approves Approve[]
			 */
			$approves = Approve::find()->joinWith(['incarnation'])->where([Approve::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
			$result = [];
			foreach ($approves as $approve) {
				$result[] = [
					'incarnation_name' => $approve->incarnation->name,
					'incarnation_file' => $approve->incarnation->file->fileUrl(),
					'incarnation_description' => $approve->incarnation->description,
					'incarnation_gender' => $approve->incarnation->gender,
					'grades' => $approve->grades
				];
			}
			return [
				'code' => 200,
				'message' => '获取成功',
				'data' => $result
			];
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => new \stdClass()
			];
		}
	}
}