<?php

use yii\db\Migration;

/**
 * Class m190815_022915_approve
 */
class m190815_022915_approve extends Migration
{
	public $tableName = '{{%approve}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="化身认同答题"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(10)->notNull(),
			'user_id' => $this->integer(10)->comment('用户id')->notNull(),
			'incarnation_id' => $this->integer(10)->comment('化身id')->notNull(),
			'grades' => $this->integer(1)->comment('得分')
		], $tableOptions);
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
		echo "m190815_022915_approve cannot be reverted.\n";

		return false;
	}
	*/
}
