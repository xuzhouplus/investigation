<?php

namespace common\models;

use common\components\validate\IDCardValidate;
use common\models\query\UserQuery;
use Yii;
use yii\behaviors\AttributeBehavior;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\filters\auth\HttpBasicAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\auth\QueryParamAuth;
use yii\helpers\ArrayHelper;
use yii\web\IdentityInterface;

/**
 * User model
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $email
 * @property string $mobile
 * @property string $department
 * @property string $gender
 * @property string $age
 * @property string $role
 * @property string $auth_key
 * @property string $logged_at
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $status
 */
class User extends ActiveRecord implements IdentityInterface
{
	const ROLE_USER = 'user';
	const ROLE_ADMINISTRATOR = 'admin';

	const GENDER_MALE = 'male';
	const GENDER_FEMALE = 'female';

	const STATUS_NEW = 0;
	const STATUS_ACTIVE = 1;
	const STATUS_INACTIVE = 2;

	/**
	 * @inheritdoc
	 */
	public static function tableName()
	{
		return '{{%user}}';
	}

	/**
	 * @return UserQuery
	 */
	public static function find()
	{
		return new UserQuery(get_called_class());
	}

	/**
	 * @inheritdoc
	 */
	public static function findIdentity($id)
	{
		return static::find()->active()
			->andWhere(['id' => $id])
			->one();
	}

	/**
	 * @inheritdoc
	 */
	public static function findIdentityByAccessToken($token, $type = null)
	{
		if (YII_ENV_DEV) {
			return static::find()->active()
				->one();
		}
		switch ($type) {
			case HttpBasicAuth::class:
				Yii::error('HttpBasicAuth');
				break;
			case HttpBearerAuth::class:
				Yii::error('HttpBearerAuth');
				break;
			case QueryParamAuth::class:
				Yii::error('QueryParamAuth');
				break;
		}
		$loginUser = Yii::$app->cache->get($token);
		if (is_null($loginUser)) {
			return null;
		}
		return static::find()->active()
			->andWhere(['id' => $loginUser])
			->one();
	}

	/**
	 * Finds user by username
	 *
	 * @param string $username
	 * @return User|array|null
	 */
	public static function findByUsername($username)
	{
		return static::find()->active()
			->andWhere(['username' => $username])
			->one();
	}

	/**
	 * Finds user by username or email
	 *
	 * @param string $login
	 * @return User|array|null
	 */
	public static function findByLogin($login)
	{
		return static::find()->active()
			->andWhere(['or', ['username' => $login], ['mobile' => $login], ['email' => $login]])
			->one();
	}

	/**
	 * @inheritdoc
	 */
	public function behaviors()
	{
		return [
			TimestampBehavior::class,
			'auth_key' => [
				'class' => AttributeBehavior::class,
				'attributes' => [
					ActiveRecord::EVENT_BEFORE_INSERT => 'auth_key'
				],
				'value' => Yii::$app->getSecurity()->generateRandomString()
			]
		];
	}

	/**
	 * @inheritdoc
	 */
	public function rules()
	{
		return [
			['id', 'required', 'on' => ['update']],
			[['username', 'mobile', 'email', 'password'], 'required', 'on' => ['create', 'update']],
			[['username', 'mobile', 'email'], 'unique'],
			[['username', 'mobile', 'email'], 'trim'],
			[['username', 'department'], 'filter', 'filter' => '\yii\helpers\Html::encode'],
			['mobile', 'match', 'pattern' => '/^1[3-9][0-9]{9}$/'],
			['age', 'required', 'on' => ['create']],
			['age', 'integer', 'min' => 0],
			['gender', 'default', 'value' => self::GENDER_MALE],
			['gender', 'in', 'range' => [self::GENDER_MALE, self::GENDER_FEMALE]],
			['role', 'default', 'value' => self::ROLE_USER],
			['role', 'in', 'range' => [self::ROLE_USER, self::ROLE_ADMINISTRATOR]],
			['status', 'default', 'value' => self::STATUS_INACTIVE],
			['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_INACTIVE]]
		];
	}

	/**
	 * @return array
	 */
	public function attributeLabels()
	{
		return [
			'id' => '用户ID',
			'username' => '姓名',
			'password' => '密码',
			'mobile' => '手机',
			'id_card' => '身份证',
			'department' => '单位',
			'gender' => '性别',
			'age' => '年龄',
			'role' => '角色',
			'auth_key' => '授权码',
			'logged_at' => '登录时间',
			'created_at' => '创建时间',
			'updated_at' => '更新时间',
			'status' => '状态'
		];
	}

	/**
	 * @inheritdoc
	 */
	public function validateAuthKey($authKey)
	{
		return $this->getAuthKey() === $authKey;
	}

	/**
	 * @inheritdoc
	 */
	public function getAuthKey()
	{
		return $this->auth_key;
	}

	/**
	 * Validates password
	 *
	 * @param string $password password to validate
	 * @return boolean if password provided is valid for current user
	 */
	public function validatePassword($password)
	{
		return Yii::$app->getSecurity()->validatePassword($password, $this->password);
	}

	/**
	 * @param $password
	 * @throws \yii\base\Exception
	 */
	public function setPassword($password)
	{
		$this->password = Yii::$app->getSecurity()->generatePasswordHash($password);
	}

	/**
	 * @return string
	 */
	public function getPublicIdentity()
	{
		if ($this->username) {
			return $this->username;
		}
		return $this->mobile;
	}

	/**
	 * @inheritdoc
	 */
	public function getId()
	{
		return $this->getPrimaryKey();
	}

	/**
	 * 生成授权码
	 * @return string
	 * @throws \yii\base\Exception
	 */
	public function generateAccessToken()
	{
		$accessToken = Yii::$app->getSecurity()->generateRandomString(40);
		Yii::$app->cache->set($accessToken, $this->getId());
		return $accessToken;
	}

	public function administrator()
	{
		return $this->role == self::ROLE_ADMINISTRATOR;
	}
}
