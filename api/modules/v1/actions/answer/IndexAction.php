<?php


namespace api\modules\v1\actions\answer;


use api\modules\v1\models\Answer;
use yii\helpers\ArrayHelper;
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

			/* @var $modelClass Answer */
			$modelClass = $this->modelClass;

			$query = $modelClass::find();
			$query->joinWith(['user', 'question', 'option']);
			$query->andFilterWhere([Answer::tableName() . '.user_id' => ArrayHelper::getValue($requestParams, 'user_id')]);
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
					'answers' => $dataProvider->getModels(),
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