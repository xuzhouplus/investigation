<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 用户答题表
 * Class Answer
 * @package common\models
 * @property int $id
 * @property int $user_id 用户id
 * @property int $question_id 问题id
 * @property int $option_id 选项id
 * @property int $grades 得分
 * @property User $user
 * @property EmotionQuestion $question
 * @property EmotionOption $option
 */
class EmotionAnswer extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%emotion_answer}}';
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
		return $this->hasOne(EmotionQuestion::class, ['id' => 'question_id']);
	}

	public function getOption()
	{
		return $this->hasOne(EmotionOption::class, ['id' => 'option_id']);
	}
}