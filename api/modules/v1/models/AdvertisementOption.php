<?php


namespace api\modules\v1\models;

use common\models\AdvertisementOption as CommonAdvertisementOption;
use yii\helpers\ArrayHelper;

class AdvertisementOption extends CommonAdvertisementOption
{
	/**
	 * @param $questionID
	 * @param $options
	 * @return array
	 * @throws \Exception
	 */
	public static function createOptions($questionID, $options)
	{
		if (is_string($options)) {
			$options = json_decode($options, true);
		}
		foreach ($options as $index => $item) {
			$options[$index]['question_id'] = $questionID;
		}
		return self::batchInsert($options);
	}

	/**
	 * 编辑
	 * @param $data
	 * @return EgoOption|null
	 * @throws \Exception
	 */
	public static function updateOptions($questionID, $options)
	{
		if (is_string($options)) {
			$options = json_decode($options, true);
		}
		foreach ($options as $index => $item) {
			$options[$index]['question_id'] = $questionID;
		}
		self::batchDelete($questionID);
		return self::batchInsert($options);
	}

	/**
	 * 删除
	 * @param $data
	 * @return false|int
	 * @throws \Throwable
	 * @throws \yii\db\StaleObjectException
	 */
	public static function deleteOptions($data)
	{
		$questionID = ArrayHelper::getValue($data, 'question_id');
		if ($questionID) {
			return self::deleteAll(['question_id' => $questionID]);
		}
		$optionsID = ArrayHelper::getValue($data, 'id');
		return self::findOne($optionsID)->delete();
	}
}