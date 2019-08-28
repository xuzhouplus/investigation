<?php

use yii\db\Migration;

/**
 * Class m190826_084343_config
 */
class m190826_084343_config extends Migration
{
	public $tableName = '{{%config}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="系统配置"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11)->notNull(),
			'name' => $this->string(255)->notNull(),
			'value' => $this->string(255)->notNull(),
			'description' => $this->string(255),
			'type' => $this->string(255),
			'required' => $this->string(255)
		], $tableOptions);
		$this->batchInsert($this->tableName, ['id', 'name', 'value', 'description', 'type', 'required'],
			[
				['id' => '1', 'name' => 'round', 'value' => '13', 'description' => '当前系统分组轮数', 'type' => 'text', 'required' => '1'],
			]);
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
		echo "m190826_084343_config cannot be reverted.\n";

		return false;
	}
	*/
}
