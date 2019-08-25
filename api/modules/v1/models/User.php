<?php


namespace api\modules\v1\models;

use common\components\swoole\Client;
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
		//当传递了divide且为true时，需要获取广告化身信息
		if (ArrayHelper::getValue($data, 'divide')) {
			$query->joinWith(['egoIncarnation', 'identifyIncarnation']);
		}
		$query->andFilterWhere([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')]);
		$query->andFilterWhere(['like', self::tableName() . '.username', ArrayHelper::getValue($data, 'username')]);
		$query->andFilterWhere(['like', self::tableName() . '.mobile', ArrayHelper::getValue($data, 'mobile')]);
		$query->andFilterWhere([self::tableName() . '.gender' => ArrayHelper::getValue($data, 'gender')]);
		$query->andFilterWhere(['like', self::tableName() . '.email', ArrayHelper::getValue($data, 'email')]);
		$query->andFilterWhere(['like', self::tableName() . '.department', ArrayHelper::getValue($data, 'department')]);
		$query->andFilterWhere([self::tableName() . '.identify_divide' => ArrayHelper::getValue($data, 'identify_divide')]);
		$query->andFilterWhere([self::tableName() . '.ego_divide' => ArrayHelper::getValue($data, 'ego_divide')]);
		$query->andFilterWhere([self::tableName() . '.advertisement_divide' => ArrayHelper::getValue($data, 'advertisement_divide')]);
		$query->andFilterWhere([self::tableName() . '.step' => ArrayHelper::getValue($data, 'step')]);
		$query->andFilterWhere([self::tableName() . '.stage' => ArrayHelper::getValue($data, 'stage')]);
		$query->andFilterWhere([self::tableName() . '.round' => ArrayHelper::getValue($data, 'round')]);
		$query->andFilterWhere([self::tableName() . '.age' => ArrayHelper::getValue($data, 'age')]);
		$query->andFilterWhere([self::tableName() . '.advertisement_status' => ArrayHelper::getValue($data, 'advertisement_status')]);
		if (ArrayHelper::getValue($data, 'role')) {
			$query->andFilterWhere([self::tableName() . '.role' => self::ROLE_USER]);
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
				$query->andFilterWhere([self::tableName() . '.role' => $queryRoles]);
			}
		}
		if (ArrayHelper::getValue($data, 'status')) {
			$query->andFilterWhere([self::tableName() . '.status' => self::STATUS_ACTIVE]);
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
				$query->andFilterWhere([self::tableName() . '.status' => $queryStatus]);
			}
		}
		$waitCountQuery = clone $query;
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
		$query->groupBy([self::tableName() . '.id']);
		Yii::debug($query->createCommand()->getRawSql());
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
		/**
		 * @var $users User[]
		 */
		$users = $dataProvider->getModels();
		foreach ($users as $index => $user) {
			if ($user->identify_divide === null || $user->identify_divide == '') {
				$user->identify_divide = Yii::$app->cache->get('IDENTIFY_DIVIDE_' . $user->id) ?: '';
			}
			if ($user->identify_incarnation === null || $user->identify_incarnation == '') {
				$user->identify_incarnation = Yii::$app->cache->get('IDENTIFY_INCARNATION_' . $user->id) ?: '';
			}
			if ($user->ego_divide === null || $user->ego_divide == '') {
				$user->ego_divide = Yii::$app->cache->get('EGO_DIVIDE_' . $user->id) ?: '';
			}
			if ($user->advertisement_divide === null || $user->advertisement_divide == '') {
				$user->advertisement_divide = Yii::$app->cache->get('ADVERTISEMENT_DIVIDE_' . $user->id) ?: '';
			}
			if ($user->ego_incarnation === null || $user->ego_incarnation == '') {
				$user->ego_incarnation = Yii::$app->cache->get('ADVERTISEMENT_INCARNATION_' . $user->id) ?: '';
			}
			$users[$index] = $user;
		}
		/**
		 * 获取答题没有完成的人员总数
		 */
		$waitCountQuery->andWhere([self::tableName() . '.advertisement_status' => self::ADVERTISEMENT_STATUS_WAIT]);
		$waitCountQuery->select(self::tableName() . '.id');
		$wait = (int)$waitCountQuery->count(self::tableName() . '.id');
		$pagination = $dataProvider->getPagination();
		return [
			'size' => $pagination->getPageSize(),
			'count' => $pagination->getPageCount(),
			'page' => ($pagination->getPage() + 1),
			'total' => $pagination->totalCount,
			'offset' => $pagination->getOffset(),
			'ongoing' => $wait,
			'finished' => ($pagination->totalCount - $wait),
			'users' => $users,
		];
	}

	public static function count($data)
	{
		$query = self::find();
		$query->andFilterWhere(['id' => ArrayHelper::getValue($data, 'id')]);
		$query->andFilterWhere(['like', 'username', ArrayHelper::getValue($data, 'username')]);
		$query->andFilterWhere(['like', 'mobile', ArrayHelper::getValue($data, 'mobile')]);
		$query->andFilterWhere(['gender' => ArrayHelper::getValue($data, 'gender')]);
		$query->andFilterWhere(['like', 'email', ArrayHelper::getValue($data, 'email')]);
		$query->andFilterWhere(['like', 'department', ArrayHelper::getValue($data, 'department')]);
		$query->andFilterWhere(['identify_divide' => ArrayHelper::getValue($data, 'identify_divide')]);
		$query->andFilterWhere(['ego_divide' => ArrayHelper::getValue($data, 'ego_divide')]);
		$query->andFilterWhere(['advertisement_divide' => ArrayHelper::getValue($data, 'advertisement_divide')]);
		$query->andFilterWhere(['round' => ArrayHelper::getValue($data, 'round')]);
		$query->andFilterWhere(['age' => ArrayHelper::getValue($data, 'age')]);
		$query->andFilterWhere(['advertisement_status'=>ArrayHelper::getValue($data,'advertisement_status')]);
		if (!ArrayHelper::getValue($data, 'role')) {
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
		if (!ArrayHelper::getValue($data, 'status')) {
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
		Yii::error($query->createCommand()->getRawSql());
		return $query->count();
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
	 * @param null $id
	 * @return User|null
	 * @throws \Throwable
	 */
	public static function view($id = null)
	{
		if (is_null($id)) {
			$id = Yii::$app->getUser()->getIdentity()->getId();
		}
		return self::findOne($id);
	}

	/**
	 * @param $states
	 * @return User
	 * @throws \Throwable
	 */
	public static function setStates($states)
	{
		/**
		 * @var $loginUser User
		 */
		$loginUser = Yii::$app->getUser()->getIdentity();
		if (is_string($states)) {
			$states = json_decode($states, true);
		}
		$stage = ArrayHelper::getValue($states, 'stage');
		if ($stage) {
			$loginUser->stage = $stage;
		}
		$status = ArrayHelper::getValue($states, 'status');
		if ($status) {
			$loginUser->status = $status;
		}
		$step = ArrayHelper::getValue($states, 'step');
		if ($step) {
			$loginUser->step = $step;
		}
		$round = ArrayHelper::getValue($states, 'round');
		if ($round) {
			$loginUser->round = $round;
		}
		$loginUser->save();
		if ($step == 1) {
			Client::request([
				'action' => 'userIncarnation',
				'access_token' => $loginUser->generateAccessToken(),
				'callback' => ArrayHelper::getValue(Yii::$app->params, 'backendBaseUrl') . '/v1/swoole/callback',
			]);
		}
		if ($step == 3) {
			Client::request([
				'action' => 'egoDifferences',
				'access_token' => $loginUser->generateAccessToken(),
				'callback' => ArrayHelper::getValue(Yii::$app->params, 'backendBaseUrl') . '/v1/swoole/callback',
			]);
		}
		return $loginUser;
	}

	/**
	 * 设置用户所属答题阶段
	 * @param $stage
	 * @return User
	 * @throws \Throwable
	 */
	public static function setStage($stage)
	{
		/**
		 * @var $loginUser User
		 */
		$loginUser = Yii::$app->getUser()->getIdentity();
		$loginUser->stage = $stage;
		$loginUser->save();
		return $loginUser;
	}

	/**
	 * 设置用户答题步骤
	 * @param $step
	 * @return User
	 * @throws \Throwable
	 */
	public static function setStep($step)
	{
		/**
		 * @var $loginUser User
		 */
		$loginUser = Yii::$app->getUser()->getIdentity();
		$loginUser->step = $step;
		$loginUser->save();
		return $loginUser;
	}

	/**
	 * 设置用户答题轮次
	 * @param $round
	 * @return User
	 * @throws \Throwable
	 */
	public static function setRound($round)
	{
		/**
		 * @var $loginUser User
		 */
		$loginUser = Yii::$app->getUser()->getIdentity();
		$loginUser->round = $round;
		$loginUser->save();
		return $loginUser;
	}

	/**
	 * @param $identifyDivide
	 * @param $egoDivide
	 * @param $advertisementDivide
	 * @return \common\models\query\UserQuery
	 */
	public static function getDivideQuery($identifyDivide, $egoDivide, $advertisementDivide)
	{
		$query = static::find();
		$query->joinWith(['egoIncarnation', 'identifyIncarnation']);
		$query->andFilterWhere([User::tableName() . '.role' => 'user']);
		$query->andFilterWhere([User::tableName() . '.identify_divide' => $identifyDivide, User::tableName() . '.ego_divide' => $egoDivide, User::tableName() . '.advertisement_divide' => $advertisementDivide]);
		return $query;
	}
}