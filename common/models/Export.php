<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 要导出的统计数据都保存在这张表里
 * Class Export
 * @package common\models
 * @property int $id
 * @property int $round
 * @property string $divide_stamp
 * @property string $approve_grades
 * @property string $immerse_grades
 * @property string $extravert_reality1
 * @property string $extravert_reality2
 * @property string $pleasant_reality1
 * @property string $pleasant_reality2
 * @property string $conscientious_reality1
 * @property string $conscientious_reality2
 * @property string $nervous_reality1
 * @property string $nervous_reality2
 * @property string $open_reality1
 * @property string $open_reality2
 * @property string $extravert_invented1
 * @property string $extravert_invented2
 * @property string $pleasant_invented1
 * @property string $pleasant_invented2
 * @property string $conscientious_invented1
 * @property string $conscientious_invented2
 * @property string $nervous_invented1
 * @property string $nervous_invented2
 * @property string $open_invented1
 * @property string $open_invented2
 * @property string $emotion_alive
 * @property string $emotion_warmth
 * @property string $emotion_happy
 * @property string $emotion_jubilant
 * @property string $emotion_excited
 * @property string $emotion_proud
 * @property string $emotion_delighted
 * @property string $emotion_energetic
 * @property string $emotion_grateful
 * @property string $emotion_sad
 * @property string $emotion_scared
 * @property string $emotion_nervous
 * @property string $emotion_terrified
 * @property string $emotion_guilt
 * @property string $emotion_trembled
 * @property string $emotion_annoyed
 * @property string $emotion_ashamed
 * @property string $emotion_irritable
 * @property string $brand_attitude_a
 * @property string $brand_attitude_b
 * @property string $brand_attitude_c
 * @property string $brand_attitude_d
 * @property string $brand_memory_1
 * @property string $brand_memory_2
 * @property string $brand_memory_3
 * @property string $brand_memory_4
 * @property string $brand_memory_5
 * @property string $user_id
 * @property string $gender
 * @property string $age
 * @property string $identify_stamp
 * @property string $difference_size
 * @property string $difference_direction
 * @property string $association_strength
 */
class Export extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%export}}';
	}
}