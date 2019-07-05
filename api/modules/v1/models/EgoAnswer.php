<?php


namespace api\modules\v1\models;

use common\models\EgoAnswer as CommonEgoAnswer;
use Yii;
use yii\helpers\ArrayHelper;

class EgoAnswer extends CommonEgoAnswer
{
	/**
	 * @param $data
	 * @return array
	 * @throws \Throwable
	 * @throws \yii\db\Exception
	 */
	public static function submit($data)
	{
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			$loginUser = Yii::$app->getUser()->getIdentity();
			$deleteCondition = [
				'user_id' => $loginUser->getId(),
				'incarnation_id' => -1
			];
			$incarnationID = ArrayHelper::getValue($data, 'incarnation_id');
			$incarnation = null;
			if ($incarnationID) {
				$incarnation = Incarnation::findOne($incarnationID);
				$deleteCondition['incarnation_id'] = $incarnationID;
			}
			$answers = ArrayHelper::getValue($data, 'answers');
			if (is_string($answers)) {
				$answers = json_decode($answers, true);
				if (empty($answers)) {
					throw new \Exception('解析answers参数失败：' . json_last_error_msg());
				}
			}
			$deleteCondition['question_id'] = array_keys($answers);
			self::deleteAll($deleteCondition);
			$options = EgoOption::find()->indexBy('id')->where(['id' => array_values($answers)])->all();
			$answerData = [];
			foreach ($answers as $questionID => $answerID) {
				$option = ArrayHelper::getValue($options, $answerID);
				$record = [
					'question_id' => $questionID,
					'user_id' => $loginUser->getId(),
					'option_id' => $option->id,
					'incarnation_id' => -1,
					'grades' => $option->grades
				];
				if ($incarnation) {
					$record['incarnation_id'] = $incarnation->id;
				}
				$answerData[] = $record;
			}
			if (!empty($answerData)) {
				self::getDb()->createCommand()->batchInsert(self::tableName(), ['question_id', 'user_id', 'option_id', 'incarnation_id', 'grades'], $answerData)->execute();
			}
			$transaction->commit();
			return $answerData;
		} catch (\Exception $exception) {
			$transaction->rollBack();
			throw $exception;
		}
	}
}