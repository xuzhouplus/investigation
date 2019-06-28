<?php


namespace api\modules\v1\models;

use common\models\User as CommonUser;
use Yii;
use yii\data\ActiveDataProvider;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

class User extends CommonUser
{
	/**
	 * @param $data
	 * @return array
	 */
	public static function getList($data)
	{
		$query = self::find();
		$query->andFilterWhere(['id' => ArrayHelper::getValue($data, 'id')]);
		$query->andFilterWhere(['like', 'username', ArrayHelper::getValue($data, 'username')]);
		$query->andFilterWhere(['like', 'mobile', ArrayHelper::getValue($data, 'mobile')]);
		$query->andFilterWhere(['gender' => ArrayHelper::getValue($data, 'gender')]);
		$query->andFilterWhere(['like', 'email', ArrayHelper::getValue($data, 'email')]);
		$query->andFilterWhere(['like', 'department', ArrayHelper::getValue($data, 'department')]);
		$query->andFilterWhere(['age' => ArrayHelper::getValue($data, 'age')]);
		if (ArrayHelper::getValue($data, 'role')) {
			$query->andFilterWhere(['role' => self::ROLE_USER]);
		} else {
			$queryRoles = ArrayHelper::getValue($data, 'role');
			if ($queryRoles && is_string($queryRoles)) {
				$firstChart = substr($queryRoles, 0, 1);
				if ($firstChart == '[') {
					$queryRoles = json_decode($queryRoles, true);
				} else {
					$queryRoles = explode(',', $queryRoles);
				}
			}
			if (!empty($queryRoles)) {
				$query->andFilterWhere(['role' => $queryRoles]);
			}
		}
		if (ArrayHelper::getValue($data, 'status')) {
			$query->andFilterWhere(['status' => self::STATUS_ACTIVE]);
		} else {
			$queryStatus = ArrayHelper::getValue($data, 'status');
			if ($queryStatus && is_string($queryStatus)) {
				$firstChart = substr($queryStatus, 0, 1);
				if ($firstChart == '[') {
					$queryStatus = json_decode($queryStatus, true);
				} else {
					$queryStatus = explode(',', $queryStatus);
				}
			}
			if (!empty($queryStatus)) {
				$query->andFilterWhere(['status' => $queryStatus]);
			}
		}
		if (!empty($data['order'])) {
			if (is_string($data['order'])) {
				$data['order'] = json_decode($data['order'], true);
			}
			$order = [];
			foreach ($data['order'] as $key => $sort) {
				if (strtolower($sort) == 'asc') {
					$order[self::tableName() . '.' . $key] = SORT_ASC;
				} else {
					$order[self::tableName() . '.' . $key] = SORT_DESC;
				}
			}
			$query->orderBy($order);
		}
		Yii::info($query->createCommand()->getRawSql());
		$page = ArrayHelper::getValue($data, 'page') ?: 1;
		$pagination = new Pagination(['totalCount' => $query->count(), 'pageSize' => ArrayHelper::getValue($data, 'size', 10), 'page' => $page - 1]);
		$dataProvider = new ActiveDataProvider([
				'query' => $query,
				'pagination' => $pagination,
				'sort' => [
					'defaultOrder' => [
						'created_at' => SORT_DESC,
					],
					'attributes' => [
						'created_at'
					]
				],
			]
		);
		$pagination = $dataProvider->getPagination();
		return [
			'size' => $pagination->getPageSize(),
			'count' => $pagination->getPageCount(),
			'page' => ($pagination->getPage() + 1),
			'total' => $pagination->totalCount,
			'offset' => $pagination->getOffset(),
			'users' => $dataProvider->getModels(),
		];
	}

	/**
	 * @param $data
	 * @return array
	 * @throws \yii\base\Exception|\Exception
	 */
	public function register($data)
	{
		$this->setScenario('create');
		$this->load($data, '');
		$this->setPassword($this->password);
		if ($this->validate()) {
			$this->save();
		} else {
			$errors = $this->getFirstErrors();
			$error = reset($errors);
			throw new \Exception($error);
		}
		return [
			'id' => $this->id,
			'username' => $this->username,
			'role' => $this->role,
			'auth_key' => $this->auth_key,
			'mobile' => $this->mobile,
			'email' => $this->email,
			'gender' => $this->gender,
			'department' => $this->department,
			'age' => $this->age,
			'created_at' => $this->created_at,
			'updated_at' => $this->updated_at,
			'logged_at' => $this->logged_at,
		];
	}

	/**
	 * @param $data
	 * @return array|bool
	 * @throws \yii\base\Exception
	 */
	public function login($data)
	{
		$user = $this->findByLogin(ArrayHelper::getValue($data, 'username'));
		if ($user) {
			if ($user->validatePassword(ArrayHelper::getValue($data, 'password')) && \Yii::$app->user->login($user)) {
				return [
					'id' => $user->id,
					'username' => $user->username,
					'role' => $user->role,
					'auth_key' => $user->auth_key,
					'mobile' => $user->mobile,
					'email' => $user->email,
					'gender' => $user->gender,
					'department' => $user->department,
					'age' => $user->age,
					'created_at' => $user->created_at,
					'updated_at' => $user->updated_at,
					'logged_at' => $user->logged_at,
					'access_token' => $user->generateAccessToken(),
				];
			}
		}
		return false;
	}

	/**
	 * @param $data
	 * @return User|null
	 * @throws \Exception
	 */
	public function audit($data)
	{
		$user = self::findOne(['id' => ArrayHelper::getValue($data, 'id')]);
		if (!$user) {
			throw new \Exception('用户不存在');
		}
		$user->status = ArrayHelper::getValue($data, 'status');
		if ($user->save()) {
			return $user;
		}
		$errors = $user->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	/**
	 * @param $id
	 * @return User|null
	 */
	public static function view($id)
	{
		return self::findOne($id);
	}
}