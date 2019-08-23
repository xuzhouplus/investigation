<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 调查问题
 * Class EgoQuestion
 * @package common\models
 * @property int $id
 * @property int $title string 题目
 * @property int $description string 说明
 * @property string $type 类型,1外倾性，2宜人性，3尽责性，4神经质，5开放性
 * @property Incarnation $incarnation 化身
 * @property EgoOption $option 选项
 * @property EgoAnswer $answer 回答
 */
class EgoQuestion extends ActiveRecord
{

	public static function tableName()
	{
		return '{{%ego_question}}';
	}

	public function rules()
	{
		return [
			[['type_id', 'title'], 'required', 'on' => ['create', 'update']],
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
		return $this->hasMany(EgoOption::class, ['question_id' => 'id']);
	}

	/**
	 * 有多个答题
	 * @return \yii\db\ActiveQuery
	 */
	public function getAnswer()
	{
		return $this->hasMany(EgoAnswer::class, ['question_id' => 'id']);
	}
}