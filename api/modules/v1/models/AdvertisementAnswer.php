<?php


namespace api\modules\v1\models;

use common\models\AdvertisementAnswer as CommonAdvertisementAnswer;
use Yii;
use yii\db\Exception;
use yii\helpers\ArrayHelper;

class AdvertisementAnswer extends CommonAdvertisementAnswer
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
			self::deleteAll($deleteCondition);
			$options = AdvertisementOption::find()->indexBy('id')->where(['id' => array_values($answers)])->all();
			$answerData = [];
			/**
			 * @var $option AdvertisementOption
			 */
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

	/**
	 * @param $answerData
	 * @throws Exception
	 */
	public static function batchInsert($answerData)
	{
		if (empty($answerData)) {
			return;
		}
		$first = reset($answerData);
		self::getDb()->createCommand()->batchInsert(self::tableName(), array_keys($first), $answerData)->execute();
	}
}