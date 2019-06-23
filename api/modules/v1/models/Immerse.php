<?php


namespace api\modules\v1\models;

use common\models\Immerse as CommonImmerse;
use Yii;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;

/**
 * 化身沉浸
 * Class Immerse
 * @package api\modules\v1\models
 */
class Immerse extends CommonImmerse
{
	/**
	 * 答卷列表
	 * @param $data
	 * @return array
	 * @throws \yii\base\InvalidConfigException
	 */
	public static function getList($data)
	{
		$query = self::find();
		$query->joinWith(['user', 'incarnation']);
		$query->andFilterWhere([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')]);
		$query->andFilterWhere([self::tableName() . '.user_id' => ArrayHelper::getValue($data, 'user_id')]);
		$query->andFilterWhere(['like', User::tableName() . '.username', ArrayHelper::getValue($data, 'user_name')]);
		$query->andFilterWhere([self::tableName() . '.incarnation_id' => ArrayHelper::getValue($data, 'incarnation_id')]);
		$query->andFilterWhere(['like', Incarnation::tableName() . '.name', ArrayHelper::getValue($data, 'incarnation_name')]);
		$query->andFilterWhere([Incarnation::tableName() . '.gender' => ArrayHelper::getValue($data, 'incarnation_gender')]);
		$dataProvider = Yii::createObject([
			'class' => ActiveDataProvider::class,
			'query' => $query,
			'pagination' => [
				'params' => $data,
			],
			'sort' => [
				'params' => $data,
			],
		]);
		/**
		 * @var $immerses Immerse[]
		 */
		$immerses = $dataProvider->getModels();
		$result = [];
		foreach ($immerses as $immerse) {
			$result[] = [
				'id' => $immerse->id,
				'incarnation_id' => $immerse->incarnation->id,
				'incarnation_name' => $immerse->incarnation->name,
				'incarnation_description' => $immerse->incarnation->description,
				'incarnation_file' => $immerse->incarnation->file->fileUrl(),
				'user_id' => $immerse->user->id,
				'user_name' => $immerse->user->username,
				'order' => $immerse->order
			];
		}
		$pagination = $dataProvider->getPagination();
		return [
			'size' => $pagination->getPageSize(),
			'count' => $pagination->getPageCount(),
			'page' => ($pagination->getPage() + 1),
			'total' => $pagination->totalCount,
			'offset' => $pagination->getOffset(),
			'immerse' => $result,
		];
	}

	/**
	 * 化身沉浸答卷提交
	 * @param $data
	 * @return Immerse|null
	 * @throws \Exception
	 */
	public static function submit($data)
	{
		$userID = ArrayHelper::getValue($data, 'user_id');
		/**
		 * @var $exists Immerse[]
		 */
		$exists = self::find()->where(['user_id' => $userID])->indexBy('incarnation_id')->all();

		$order = ArrayHelper::getValue($data, 'order');
		if (is_string($order)) {
			$order = json_decode($order, 'true');
		}
		$transaction = Yii::$app->getDb()->beginTransaction();
		try {
			$result = [];
			foreach ($order as $item) {
				$incarnationID = ArrayHelper::getValue($item, 'incarnation_id');
				$orderIndex = ArrayHelper::getValue($item, 'order');
				if (isset($exists[$incarnationID])) {
					$immerse = $exists[$incarnationID];
					$immerse->setScenario('update');
				} else {
					$immerse = new Immerse();
					$immerse->setScenario('create');
				}
				$immerse->user_id = $userID;
				$immerse->incarnation_id = $incarnationID;
				$immerse->order = $orderIndex;
				if ($immerse->validate()) {
					if ($immerse->save()) {
						$result[] = $immerse;
					}else {
						throw new \Exception('保存失败');
					}
				}else {
					$errors = $immerse->getFirstErrors();
					$error = reset($errors);
					throw new \Exception($error);
				}
			}
			$transaction->commit();
			return $result;
		} catch (\Exception $exception) {
			$transaction->rollBack();
			throw $exception;
		}
	}
}