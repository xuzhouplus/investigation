<?php


namespace common\models;


use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;

/**
 * 自我调查问题选项
 * Class Option
 * @package common\models
 * @property int $id
 * @property int $question_id 问题id
 * @property string $description 描述
 * @property string $name 选项
 * @property int $grades 分值
 */
class EmotionOption extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%emotion_option}}';
	}

	public function rules()
	{
		return [
			[['question_id', 'name', 'description', 'grades'], 'required', 'on' => ['create', 'update']],
			[['name', 'description'], 'string', 'max' => 255],
			['grades', 'integer', 'min' => 0]
		];
	}

	public function getQuestion()
	{
		return $this->hasOne(EmotionQuestion::class, ['id' => 'question_id']);
	}

	public static function batchInsert($records, $index = null)
	{
		$transaction = self::getDb()->beginTransaction();
		try {
			$result = [];
			foreach ($records as $record) {
				$option = new EgoOption();
				$option->setScenario('create');
				$option->load($record, '');
				if ($option->validate()) {
					$option->save();
					if ($index && property_exists($option, $index)) {
						$result[$option->getAttribute($index)] = $option;
					} else {
						$result[] = $option;
					}
				} else {
					$errors = $option->getFirstErrors();
					$error = reset($errors);
					throw new \Exception($error);
				}
			}
			$transaction->commit();
			return $result;
		} catch (\Exception $exception) {
			$transaction->rollBack();
			throw new \Exception($exception);
		}
	}

	public static function batchDelete($questionID)
	{
		return self::deleteAll(['question_id' => $questionID]);
	}
}