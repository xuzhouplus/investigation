<?php


namespace api\modules\v1\models;

use common\models\Answer as CommonAnswer;
use Yii;
use yii\helpers\ArrayHelper;

class Answer extends CommonAnswer
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
			$answers = ArrayHelper::getValue($data, 'answers');
			if (is_string($answers)) {
				$answers = json_decode($answers, true);
				if (empty($answers)) {
					throw new \Exception('解析answers参数失败：' . json_last_error_msg());
				}
			}
			$questionIDS = array_keys($answers);
			self::deleteAll(['question_id' => $questionIDS, 'user_id' => $loginUser->getId()]);
			$answerData = [];
			foreach ($answers as $questionID => $answerID) {
				$option = Option::find()->where(['id' => $answerID])->one();
				$answerData[] = [
					'question_id' => $questionID,
					'user_id' => $loginUser->getId(),
					'option_id' => $option->id,
					'grades' => $option->grades
				];
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