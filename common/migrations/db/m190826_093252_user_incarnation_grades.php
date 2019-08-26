<?php

use yii\db\Migration;

/**
 * Class m190826_093252_user_incarnation_grades
 */
class m190826_093252_user_incarnation_grades extends Migration
{
	public $tableName = '{{%user_incarnation_grades}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="化身认同、沉浸答题得分"';
		}
		$this->createTable($this->tableName, [
			'user_id' => $this->integer(11)->notNull(),
			'incarnation_id' => $this->integer(11)->notNull(),
			'grades' => $this->float(10)->notNull()
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['user_id', 'incarnation_id']);
		$this->createIndex('user_id', $this->tableName, 'user_id');
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
		echo "m190826_093252_user_incarnation_grades cannot be reverted.\n";

		return false;
	}
	*/
}
