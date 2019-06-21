<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 化身沉浸
 * Class Immerse
 * @package common\models
 * @property $id int
 * @property $user_id int 用户id
 * @property $incarnation_id int 化身id
 * @property $order int 排序
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