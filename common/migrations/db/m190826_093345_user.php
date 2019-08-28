<?php

use yii\db\Migration;

/**
 * Class m190826_093345_user
 */
class m190826_093345_user extends Migration
{
	public $tableName = '{{%user}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="$comment"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11)->comment('用户id')->notNull(),
			'username' => $this->string(30)->comment('用户名'),
			'password' => $this->string(255)->comment('密码'),
			'auth_key' => $this->string(255),
			'mobile' => $this->string(11)->comment('手机'),
			'email' => $this->string(100)->comment('邮箱'),
			'gender' => $this->string(255)->comment('性别'),
			'department' => $this->string(255)->comment('单位'),
			'age' => $this->integer(3)->comment('年龄'),
			'role' => $this->string(5)->defaultValue('user')->comment('用户角色，1测试人员，2系统管理员')->notNull(),
			'created_at' => $this->string(255),
			'updated_at' => $this->string(255),
			'logged_at' => $this->string(255),
			'stage' => $this->integer(2)->defaultValue(1)->comment('用户所处调查阶段')->notNull(),
			'status' => $this->integer(2)->defaultValue(1)->notNull(),
			'step' => $this->integer(2)->defaultValue(0)->comment('用户问卷步骤')->notNull(),
			'round' => $this->integer(2)->defaultValue(0)->comment('用户属于第几轮调查')->notNull(),
			'identify_divide' => $this->integer(1)->comment('化身认同分组，1大，2小'),
			'identify_incarnation' => $this->integer(10)->comment('化身认同分组落在的化身ID'),
			'ego_divide' => $this->integer(1)->comment('自我差异分组，1大正，2小正，3大负，4小负'),
			'ego_incarnation' => $this->integer(10)->comment('自我差异分组落在的化身id'),
			'advertisement_divide' => $this->integer(1)->comment('广告分组，1强广告，2弱广告'),
			'advertisement_status' => $this->integer(1)->defaultValue(1)->comment('品牌广告答题状态，1未答题，2已答题')
		], $tableOptions);
		$this->createIndex('username', $this->tableName, 'username');
		$this->createIndex('mobile', $this->tableName, 'mobile');
		$this->createIndex('email', $this->tableName, 'email');
		$this->createIndex('role', $this->tableName, 'role');
		$this->createIndex('stage', $this->tableName, 'stage');
		$this->createIndex('step', $this->tableName, 'step');
		$this->createIndex('round', $this->tableName, 'round');
	}

	/**
	 * {@inheritdoc}
	 */
	public function safeDown()
	{
		$this->dropTable($this->tableName);
	}

	/*
	// Use up()/down() to run migration code without a transaction.
	public function up()
	{

	}

	public function down()
	{
		echo "m190826_093345_user cannot be reverted.\n";

		return false;
	}
	*/
}
