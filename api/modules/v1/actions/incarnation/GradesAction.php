<?php


namespace api\modules\v1\actions\incarnation;


use api\modules\v1\models\Approve;
use api\modules\v1\models\Immerse;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

class GradesAction extends Action
{
	/**
	 * @return array
	 * @throws \Throwable
	 */
	public function run()
	{
		try {
			$request = \Yii::$app->request;
			if ($request->isGet) {
				$approve = Approve::getList($request->getQueryParams());
				$immerse = Immerse::getList($request->getQueryParams());
				return [
					'code' => 200,
					'message' => '获取成功',
					'data' => compact('approve', 'immerse')
				];
			} else {
				$loginUser = Yii::$app->getUser()->getIdentity();
				$requestParams = $request->getBodyParam('grades');
				if (is_string($requestParams)) {
					$requestParams = json_decode($requestParams, true);
				}
				$approves = ArrayHelper::getValue($requestParams, 'approve');
				$approveSet = [];
				foreach ($approves as $incarnationID => $approve) {
					$approveSet[] = [
						'incarnation_id' => $incarnationID,
						'grades' => $approve
					];
				}
				$approveResult = Approve::submit(['user_id' => $loginUser->getId(), 'grades' => $approveSet]);
				$immerses = ArrayHelper::getValue($requestParams, 'immerse');
				$immerseSet = [];
				foreach ($immerses as $incarnationID => $immerse) {
					$immerseSet[] = [
						'incarnation_id' => $incarnationID,
						'grades' => $immerse
					];
				}
				$immerseResult = Immerse::submit(['user_id' => $loginUser->getId(), 'grades' => $immerseSet]);
				return [
					'code' => 200,
					'message' => '获取成功',
					'data' => [
						'approve' => $approveResult,
						'immerse' => $immerseResult
					]
				];
			}
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