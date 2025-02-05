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
 * 品牌记忆答题
 * Class MemoryAction
 * @package api\modules\v1\actions\brand
 * @property AdvertisementAnswer $modelClass
 */
class MemoryAction extends Action
{
	public function run()
	{
		try {
			/**
			 * @var $loginUser User
			 */
			$loginUser = Yii::$app->getUser()->getIdentity();
			$questionOptions = [];
			/**
			 * @var $options AdvertisementOption[]
			 */
			$options = AdvertisementOption::find()->joinWith(['question'])->where([AdvertisementQuestion::tableName() . '.type' => AdvertisementQuestion::TYPE_BRAND_MEMORY, AdvertisementQuestion::tableName() . '.status' => AdvertisementQuestion::STATUS_ACTIVE])->all();
			foreach ($options as $option) {
				if (!isset($questionOptions[$option->question_id])) {
					$questionOptions[$option->question_id] = [];
				}
				$questionOptions[$option->question_id][$option->blank_index][$option->name] = $option->grades;
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
			foreach ($answers as $questionID => $answer) {
				if (is_string($answer)) {
					$blankValue = json_decode($answer, true);
					if (empty($blankValue)) {
						$blankValue = explode(',', $answer);
					}
				} else {
					$blankValue = $answer;
				}
				if (empty($blankValue)) {
					throw new \Exception('答题内容为空' . $questionID);
				}
				foreach ($blankValue as $blankIndex => $item) {
					$userAnswer[] = [
						'question_id' => $questionID,
						'user_id' => $loginUser->getId(),
						'answer' => $item,
						'grades' => ArrayHelper::getValue($questionOptions, [$questionID, $blankIndex + 1, $item]) ?: 0
					];
				}
			}
			$result = call_user_func_array([$this->modelClass, 'batchInsert'], ['answerData' => $userAnswer]);
			if ($result) {
				Client::request([
					'action' => 'brandMemory',
					'access_token' => $loginUser->generateAccessToken(),
					'callback' => ArrayHelper::getValue(Yii::$app->params, 'backendBaseUrl') . '/v1/swoole/callback',
				]);
				return [
					'code' => 200,
					'message' => '提交成功',
					'data' => $result
				];
			}
			return [
				'code' => 200,
				'message' => '提交失败',
				'data' => $result
			];
		} catch (\Exception $exception) {
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => (new \stdClass())
			];
		}
	}
}