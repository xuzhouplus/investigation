<?php


namespace api\modules\v1\actions\brand;


use api\modules\v1\models\AdvertisementAnswer;
use api\modules\v1\models\AdvertisementOption;
use api\modules\v1\models\AdvertisementQuestion;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class AttitudeAction
 * @package api\modules\v1\actions\brand
 * @property AdvertisementAnswer $modelClass
 */
class AttitudeAction extends Action
{
	public function run()
	{
		try {
			$questionOptions = [];
			$options = AdvertisementOption::find()->joinWith(['question'])->where([AdvertisementQuestion::tableName() . '.type' => AdvertisementQuestion::TYPE_BRAND_ATTITUDE])->all();
			foreach ($options as $option) {
				if (!isset($questionOptions[$option->question_id])) {
					$questionOptions[$option->question_id] = [];
				}
				$questionOptions[$option->question_id][$option->grades] = $option->id;
			}

			$data = \Yii::$app->request->getBodyParams();

			$answers = ArrayHelper::getValue($data, 'answers');
			if (is_string($answers)) {
				$answers = json_decode($answers, true);
				if (empty($answers)) {
					throw new \Exception('解析answers参数失败：' . json_last_error_msg());
				}
			}
			foreach ($answers as $questionID => $grades) {
				$answers[$questionID] = ArrayHelper::getValue($questionOptions, [$questionID, $grades]);
			}
			$data['answers'] = $answers;
			$result = call_user_func_array([$this->modelClass, 'submit'], ['data' => $data]);
			if ($result) {
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