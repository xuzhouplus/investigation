<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 用户化身认同最终得分，(approve+immerse)/2
 * Class UserIncarnationGrades
 * @package common\models
 * @property int $user_id
 * @property int $incarnation_id
 * @property int $grades
 */
class UserIncarnationGrades extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%user_incarnation_grades}}';
	}
}