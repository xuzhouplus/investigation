<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * Class RoundMean
 * @package common\models
 * @property int $id
 * @property int $round 分组轮次
 * @property int $positive_mean 正分大小分组中间值
 * @property int $negative_mean 负分大小分组中间值
 */
class RoundMean extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%round_mean}}';
	}

	public function rules()
	{
		return [
			[['round', 'positive_mean', 'negative_mean'], 'integer']
		];
	}
}