<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * Class AdvertisementQuestion
 * @package common\models
 * @property int $id
 * @property string $title
 * @property string $description
 * @property int $file_id
 * @property File $file
 * @property AdvertisementOption $option
 */
class AdvertisementQuestion extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%advertisement_question}}';
	}

	public function rules()
	{
		return [
			[['title', 'description'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			[['title', 'description'], 'string', 'max' => 255]
		];
	}

	public function getOption()
	{
		return $this->hasMany(AdvertisementOption::class, ['question_id' => 'id']);
	}

	public function getFile()
	{
		return $this->hasOne(File::class, ['id' => 'file_id']);
	}
}