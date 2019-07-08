<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * Class AdvertisementOption
 * @package common\models
 * @property int $id
 * @property int $question_id
 * @property string $name
 * @property int $file_id
 * @property int $grades
 * @property File $file
 */
class AdvertisementOption extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%aadvertisement_option}}';
	}

	public function rules()
	{
		return [
			[['question_id', 'name', 'grades'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['grades', 'default', 'value' => 0],
			['grades', 'integer', 'min' => 0]
		];
	}

	public function getFile()
	{
		return $this->hasOne(File::class, ['id' => 'file_id']);
	}
}