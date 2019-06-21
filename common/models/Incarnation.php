<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 化身
 * Class Incarnation
 * @package common\models
 * @property int $id
 * @property string $name 化身名称
 * @property string $file_id 图片文件id
 * @property string $description 化身描述
 * @property string $gender 性别，female女性，male男性
 * @property File $file
 */
class Incarnation extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%incarnation}}';
	}

	public function rules()
	{
		return [
			[['name', 'gender', 'file_id'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['name', 'trim'],
			[['name', 'description'], 'filter', 'filter' => '\yii\helpers\Html::encode'],
		];
	}

	public function attributeLabels()
	{
		return [
			'id' => '化身ID',
			'name' => '名称',
			'file_id' => '文件ID',
			'description' => '描述',
			'gender' => '性别',
		];
	}

	public function getAdvertisement()
	{
		return $this->hasMany(Advertisement::class, ['incarnation_id' => 'id']);
	}

	/**
	 * @return \yii\db\ActiveQuery
	 */
	public function getFile()
	{
		return $this->hasOne(File::class, ['id' => 'file_id']);
	}
}