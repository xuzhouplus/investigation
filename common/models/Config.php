<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 系统配置
 * Class Config
 * @package common\models
 * @property int $id
 * @property string $name
 * @property string $value
 * @property string $description
 * @property string $type
 * @property int $required
 */
class Config extends ActiveRecord
{
	const REQUIRED_TRUE = 1;
	const REQUIRED_FALSE = 2;

	const CONFIG_ROUND_KEY='round';

	public static function tableName()
	{
		return '{{%config}}';
	}
}