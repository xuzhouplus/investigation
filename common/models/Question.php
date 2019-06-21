<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 调查问题
 * Class Question
 * @package common\models
 * @property $id int
 * @property $type_id int 类型id
 * @property $title string 题目
 * @property $description string 说明
 * @property $reverse int 答案分值是否反转
 */
class Question extends ActiveRecord
{
	const GRADE_REVERSE_FALSE = 1;
	const GRADE_REVERSE_TRUE = 2;

	public static function tableName()
	{
		return '{{%question}}';
	}

	public function rules()
	{
		return [
			[['type_id', 'title'], 'required', 'on' => ['create', 'update']],
			[['id', 'reverse'], 'required', 'on' => ['update']],
			['reverse', 'default', 'value' => self::GRADE_REVERSE_FALSE],
			[['title', 'description'], 'string', 'max' => 255]
		];
	}

	/**
	 * 有多个选项
	 * @return \yii\db\ActiveQuery
	 */
	public function getOption()
	{
		return $this->hasMany(Option::class, ['question_id' => 'id']);
	}

	/**
	 * 有多个答题
	 * @return \yii\db\ActiveQuery
	 */
	public function getAnswer()
	{
		return $this->hasMany(Answer::class, ['question_id' => 'id']);
	}
}