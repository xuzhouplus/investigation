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
 * @property int $incarnation_id 化身id
 * @property int $option_id 选项id
 * @property int $grades 得分
 * @property User $user
 * @property EgoQuestion $question
 * @property EgoOption $option
 * @property Incarnation $incarnation
 */
class EgoAnswer extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%ego_answer}}';
	}

	public function rules()
	{
		return [
			[['user_id', 'question_id', 'incarnation_id', 'option_id', 'grade'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['incarnation_id', 'default', 'value' => -1],
			['grade', 'integer', 'min' => 0]
		];
	}

	public function getUser()
	{
		return $this->hasOne(User::class, ['id' => 'user_id']);
	}

	public function getQuestion()
	{
		return $this->hasOne(EgoQuestion::class, ['id' => 'question_id']);
	}

	public function getOption()
	{
		return $this->hasOne(EgoOption::class, ['id' => 'option_id']);
	}

	public function getIncarnation()
	{
		return $this->hasOne(Incarnation::class, ['id' => 'incarnation_id']);
	}
}