<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 化身认同
 * Class Approve
 * @package common\models
 * @property $id
 * @property $user_id 用户id
 * @property $incarnation_id 化身id
 * @property $grades 得分
 * @property User $user 提交用户
 * @property Incarnation $incarnation 化身
 */
class Approve extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%approve}}';
	}

	public function rules()
	{
		return [
			[['user_id', 'incarnation_id', 'grades'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['grades', 'filter', 'filter' => 'intval', 'skipOnEmpty' => true],
			['grades', 'integer', 'min' => 0]
		];
	}

	public function getUser()
	{
		return $this->hasOne(User::class, ['id' => 'user_id']);
	}

	public function getIncarnation()
	{
		return $this->hasOne(Incarnation::class, ['id' => 'incarnation_id']);
	}
}