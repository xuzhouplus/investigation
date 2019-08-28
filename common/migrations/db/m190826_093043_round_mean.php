<?php

use yii\db\Migration;

/**
 * Class m190826_093043_round_mean
 */
class m190826_093043_round_mean extends Migration
{
	public $tableName = '{{%round_mean}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="每轮分组的中值"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11)->notNull(),
			'round' => $this->integer(10)->comment('分组轮次')->notNull(),
			'positive_mean' => $this->integer(2)->comment('正大小分组中间数')->notNull(),
			'negative_mean' => $this->integer(2)->comment('父大小分组中间数')->notNull()
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
		echo "m190826_093043_round_mean cannot be reverted.\n";

		return false;
	}
	*/
}
