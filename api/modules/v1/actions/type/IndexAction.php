<?php


namespace api\modules\v1\actions\type;


use api\modules\v1\models\Type;
use yii\rest\Action;

class IndexAction extends Action
{
	public function run()
	{
		try {
			$requestParams = Yii::$app->getRequest()->getBodyParams();
			if (empty($requestParams)) {
				$requestParams = Yii::$app->getRequest()->getQueryParams();
			}

			/* @var $modelClass Type */
			$modelClass = $this->modelClass;

			$query = $modelClass::find();
			$query->andFilterWhere(['id' => ArrayHelper::getValue($requestParams, 'id')]);
			$query->andFilterWhere(['like', 'name', ArrayHelper::getValue($requestParams, 'username')]);
			$dataProvider = Yii::createObject([
				'class' => ActiveDataProvider::class,
				'query' => $query,
				'pagination' => [
					'params' => $requestParams,
				],
				'sort' => [
					'params' => $requestParams,
				],
			]);
			$pagination = $dataProvider->getPagination();
			return [
				'code' => 200,
				'message' => '获取成功',
				'data' => [
					'size' => $pagination->getPageSize(),
					'count' => $pagination->getPageCount(),
					'page' => ($pagination->getPage() + 1),
					'total' => $pagination->totalCount,
					'offset' => $pagination->getOffset(),
					'types' => $dataProvider->getModels(),
				]
			];
		} catch (\Exception $exception) {
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => new \stdClass()
			];
		}
	}
}