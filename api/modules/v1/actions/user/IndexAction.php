<?php


namespace api\modules\v1\actions\user;

use Yii;
use api\modules\v1\models\User;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

class IndexAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$requestParams = Yii::$app->getRequest()->getBodyParams();
			if (empty($requestParams)) {
				$requestParams = Yii::$app->getRequest()->getQueryParams();
			}

			/* @var $modelClass User */
			$modelClass = $this->modelClass;

			$query = $modelClass::find()->select(['id', 'username', 'role', 'mobile', 'id_card', 'gender', 'age', 'department', 'created_at', 'updated_at', 'logged_at']);
			$query->andFilterWhere(['id' => ArrayHelper::getValue($requestParams, 'id')]);
			$query->andFilterWhere(['like', 'username', ArrayHelper::getValue($requestParams, 'username')]);
			$query->andFilterWhere(['like', 'mobile', ArrayHelper::getValue($requestParams, 'mobile')]);
			$query->andFilterWhere(['gender' => ArrayHelper::getValue($requestParams, 'gender')]);
			$query->andFilterWhere(['like', 'id_card', ArrayHelper::getValue($requestParams, 'id_card')]);
			$query->andFilterWhere(['like', 'department', ArrayHelper::getValue($requestParams, 'department')]);
			$query->andFilterWhere(['age' => ArrayHelper::getValue($requestParams, 'age')]);
			if (ArrayHelper::getValue($requestParams, 'role')) {
				$query->andFilterWhere(['role' => User::ROLE_USER]);
			} else {
				$queryRoles = ArrayHelper::getValue($requestParams, 'role');
				if (is_string($queryRoles)) {
					$firstChart = substr($queryRoles, 0, 1);
					if ($firstChart == '[') {
						$queryRoles = json_decode($queryRoles, true);
					} else {
						$queryRoles = explode(',', $queryRoles);
					}
				}
				$query->andFilterWhere(['role' => $queryRoles]);
			}
			if (ArrayHelper::getValue($requestParams, 'status')) {
				$query->andFilterWhere(['status' => User::STATUS_ACTIVE]);
			} else {
				$queryStatus = ArrayHelper::getValue($requestParams, 'status');
				if (is_string($queryStatus)) {
					$firstChart = substr($queryStatus, 0, 1);
					if ($firstChart == '[') {
						$queryStatus = json_decode($queryStatus, true);
					} else {
						$queryStatus = explode(',', $queryStatus);
					}
				}
				$query->andFilterWhere(['status' => $queryStatus]);
			}
			$page = ArrayHelper::getValue($requestParams, 'page') ?: 1;
			ArrayHelper::setValue($requestParams, 'page', $page - 1);
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
					'users' => $dataProvider->getModels(),
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