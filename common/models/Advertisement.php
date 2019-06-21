<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 化身广告
 * Class Advertisement
 * @package common\models
 * @property $id int
 * @property $incarnation_id int 化身id
 * @property $file_id id 文件id
 * @property $description string 广告描述
 * @property $grades int 分值
 */
class Advertisement extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%advertisement}}';
	}

	public function rules()
	{
		return [
			[['incarnation_id', 'file_id', 'description', 'grades'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['description', 'string', 'max' => 255],
			['grades', 'integer', 'min' => 0]
		];
	}

	public function getIncarnation()
	{
		return $this->hasOne(Incarnation::class, ['id' => 'incarnation_id']);
	}

	public function getFile()
	{
		return $this->hasOne(File::class, ['id' => 'file_id']);
	}
}