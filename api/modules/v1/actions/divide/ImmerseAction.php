<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\Immerse;
use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class ImmerseAction
 * @package api\modules\v1\actions\divide
 * @property Immerse $modelClass
 */
class ImmerseAction extends Action
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
			if (is_null($user->incarnation_id)) {
				throw new \Exception('该用户没有参与情绪量化答题');
			}
			/**
			 * @var $immerses Immerse[]
			 */
			$immerses = Immerse::find()->joinWith(['incarnation'])->where([Immerse::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')])->cache()->all();
			$result = [];
			foreach ($immerses as $immerse) {
				$result[] = [
					'incarnation_name' => $immerse->incarnation->name,
					'incarnation_file' => $immerse->incarnation->file->fileUrl(),
					'incarnation_description' => $immerse->incarnation->description,
					'incarnation_gender' => $immerse->incarnation->gender,
					'grades' => $immerse->grades
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