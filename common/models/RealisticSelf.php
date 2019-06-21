<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 现实自我认知回答
 * Class RealisticSelf
 * @package common\models
 * @property $id int
 * @property $user_id int 用户id
 * @property $question_id int 问题id
 * @property $option_id int 选项id
 * @property $grades int 得分
 */
class RealisticSelf extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%realistic_self}}';
	}

	public function rules()
	{
		return [
			[['user_id', 'question_id', 'option_id', 'grades'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']]
		];
	}
}