<?php

use yii\db\Migration;

/**
 * Class m190826_092735_immerse
 */
class m190826_092735_immerse extends Migration
{
	public $tableName = '{{%immerse}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="化身沉浸答题"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->integer(11)->notNull(),
			'user_id' => $this->integer(11)->comment('用户id')->notNull(),
			'incarnation_id' => $this->integer(11)->comment('化身id')->notNull(),
			'grades' => $this->integer(1)->comment('得分')
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['id', 'user_id', 'incarnation_id']);
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
		echo "m190826_092735_immerse cannot be reverted.\n";

		return false;
	}
	*/
}
