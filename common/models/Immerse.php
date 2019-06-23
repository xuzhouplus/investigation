<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 化身沉浸
 * Class Immerse
 * @package common\models
 * @property int $id
 * @property int $user_id 用户id
 * @property int $incarnation_id 化身id
 * @property int $order 排序
 * @property Incarnation $incarnation 化身
 * @property User $user 用户
 */
class Immerse extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%immerse}}';
	}


	public function rules()
	{
		return [
			[['user_id', 'incarnation_id', 'order'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['order', 'integer', 'min' => 0]
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