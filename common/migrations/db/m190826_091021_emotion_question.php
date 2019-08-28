<?php

use yii\db\Migration;

/**
 * Class m190826_091021_emotion_question
 */
class m190826_091021_emotion_question extends Migration
{
	public $tableName = '{{%emotion_question}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="情绪量化问题"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11)->notNull(),
			'title' => $this->string(255)->notNull(),
			'description' => $this->string(255),
			'type' => $this->string(255)
		], $tableOptions);
		$this->batchInsert($this->tableName, ['id', 'title', 'description', 'type'],
			[
				['id' => '1', 'title' => '活跃的', 'description' => '情绪量化', 'type' => 'alive'],
				['id' => '2', 'title' => '充满热情的', 'description' => '情绪量化', 'type' => 'warmth'],
				['id' => '3', 'title' => '快乐的', 'description' => '情绪量化', 'type' => 'happy'],
				['id' => '4', 'title' => '兴高采烈的', 'description' => '情绪量化', 'type' => 'jubilant'],
				['id' => '5', 'title' => '兴奋的', 'description' => '情绪量化', 'type' => 'excited'],
				['id' => '6', 'title' => '自豪的', 'description' => '情绪量化', 'type' => 'proud'],
				['id' => '7', 'title' => '欣喜的', 'description' => '情绪量化', 'type' => 'ego_delighted'],
				['id' => '8', 'title' => '精神充沛的', 'description' => '情绪量化', 'type' => 'energetic'],
				['id' => '9', 'title' => '感激的', 'description' => '情绪量化', 'type' => 'grateful'],
				['id' => '10', 'title' => '难过的', 'description' => '情绪量化', 'type' => 'sad'],
				['id' => '11', 'title' => '害怕的', 'description' => '情绪量化', 'type' => 'scared'],
				['id' => '12', 'title' => '紧张的', 'description' => '情绪量化', 'type' => 'nervous'],
				['id' => '13', 'title' => '惊恐的', 'description' => '情绪量化', 'type' => 'terrified'],
				['id' => '14', 'title' => '内疚的', 'description' => '情绪量化', 'type' => 'guilt'],
				['id' => '15', 'title' => '战战兢兢的', 'description' => '情绪量化', 'type' => 'trembled'],
				['id' => '16', 'title' => '恼怒的', 'description' => '情绪量化', 'type' => 'annoyed'],
				['id' => '17', 'title' => '羞愧的', 'description' => '情绪量化', 'type' => 'ashamed'],
				['id' => '18', 'title' => '易怒的', 'description' => '情绪量化', 'type' => 'irritable'],
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
		echo "m190826_091021_emotion_question cannot be reverted.\n";

		return false;
	}
	*/
}
