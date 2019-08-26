<?php

use yii\db\Migration;

/**
 * Class m190826_085730_ego_answer
 */
class m190826_085730_ego_answer extends Migration
{
	public $tableName = '{{%ego_answer}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="自我差异答题"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->integer(11)->notNull(),
			'question_id' => $this->integer(11)->notNull(),
			'option_id' => $this->integer(11)->notNull(),
			'user_id' => $this->integer(11)->notNull(),
			'incarnation_id' => $this->integer(11)->notNull(),
			'grades' => $this->integer(1)->notNull()
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['id']);
		$this->createIndex('user_id', $this->tableName, 'user_id');
		$this->createIndex('incarnation_id', $this->tableName, 'incarnation_id');
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
		echo "m190826_085730_ego_answer cannot be reverted.\n";

		return false;
	}
	*/
}
