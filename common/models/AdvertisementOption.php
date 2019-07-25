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
 * @property AdvertisementQuestion $question
 */
class AdvertisementOption extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%advertisement_option}}';
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

	public function getQuestion()
	{
		return $this->hasOne(AdvertisementQuestion::class, ['id' => 'question_id']);
	}

	public function getFile()
	{
		return $this->hasOne(File::class, ['id' => 'file_id']);
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