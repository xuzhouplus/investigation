<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 用户自我差异得分，虚拟自我差异=虚拟自我-现实自我
 * Class EgoDifferenceGrades
 * @package common\models
 * @property int $user_id
 * @property int $incarnation_id
 * @property int $type 1外倾性，2宜人性，3尽责性，4神经质，5开放性
 * @property int $grades
 */
class EgoDifferenceGrades extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%ego_difference_grades}}';
	}
}