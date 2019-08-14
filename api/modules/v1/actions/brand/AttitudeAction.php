<?php


namespace api\modules\v1\actions\brand;


use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\AdvertisementOption;
use api\modules\v1\models\AdvertisementQuestion;
use api\modules\v1\models\User;
use common\components\swoole\Client;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * 品牌态度答题提交
 * Class AttitudeAction
 * @package api\modules\v1\actions\brand
 * @property AdvertisementAnswer $modelClass
 */
class AttitudeAction extends Action
{
	public function run()
	{
		try {
			/**
			 * @var $loginUser User
			 */
			$loginUser = Yii::$app->getUser()->getIdentity();
			$questionOptions = [];
			$options = AdvertisementOption::find()->joinWith(['question'])->where([AdvertisementQuestion::tableName() . '.type' => AdvertisementQuestion::TYPE_BRAND_ATTITUDE])->all();
			foreach ($options as $option) {
				if (!isset($questionOptions[$option->question_id])) {
					$questionOptions[$option->question_id] = [];
				}
				$questionOptions[$option->question_id][$option->id] = $option->grades;
			}

			$data = \Yii::$app->request->getBodyParams();

			$deleteCondition = [
				'user_id' => $loginUser->getId()
			];
			$answers = ArrayHelper::getValue($data, 'answers');
			if (is_string($answers)) {
				$answers = json_decode($answers, true);
				if (empty($answers)) {
					throw new \Exception('解析answers参数失败：' . json_last_error_msg());
				}
			}
			$deleteCondition['question_id'] = array_keys($answers);
			call_user_func_array([$this->modelClass, 'deleteAll'], ['deleteCondition' => $deleteCondition]);
			$userAnswer = [];
			foreach ($answers as $questionID => $option) {
				$userAnswer[] = [
					'question_id' => $questionID,
					'user_id' => $loginUser->getId(),
					'option_id' => $option,
					'grades' => ArrayHelper::getValue($questionOptions, [$questionID, $option]) ?: 0
				];
			}
			$result = call_user_func_array([$this->modelClass, 'batchInsert'], ['answerData' => $userAnswer]);
			if ($result) {
				/**
				 * @var $loginUser User
				 */
				$loginUser = Yii::$app->getUser()->getIdentity();
				Client::request([
					'action' => 'brandAttitude',
					'access_token' => $loginUser->generateAccessToken(),
					'callback' => ArrayHelper::getValue(Yii::$app->params, 'backendBaseUrl') . '/v1/swoole/callback',
				]);
				return [
					'code' => 200,
					'message' => '提交成功',
					'data' => $result
				];
			}
		} catch (\Exception $exception) {
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => (new \stdClass())
			];
		}
	}
}