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
	public function getList($data)
	{
		$query = self::find();
		$query->joinWith(['user', 'incarnation']);
		$query->andFilterWhere([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')]);
		$query->andFilterWhere(['like', User::tableName() . '.username', ArrayHelper::getValue($data, 'username')]);
		$query->andFilterWhere([Incarnation::tableName() . '.gender' => ArrayHelper::getValue($data, 'gender')]);
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
}