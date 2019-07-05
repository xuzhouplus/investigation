<?php


namespace api\modules\v1\models;

use common\models\EmotionAnswer as CommonEmotionAnswer;
use Yii;
use yii\helpers\ArrayHelper;

class EmotionAnswer extends CommonEmotionAnswer
{
	/**
	 * @param $data
	 * @return array
	 * @throws \Throwable
	 */
	public static function submit($data)
	{
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			$loginUser = Yii::$app->getUser()->getIdentity();
			$answers = ArrayHelper::getValue($data, 'answers');
			if (is_string($answers)) {
				$answers = json_decode($answers, true);
				if (empty($answers)) {
					throw new \Exception('解析answers参数失败：' . json_last_error_msg());
				}
			}
			self::deleteAll(['user_id' => $loginUser->getId()]);
			$options = EmotionOption::find()->indexBy('id')->where(['id' => array_values($answers)])->all();
			$answerData = [];
			foreach ($answers as $questionID => $answerID) {
				$option = ArrayHelper::getValue($options, $answerID);
				$record = [
					'question_id' => $questionID,
					'user_id' => $loginUser->getId(),
					'option_id' => $option->id,
					'grades' => $option->grades
				];
				$answerData[] = $record;
			}
			if (!empty($answerData)) {
				self::getDb()->createCommand()->batchInsert(self::tableName(), ['question_id', 'user_id', 'option_id', 'grades'], $answerData)->execute();
			}
			$transaction->commit();
			return $answerData;
		} catch (\Exception $exception) {
			$transaction->rollBack();
			throw $exception;
		}
	}
}