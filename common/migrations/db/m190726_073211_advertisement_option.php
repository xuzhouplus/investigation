<?php

use yii\db\Migration;

/**
 * Class m190726_073211_advertisement_option
 */
class m190726_073211_advertisement_option extends Migration
{
	public $tableName = '{{%advertisement_option}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="品牌答题选项"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11)->notNull(),
			'question_id' => $this->integer(11)->notNull(),
			'name' => $this->string(255),
			'file_id' => $this->integer(11),
			'grades' => $this->integer(1),
			'blank_index' => $this->integer(1)->comment('填空题，空格索引号，从1开始')
		], $tableOptions);
		$this->batchInsert($this->tableName, ['id', 'question_id', 'name', 'file_id', 'grades', 'blank_index'],
			[
				['id' => '1', 'question_id' => '1', 'name' => '1.png', 'file_id' => '41', 'grades' => '0', 'blank_index' => null],
				['id' => '2', 'question_id' => '1', 'name' => '2.png', 'file_id' => '42', 'grades' => '0', 'blank_index' => null],
				['id' => '3', 'question_id' => '1', 'name' => '3.png', 'file_id' => '43', 'grades' => '0', 'blank_index' => null],
				['id' => '4', 'question_id' => '1', 'name' => '4.png', 'file_id' => '44', 'grades' => '2', 'blank_index' => null],
				['id' => '5', 'question_id' => '1', 'name' => '5.png', 'file_id' => '45', 'grades' => '0', 'blank_index' => null],
				['id' => '6', 'question_id' => '3', 'name' => '0.png', 'file_id' => '46', 'grades' => '2', 'blank_index' => null],
				['id' => '7', 'question_id' => '3', 'name' => '1.png', 'file_id' => '47', 'grades' => '0', 'blank_index' => null],
				['id' => '8', 'question_id' => '3', 'name' => '2.png', 'file_id' => '48', 'grades' => '0', 'blank_index' => null],
				['id' => '9', 'question_id' => '3', 'name' => '3.png', 'file_id' => '49', 'grades' => '0', 'blank_index' => null],
				['id' => '10', 'question_id' => '3', 'name' => '4.png', 'file_id' => '50', 'grades' => '0', 'blank_index' => null],
				['id' => '11', 'question_id' => '2', 'name' => '我运动我存在', 'file_id' => null, 'grades' => '0', 'blank_index' => null],
				['id' => '12', 'question_id' => '2', 'name' => '一切皆有可能', 'file_id' => null, 'grades' => '0', 'blank_index' => null],
				['id' => '13', 'question_id' => '2', 'name' => '把精彩留给自己', 'file_id' => null, 'grades' => '0', 'blank_index' => null],
				['id' => '14', 'question_id' => '2', 'name' => '一切皆有可能', 'file_id' => null, 'grades' => '0', 'blank_index' => null],
				['id' => '15', 'question_id' => '2', 'name' => '让改变发生', 'file_id' => null, 'grades' => '2', 'blank_index' => null],
				['id' => '16', 'question_id' => '4', 'name' => '1分', 'file_id' => null, 'grades' => '1', 'blank_index' => null],
				['id' => '17', 'question_id' => '4', 'name' => '2分', 'file_id' => null, 'grades' => '2', 'blank_index' => null],
				['id' => '18', 'question_id' => '4', 'name' => '3分', 'file_id' => null, 'grades' => '3', 'blank_index' => null],
				['id' => '19', 'question_id' => '4', 'name' => '4分', 'file_id' => null, 'grades' => '4', 'blank_index' => null],
				['id' => '20', 'question_id' => '4', 'name' => '5分', 'file_id' => null, 'grades' => '5', 'blank_index' => null],
				['id' => '21', 'question_id' => '5', 'name' => '1分', 'file_id' => null, 'grades' => '1', 'blank_index' => null],
				['id' => '22', 'question_id' => '5', 'name' => '2分', 'file_id' => null, 'grades' => '2', 'blank_index' => null],
				['id' => '23', 'question_id' => '5', 'name' => '3分', 'file_id' => null, 'grades' => '3', 'blank_index' => null],
				['id' => '24', 'question_id' => '5', 'name' => '4分', 'file_id' => null, 'grades' => '4', 'blank_index' => null],
				['id' => '25', 'question_id' => '5', 'name' => '5分', 'file_id' => null, 'grades' => '5', 'blank_index' => null],
				['id' => '26', 'question_id' => '6', 'name' => '1分', 'file_id' => null, 'grades' => '1', 'blank_index' => null],
				['id' => '27', 'question_id' => '6', 'name' => '2分', 'file_id' => null, 'grades' => '2', 'blank_index' => null],
				['id' => '28', 'question_id' => '6', 'name' => '3分', 'file_id' => null, 'grades' => '3', 'blank_index' => null],
				['id' => '29', 'question_id' => '6', 'name' => '4分', 'file_id' => null, 'grades' => '4', 'blank_index' => null],
				['id' => '30', 'question_id' => '6', 'name' => '5分', 'file_id' => null, 'grades' => '5', 'blank_index' => null],
				['id' => '31', 'question_id' => '7', 'name' => '1分', 'file_id' => null, 'grades' => '1', 'blank_index' => null],
				['id' => '32', 'question_id' => '7', 'name' => '2分', 'file_id' => null, 'grades' => '2', 'blank_index' => null],
				['id' => '33', 'question_id' => '7', 'name' => '3分', 'file_id' => null, 'grades' => '3', 'blank_index' => null],
				['id' => '34', 'question_id' => '7', 'name' => '4分', 'file_id' => null, 'grades' => '4', 'blank_index' => null],
				['id' => '35', 'question_id' => '7', 'name' => '5分', 'file_id' => null, 'grades' => '5', 'blank_index' => null],
				['id' => '36', 'question_id' => '8', 'name' => 'E', 'file_id' => null, 'grades' => '1', 'blank_index' => 1],
				['id' => '37', 'question_id' => '8', 'name' => 'e', 'file_id' => null, 'grades' => '1', 'blank_index' => 1],
				['id' => '38', 'question_id' => '8', 'name' => 'M', 'file_id' => null, 'grades' => '1', 'blank_index' => 2],
				['id' => '39', 'question_id' => '8', 'name' => 'm', 'file_id' => null, 'grades' => '1', 'blank_index' => 2],
				['id' => '40', 'question_id' => '8', 'name' => 'A', 'file_id' => null, 'grades' => '1', 'blank_index' => 3],
				['id' => '41', 'question_id' => '8', 'name' => 'a', 'file_id' => null, 'grades' => '1', 'blank_index' => 3],
				['id' => '42', 'question_id' => '8', 'name' => '运动', 'file_id' => null, 'grades' => '1', 'blank_index' => 4],
				['id' => '43', 'question_id' => '8', 'name' => '简单', 'file_id' => null, 'grades' => '1', 'blank_index' => 5],
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
		echo "m190726_073211_advertisement_option cannot be reverted.\n";

		return false;
	}
	*/
}
