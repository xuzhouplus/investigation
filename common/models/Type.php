<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * Class Type
 * @package common\models
 * @property $id int
 * @property $name string 分类名
 * @property $description string 分类描述
 */
class Type extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%type}}';
	}

	public function rules()
	{
		return [
			['name', 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['name', 'unique'],
			[['name', 'description'], 'string', 'max' => 25]
		];
	}

	public function getQuestion()
	{
		return $this->hasMany(EgoQuestion::class, ['type_id' => 'id']);
	}
}