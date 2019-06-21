<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 化身认同
 * Class Approve
 * @package common\models
 * @property $id
 * @property $user_id int 用户id
 * @property $incarnation_id int 化身id
 * @property $order int 排序
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