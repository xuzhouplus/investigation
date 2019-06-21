<?php


namespace api\modules\v1\models;

use common\models\Type as CommonType;
use yii\helpers\ArrayHelper;

/**
 * Class Type
 * @package api\modules\v1\models
 */
class Type extends CommonType
{
	/**
	 * @param $data
	 * @return Type
	 * @throws \Exception
	 */
	public static function createType($data)
	{
		$type = new Type();
		$type->setScenario('create');
		if ($type->load($data, '') && $type->validate()) {
			$type->save();
			return $type;
		}
		$errors = $type->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	/**
	 * @param $data
	 * @return Type|null
	 * @throws \Exception
	 */
	public static function updateType($data)
	{
		$type = self::findOne(ArrayHelper::getValue($data, 'id'));
		if (!$type) {
			throw new \Exception('类型不存在');
		}
		$type->setScenario('update');
		if ($type->load($data) && $type->validate()) {
			$type->save();
			return $type;
		}
		$errors = $type->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	/**
	 * @param $id
	 * @return false|int
	 * @throws \Throwable
	 * @throws \yii\db\StaleObjectException
	 */
	public static function deleteType($id)
	{
		$type = self::findOne($id);
		if (!$type) {
			throw new \Exception('类型不存在');
		}
		return $type->delete();
	}
}