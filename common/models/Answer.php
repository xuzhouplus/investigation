<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 用户答题表
 * Class Answer
 * @package common\models
 * @property $id
 * @property $user_id int 用户id
 * @property $question_id int 问题id
 * @property $option_id int 选项id
 * @property $grades int 得分
 */
class Answer extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%answer}}';
	}

	public function rules()
	{
		return [
			[['user_id', 'question_id', 'option_id', 'grade'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['grade', 'integer', 'min' => 0]
		];
	}

	public function getUser()
	{
		return $this->hasOne(User::class, ['id' => 'user_id']);
	}

	public function getQuestion()
	{
		return $this->hasOne(Question::class, ['id' => 'question_id']);
	}

	public function getOption()
	{
		return $this->hasOne(Option::class, ['id' => 'option_id']);
	}
}