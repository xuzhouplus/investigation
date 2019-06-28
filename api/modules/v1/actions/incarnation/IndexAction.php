<?php


namespace api\modules\v1\actions\incarnation;

use api\modules\v1\models\Incarnation;
use Yii;
use yii\data\ActiveDataProvider;
use yii\data\Pagination;
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

			/* @var $modelClass Incarnation */
			$modelClass = $this->modelClass;

			$query = $modelClass::find();
			$query->joinWith(['file']);
			$query->andFilterWhere(['id' => ArrayHelper::getValue($requestParams, 'id')]);
			$query->andFilterWhere(['like', 'name', ArrayHelper::getValue($requestParams, 'username')]);
			$query->andFilterWhere(['gender' => ArrayHelper::getValue($requestParams, 'gender')]);
			$page = ArrayHelper::getValue($requestParams, 'page') ?: 1;
			$pagination = new Pagination(['totalCount' => $query->count(), 'pageSize' => ArrayHelper::getValue($requestParams, 'size', 10), 'page' => $page - 1]);
			$dataProvider = Yii::createObject([
				'class' => ActiveDataProvider::class,
				'query' => $query,
				'pagination' => $pagination,
				'sort' => [
					'params' => $requestParams,
				],
			]);
			/**
			 * @var $incarnations Incarnation[]
			 */
			$incarnations = $dataProvider->getModels();
			$result = [];
			foreach ($incarnations as $incarnation) {
				$result[] = [
					'id' => $incarnation->id,
					'name' => $incarnation->name,
					'description' => $incarnation->description,
					'gender' => $incarnation->gender,
					'file' => $incarnation->file->fileUrl()
				];
			}
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
					'incarnations' => $result,
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