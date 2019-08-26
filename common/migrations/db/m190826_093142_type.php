<?php

use yii\db\Migration;

/**
 * Class m190826_093142_type
 */
class m190826_093142_type extends Migration
{
	public $tableName = '{{%type}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="问题调查类型"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->integer(11)->notNull(),
			'name' => $this->string(255)->comment('问题调查类型')->notNull(),
			'description' => $this->string(255)->comment('描述')
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['id']);
		$this->batchInsert($this->tableName, ['id', 'name', 'description'],
			[
				['id' => '1', 'name' => '现实自我', 'description' => '我认为现实中的自己'],
				['id' => '2', 'name' => '虚拟自我', 'description' => '我认为这一个虚拟化身'],
				['id' => '3', 'name' => '情绪量化', 'description' => '当您在使用该化身时，会出现以下哪些情绪感受'],
				['id' => '4', 'name' => 'xuchao', 'description' => 'asdadasd'],
			]);
	}

	/**
	 * {@inheritdoc}
	 */
	public function safeDown()
	{
		$this->delete($this->tableName);
		$this->dropTable($this->tableName);
	}

	/*
	// Use up()/down() to run migration code without a transaction.
	public function up()
	{

	}

	public function down()
	{
		echo "m190826_093142_type cannot be reverted.\n";

		return false;
	}
	*/
}
