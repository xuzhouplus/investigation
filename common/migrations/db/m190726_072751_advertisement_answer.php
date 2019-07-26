<?php

use yii\db\Migration;

/**
 * Class m190726_072751_advertisement_answer
 */
class m190726_072751_advertisement_answer extends Migration
{
	public $tableName = '{{%advertisement_answer}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="品牌广告答题"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11),
			'user_id' => $this->integer(11)->notNull(),
			'question_id' => $this->integer(11)->notNull(),
			'option_id' => $this->integer(11)->notNull(),
			'grades' => $this->integer(2)->notNull(),
		], $tableOptions);
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
		echo "m190726_072751_advertisement_answer cannot be reverted.\n";

		return false;
	}
	*/
}
