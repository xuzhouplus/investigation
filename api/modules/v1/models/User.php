<?php


namespace api\modules\v1\models;

use common\models\User as CommonUser;
use yii\helpers\ArrayHelper;

class User extends CommonUser
{
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
			'id_card' => $this->id_card,
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
					'id_card' => $user->id_card,
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

	public function audit($data)
	{
		$user = self::findOne(['id' => ArrayHelper::getValue($data, 'id')]);
		if (!$user) {
			throw new \Exception('用户不存在');
		}
		$user->setAttribute('status', ArrayHelper::getValue($data, 'status'));
		return $user->save();
	}
}