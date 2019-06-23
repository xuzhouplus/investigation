<?php


namespace api\modules\v1\models;

use common\models\Approve as CommonApprove;
use Yii;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;

/**
 * 化身认同
 * Class Approve
 * @package api\modules\v1\models
 */
class Approve extends CommonApprove
{
	/**
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
		 * @var $approves Approve[]
		 */
		$approves = $dataProvider->getModels();
		$result = [];
		foreach ($approves as $approve) {
			$result[] = [
				'id' => $approve->id,
				'incarnation_id' => $approve->incarnation->id,
				'incarnation_name' => $approve->incarnation->name,
				'incarnation_description' => $approve->incarnation->description,
				'incarnation_file' => $approve->incarnation->file->fileUrl(),
				'user_id' => $approve->user->id,
				'user_name' => $approve->user->username,
				'order' => $approve->order
			];
		}
		$pagination = $dataProvider->getPagination();
		return [
			'size' => $pagination->getPageSize(),
			'count' => $pagination->getPageCount(),
			'page' => ($pagination->getPage() + 1),
			'total' => $pagination->totalCount,
			'offset' => $pagination->getOffset(),
			'approves' => $result,
		];
	}

	/**
	 * 化身认同答卷提交
	 * @param $data
	 * @return Approve|null
	 * @throws \Exception
	 */
	public static function submit($data)
	{
		$userID = ArrayHelper::getValue($data, 'user_id');
		/**
		 * @var $exists Approve[]
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