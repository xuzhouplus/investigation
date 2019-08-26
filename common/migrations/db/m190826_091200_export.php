<?php

use yii\db\Migration;

/**
 * Class m190826_091200_export
 */
class m190826_091200_export extends Migration
{
	public $tableName = '{{%export}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="导出数据"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->integer(11)->notNull(),
			'round' => $this->integer(2)->notNull(),
			'divide_stamp' => $this->string(10),
			'approve_grades' => $this->string(255),
			'immerse_grades' => $this->string(255),
			'extravert_reality1' => $this->string(255),
			'extravert_reality2' => $this->string(255),
			'pleasant_reality1' => $this->string(255),
			'pleasant_reality2' => $this->string(255),
			'conscientious_reality1' => $this->string(255),
			'conscientious_reality2' => $this->string(255),
			'nervous_reality1' => $this->string(255),
			'nervous_reality2' => $this->string(255),
			'open_reality1' => $this->string(255),
			'open_reality2' => $this->string(255),
			'extravert_invented1' => $this->string(255),
			'extravert_invented2' => $this->string(255),
			'pleasant_invented1' => $this->string(255),
			'pleasant_invented2' => $this->string(255),
			'conscientious_invented1' => $this->string(255),
			'conscientious_invented2' => $this->string(255),
			'nervous_invented1' => $this->string(255),
			'nervous_invented2' => $this->string(255),
			'open_invented1' => $this->string(255),
			'open_invented2' => $this->string(255),
			'emotion_alive' => $this->string(255),
			'emotion_warmth' => $this->string(255),
			'emotion_happy' => $this->string(255),
			'emotion_jubilant' => $this->string(255),
			'emotion_excited' => $this->string(255),
			'emotion_proud' => $this->string(255),
			'emotion_delighted' => $this->string(255),
			'emotion_energetic' => $this->string(255),
			'emotion_grateful' => $this->string(255),
			'emotion_sad' => $this->string(255),
			'emotion_scared' => $this->string(255),
			'emotion_nervous' => $this->string(255),
			'emotion_terrified' => $this->string(255),
			'emotion_guilt' => $this->string(255),
			'emotion_trembled' => $this->string(255),
			'emotion_annoyed' => $this->string(255),
			'emotion_ashamed' => $this->string(255),
			'emotion_irritable' => $this->string(255),
			'brand_attitude_a' => $this->integer(1),
			'brand_attitude_b' => $this->integer(1),
			'brand_attitude_c' => $this->integer(1),
			'brand_attitude_d' => $this->integer(1),
			'brand_memory_1' => $this->integer(1),
			'brand_memory_2' => $this->integer(1),
			'brand_memory_3' => $this->integer(1),
			'brand_memory_4' => $this->integer(1),
			'brand_memory_5' => $this->integer(1),
			'user_id' => $this->integer(11)->notNull(),
			'user_name' => $this->string(255),
			'user_email' => $this->string(255),
			'gender' => $this->string(255),
			'age' => $this->string(255),
			'identify_stamp' => $this->string(255),
			'difference_size' => $this->string(255),
			'difference_direction' => $this->string(255),
			'association_strength' => $this->string(255)
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['id']);
		$this->createIndex('divide_stamp', $this->tableName, 'divide_stamp');
		$this->createIndex('round', $this->tableName, 'round');
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
		echo "m190826_091200_export cannot be reverted.\n";

		return false;
	}
	*/
}
