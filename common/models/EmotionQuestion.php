<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 调查问题
 * Class EgoQuestion
 * @package common\models
 * @property int $id
 * @property string $title 题目
 * @property string $description 说明
 * @property EmotionOption $option 选项
 * @property Answer $answer 回答
 */
class EmotionQuestion extends ActiveRecord
{
	//分支反转
	const GRADE_REVERSE_FALSE = 1;
	const GRADE_REVERSE_TRUE = 2;

	public static function tableName()
	{
		return '{{%emotion_question}}';
	}

	public function rules()
	{
		return [
			[['type', 'title'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			[['title', 'description'], 'string', 'max' => 255]
		];
	}

	/**
	 * 有多个选项
	 * @return \yii\db\ActiveQuery
	 */
	public function getOption()
	{
		return $this->hasMany(EmotionOption::class, ['question_id' => 'id']);
	}

	/**
	 * 有多个答题
	 * @return \yii\db\ActiveQuery
	 */
	public function getAnswer()
	{
		return $this->hasMany(EmotionAnswer::class, ['question_id' => 'id']);
	}
}