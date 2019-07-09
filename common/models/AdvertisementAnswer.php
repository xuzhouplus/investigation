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
 * @property User $user
 * @property AdvertisementQuestion $question
 * @property AdvertisementOption $option
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

	public function getUser()
	{
		return $this->hasOne(User::class, ['id' => 'user_id']);
	}

	public function getQuestion()
	{
		return $this->hasOne(AdvertisementQuestion::class, ['id' => 'question_id']);
	}

	public function getOption()
	{
		return $this->hasOne(AdvertisementOption::class, ['id' => 'option_id']);
	}
}