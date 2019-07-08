<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 品牌记忆答题结果
 * Class AdvertisementAnswer
 * @package common\models
 * @property int $id
 * @property int $user_id
 * @property int $question_id
 * @property int $option_id
 * @property int $grades
 */
class AdvertisementAnswer extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%advertisement_answer}}';
	}

	public function rules()
	{
		return [
			[['user_id', 'question_id', 'option_id', 'grades'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['grades', 'default', 'value' => 0],
			['grades', 'integer', 'min' => 0]
		];
	}
}