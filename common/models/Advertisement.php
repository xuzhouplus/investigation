<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 化身广告
 * Class Advertisement
 * @package common\models
 * @property int $id
 * @property int $incarnation_id 化身id
 * @property int $on_file_id 化身上的文件id
 * @property string $description 广告描述
 * @property int $side_file_id 化身旁的文件id
 * @property File $onFile 化身旁的文件
 * @property File $sideFile 化身旁的文件
 * @property Incarnation $incarnation 化身
 */
class Advertisement extends ActiveRecord
{
	//广告位置：化身旁边
	const ADVERTISEMENT_POSITION_SIDE = 'side';
	//广告位置：化身上
	const ADVERTISEMENT_POSITION_ON = 'on';

	public static function tableName()
	{
		return '{{%advertisement}}';
	}

	public function rules()
	{
		return [
			[['incarnation_id', 'on_file_id', 'side_file_id', 'description'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']],
			['description', 'string', 'max' => 255],
		];
	}

	public function getIncarnation()
	{
		return $this->hasOne(Incarnation::class, ['id' => 'incarnation_id']);
	}

	public function getOnFile()
	{
		return $this->hasOne(File::class, ['id' => 'on_file_id']);
	}

	public function getSideFile()
	{
		return $this->hasOne(File::class, ['id' => 'side_file_id']);
	}
}