<?php

use yii\db\Migration;

/**
 * Class m190826_090014_ego_difference_grades
 */
class m190826_090014_ego_difference_grades extends Migration
{
	public $tableName = '{{%ego_difference_grades}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="自我差异得分"';
		}
		$this->createTable($this->tableName, [
			'user_id' => $this->integer(11)->notNull(),
			'incarnation_id' => $this->integer(11)->notNull(),
			'type' => $this->string(100)->comment('1外倾性，2宜人性，3尽责性，4神经质，5开放性')->notNull(),
			'grades' => $this->integer(1),
			'sign' => $this->integer(1)->comment('得分符号，1正，2负，3零')
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['user_id', 'incarnation_id', 'type']);
		$this->createIndex('user_id', $this->tableName, ['user_id']);
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
		echo "m190826_090014_ego_difference_grades cannot be reverted.\n";

		return false;
	}
	*/
}
