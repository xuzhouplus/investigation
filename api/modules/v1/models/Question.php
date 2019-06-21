<?php


namespace api\modules\v1\models;

use common\models\Question as CommonQuestion;
use yii\helpers\ArrayHelper;

class Question extends CommonQuestion
{
	/**
	 * 创建问题
	 * @param $data
	 * @return $this
	 * @throws \Exception
	 */
	public static function createQuestion($data)
	{
		$question = new Question();
		$question->setScenario('create');
		$question->load($data);
		if ($question->validate() && $question->save()) {
			return $question;
		}
		$errors = $question->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	/**
	 * 更新问题
	 * @param $data
	 * @return Question|null
	 * @throws \Exception
	 */
	public static function updateQuestion($data)
	{
		$question = self::findOne(ArrayHelper::getValue($data, 'id'));
		$question->setScenario('update');
		$question->load($data);
		if ($question->validate() && $question->save()) {
			return $question;
		}
		$errors = $question->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	/**
	 * 删除问题
	 * @param $data
	 * @return false|int
	 * @throws \Throwable
	 * @throws \yii\db\StaleObjectException
	 */
	public static function deleteQuestion($data)
	{
		return self::findOne(ArrayHelper::getValue($data, 'id'))->delete();
	}
}