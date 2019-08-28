<?php

use yii\db\Migration;

/**
 * Class m190826_090402_ego_question
 */
class m190826_090402_ego_question extends Migration
{
	public $tableName = '{{%ego_question}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="自我差异问题"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11)->notNull(),
			'title' => $this->string(255)->notNull(),
			'description' => $this->string(255),
			'type' => $this->string(255)->comment('1外倾性，2宜人性，3尽责性，4神经质，5开放性')
		], $tableOptions);
		$this->batchInsert($this->tableName, ['id', 'title', 'description', 'type'],
			[
				['id' => '1', 'title' => '是一个保守的人', 'description' => '自我差异', 'type' => 'extravert'],
				['id' => '2', 'title' => '是一个值得信赖的人', 'description' => '自我差异', 'type' => 'pleasant'],
				['id' => '3', 'title' => '是一个比较有惰性的人', 'description' => '自我差异', 'type' => 'conscientious'],
				['id' => '4', 'title' => '是一个比较放松，能很好应对压力的人', 'description' => '自我差异', 'type' => 'nervous'],
				['id' => '5', 'title' => '是一个对艺术没有什么兴趣的人', 'description' => '自我差异', 'type' => 'open'],
				['id' => '6', 'title' => '是一个外向的，善于交际的人', 'description' => '自我差异', 'type' => 'extravert'],
				['id' => '7', 'title' => '是一个容易对别人吹毛求疵的人', 'description' => '自我差异', 'type' => 'pleasant'],
				['id' => '8', 'title' => '是一个做事情比较彻底的人', 'description' => '自我差异', 'type' => 'conscientious'],
				['id' => '9', 'title' => '是一个容易紧张的人', 'description' => '自我差异', 'type' => 'nervous'],
				['id' => '10', 'title' => '是一个想象力丰富的人', 'description' => '自我差异', 'type' => 'open'],
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
		echo "m190826_090402_ego_question cannot be reverted.\n";

		return false;
	}
	*/
}
