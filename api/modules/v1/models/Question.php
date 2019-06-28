<?php


namespace api\modules\v1\models;

use common\models\Question as CommonQuestion;
use Yii;
use yii\data\ActiveDataProvider;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

class Question extends CommonQuestion
{
	/**
	 * 获取问题列表
	 * @param $data
	 * @return array
	 * @throws \yii\base\InvalidConfigException
	 */
	public static function getList($data)
	{
		$query = self::find()->joinWith(['incarnation', 'type', 'option']);
		$query->andFilterWhere([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')]);
		$query->andFilterWhere([self::tableName() . '.incarnation_id' => ArrayHelper::getValue($data, 'incarnation_id')]);
		$query->andFilterWhere([self::tableName() . '.type_id' => ArrayHelper::getValue($data, 'type_id')]);
		$query->andFilterWhere(['like', self::tableName() . '.description', ArrayHelper::getValue($data, 'description')]);
		$query->andFilterWhere(['like', self::tableName() . '.title', ArrayHelper::getValue($data, 'title')]);
		$query->andFilterWhere(['like', Incarnation::tableName() . '.name', ArrayHelper::getValue($data, 'incarnation_name')]);
		$query->andFilterWhere(['like', Type::tableName() . '.name', ArrayHelper::getValue($data, 'type_name')]);
		$page = ArrayHelper::getValue($data, 'page') ?: 1;
		$pagination = new Pagination(['totalCount' => $query->count(), 'pageSize' => ArrayHelper::getValue($data, 'size', 10), 'page' => $page - 1]);
		$dataProvider = Yii::createObject([
			'class' => ActiveDataProvider::class,
			'query' => $query,
			'pagination' => $pagination,
			'sort' => [
				'params' => $data,
			],
		]);
		/**
		 * @var $records Question[]
		 */
		$records = $dataProvider->getModels();
		$questions = [];
		if ($records) {
			foreach ($records as $record) {
				$options = [];
				foreach ($record->option as $option) {
					/**
					 * @var $option Option
					 */
					$options[] = [
						'id' => $option->id,
						'name' => $option->name,
						'grades' => $option->grades,
						'description' => $option->description
					];
				}
				if ($record->incarnation) {
					$question = [
						'incarnation_id' => $record->incarnation_id,
						'incarnation_name' => $record->incarnation->name,
						'incarnation_file' => $record->incarnation->file->fileUrl(),
						'incarnation_gender' => $record->incarnation->gender,
					];
				} else {
					$question = [
						'incarnation_id' => '',
						'incarnation_name' => '',
						'incarnation_file' => '',
						'incarnation_gender' => '',
					];
				}
				$questions[] = array_merge($question, [
					'id' => $record->id,
					'title' => $record->title,
					'reverse' => $record->reverse,
					'description' => $record->description,
					'type_id' => $record->type_id,
					'type_name' => $record->type->name,
					'type_description' => $record->type->description,
					'options' => $options
				]);
			}
		}
		$pagination = $dataProvider->getPagination();
		return [
			'size' => $pagination->getPageSize(),
			'count' => $pagination->getPageCount(),
			'page' => ($pagination->getPage() + 1),
			'total' => $pagination->totalCount,
			'offset' => $pagination->getOffset(),
			'questions' => $questions,
		];
	}

	/**
	 * 创建问题
	 * @param $data
	 * @return $this
	 * @throws \Exception
	 */
	public static function createQuestion($data)
	{
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			$question = new Question();
			$question->setScenario('create');
			$question->load($data, '');
			if ($question->validate() && $question->save()) {
				$options = call_user_func_array([Option::class, 'createOptions'], ['questionID' => $question->id, 'options' => ArrayHelper::getValue($data, 'options')]);
				$transaction->commit();
				$return = ArrayHelper::toArray($question);
				$return['options'] = $options;
				return $return;
			}
			$errors = $question->getFirstErrors();
			$error = reset($errors);
			throw new \Exception($error);
		} catch (\Exception $exception) {
			$transaction->rollBack();
			throw  $exception;
		}
	}

	/**
	 * 更新问题
	 * @param $data
	 * @return Question|null
	 * @throws \Exception
	 */
	public static function updateQuestion($data)
	{
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			$question = self::findOne(ArrayHelper::getValue($data, 'id'));
			$question->setScenario('update');
			$question->load($data);
			if ($question->validate() && $question->save()) {
				$options = call_user_func_array([Option::class, 'createOptions'], ['questionID' => $question->id, 'options' => ArrayHelper::getValue($data, 'options')]);
				$transaction->commit();
				$return = ArrayHelper::toArray($question);
				$return['options'] = $options;
				return $return;
			}
			$errors = $question->getFirstErrors();
			$error = reset($errors);
			throw new \Exception($error);
		} catch (\Exception $exception) {
			$transaction->rollBack();
			throw $exception;
		}
	}

	/**
	 * 删除问题
	 * @param $id
	 * @return false|int
	 * @throws \Throwable
	 * @throws \yii\db\StaleObjectException
	 */
	public static function deleteQuestion($id)
	{
		return self::findOne($id)->delete() && Option::deleteOptions(['question_id' => $id]);
	}

	/**
	 * @param $id
	 * @return Question|array|\yii\db\ActiveRecord|null
	 */
	public static function getView($id)
	{
		$question = self::findOne($id);
		$options = [];
		foreach ($question->option as $option) {
			/**
			 * @var $option Option
			 */
			$options[] = [
				'id' => $option->id,
				'name' => $option->name,
				'grades' => $option->grades,
				'description' => $option->description
			];
		}
		if ($question->incarnation) {
			$return = [
				'incarnation_id' => $question->incarnation_id,
				'incarnation_name' => $question->incarnation->name,
				'incarnation_file' => $question->incarnation->file->fileUrl(),
				'incarnation_gender' => $question->incarnation->gender,
			];
		} else {
			$return = [
				'incarnation_id' => '',
				'incarnation_name' => '',
				'incarnation_file' => '',
				'incarnation_gender' => '',
			];
		}
		return array_merge($return, [
			'id' => $question->id,
			'title' => $question->title,
			'reverse' => $question->reverse,
			'description' => $question->description,
			'type_id' => $question->type_id,
			'type_name' => $question->type->name,
			'type_description' => $question->type->description,
			'options' => $options
		]);
	}
}