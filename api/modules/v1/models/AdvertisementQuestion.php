<?php


namespace api\modules\v1\models;

use common\models\AdvertisementQuestion as CommonAdvertisementQuestion;
use Yii;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;

class AdvertisementQuestion extends CommonAdvertisementQuestion
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
		 * @var $records AdvertisementQuestion[]
		 */
		$records = $dataProvider->getModels();
		$questions = [];
		if ($records) {
			foreach ($records as $record) {
				$options = [];
				foreach ($record->option as $option) {
					/**
					 * @var $option AdvertisementOption
					 */
					if ($option->file_id) {
						$file = $option->file->fileUrl();
					} else {
						$file = '';
					}
					$options[] = [
						'id' => $option->id,
						'name' => $option->name,
						'file' => $file
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
			$question = new AdvertisementQuestion();
			$question->setScenario('create');
			$question->load($data, '');
			if ($question->validate() && $question->save()) {
				$options = call_user_func_array([AdvertisementOption::class, 'createOptions'], ['questionID' => $question->id, 'options' => ArrayHelper::getValue($data, 'options')]);
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
	 * @return AdvertisementQuestion|null
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
				$options = call_user_func_array([AdvertisementOption::class, 'createOptions'], ['questionID' => $question->id, 'options' => ArrayHelper::getValue($data, 'options')]);
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
		return self::findOne($id)->delete() && AdvertisementOption::deleteOptions(['question_id' => $id]);
	}

	/**
	 * @param $id
	 * @return AdvertisementQuestion|array|\yii\db\ActiveRecord|null
	 */
	public static function getView($id)
	{
		$question = self::findOne($id);
		$options = [];
		foreach ($question->option as $option) {
			/**
			 * @var $option AdvertisementOption
			 */
			if ($option->file_id) {
				$file = $option->file->fileUrl();
			} else {
				$file = '';
			}
			$options[] = [
				'id' => $option->id,
				'name' => $option->name,
				'grades' => $option->grades,
				'file' => $file
			];
		}
		return [
			'id' => $question->id,
			'title' => $question->title,
			'description' => $question->description,
			'options' => $options
		];
	}
}