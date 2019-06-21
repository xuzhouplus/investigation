<?php


namespace common\models;


use yii\db\ActiveRecord;

/**
 * 虚拟自我任务答题
 * Class VirtualSelf
 * @package common\models
 * @property $id int
 * @property $incarnation_id int 化身id
 * @property $user_id int 用户id
 * @property $question_id int 问题id
 * @property $option_id int 选项id
 * @property $grades int 得分
 */
class VirtualSelf extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%virtual_self}}';
	}

	public function rules()
	{
		return [
			[['incarnation_id', 'user_id', 'question_id', 'option_id', 'grades'], 'required', 'on' => ['create', 'update']],
			['id', 'required', 'on' => ['update']]
		];
	}
}