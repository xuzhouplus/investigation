<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 调查问题
 * Class Question
 * @package common\models
 * @property int $id
 * @property int $type_id 类型id
 * @property int $title string 题目
 * @property int $description string 说明
 * @property int $incarnation_id 化身id，当问题为虚拟自我时
 * @property int $reverse 答案分值是否反转
 * @property Type $type 类型
 * @property Incarnation $incarnation 化身
 * @property Option $option 选项
 * @property Answer $answer 回答
 */
class Question extends ActiveRecord
{
	//分支反转
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
	 * @return \yii\db\ActiveQuery
	 */
	public function getType()
	{
		return $this->hasOne(Type::class, ['id' => 'type_id']);
	}

	/**
	 * @return \yii\db\ActiveQuery
	 */
	public function getIncarnation()
	{
		return $this->hasOne(Incarnation::class, ['id' => 'incarnation_id']);
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