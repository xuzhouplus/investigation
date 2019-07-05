<?php


namespace api\modules\v1\models;

use common\models\EgoQuestion as CommonEgoQuestion;
use Yii;
use yii\data\ActiveDataProvider;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

class EgoQuestion extends CommonEgoQuestion
{
	/**
	 * 获取问题列表
	 * @param $data
	 * @return array
	 * @throws \yii\base\InvalidConfigException
	 */
	public static function getList($data)
	{
		$query = self::find()->joinWith(['option']);
		$query->andFilterWhere([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')]);
		$query->andFilterWhere([self::tableName() . '.type' => ArrayHelper::getValue($data, 'type_id')]);
		$query->andFilterWhere(['like', self::tableName() . '.description', ArrayHelper::getValue($data, 'description')]);
		$query->andFilterWhere(['like', self::tableName() . '.title', ArrayHelper::getValue($data, 'title')]);
		$query->groupBy([self::tableName() . '.id']);
		$page = ArrayHelper::getValue($data, 'page') ?: 1;
		$dataProvider = Yii::createObject([
			'class' => ActiveDataProvider::class,
			'query' => $query,
			'pagination' => [
				'page' => $page - 1,
				'pageSize' => ArrayHelper::getValue($data, 'size', 10)
			],
			'sort' => [
				'params' => $data,
			],
		]);
		/**
		 * @var $records EgoQuestion[]
		 */
		$records = $dataProvider->getModels();
		$questions = [];
		if ($records) {
			foreach ($records as $record) {
				$options = [];
				foreach ($record->option as $option) {
					/**
					 * @var $option EgoOption
					 */
					$options[] = [
						'id' => $option->id,
						'name' => $option->name,
						'grades' => $option->grades,
						'description' => $option->description
					];
				}
				$questions[] = [
					'id' => $record->id,
					'title' => $record->title,
					'description' => $record->description,
					'options' => $options
				];
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
			$question = new EgoQuestion();
			$question->setScenario('create');
			$question->load($data, '');
			if ($question->validate() && $question->save()) {
				$options = call_user_func_array([EgoOption::class, 'createOptions'], ['questionID' => $question->id, 'options' => ArrayHelper::getValue($data, 'options')]);
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
	 * @return EgoQuestion|null
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
				$options = call_user_func_array([EgoOption::class, 'createOptions'], ['questionID' => $question->id, 'options' => ArrayHelper::getValue($data, 'options')]);
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
		return self::findOne($id)->delete() && EgoOption::deleteOptions(['question_id' => $id]);
	}

	/**
	 * @param $id
	 * @return EgoQuestion|array|\yii\db\ActiveRecord|null
	 */
	public static function getView($id)
	{
		$question = self::findOne($id);
		$options = [];
		foreach ($question->option as $option) {
			/**
			 * @var $option EgoOption
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