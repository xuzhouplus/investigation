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
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="品牌广告"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11),
			'question_id' => $this->integer(11)->notNull(),
			'name' => $this->string(255),
			'file_id' => $this->integer(11),
			'grades' => $this->integer(1)
		], $tableOptions);
		$this->batchInsert($this->tableName, ['id', 'question_id', 'name', 'file_id', 'grades'],
			[
				['id' => '1', 'question_id' => '1', 'name' => '1.png', 'file_id' => '41', 'grades' => '0'],
				['id' => '2', 'question_id' => '1', 'name' => '2.png', 'file_id' => '42', 'grades' => '0'],
				['id' => '3', 'question_id' => '1', 'name' => '3.png', 'file_id' => '43', 'grades' => '0'],
				['id' => '4', 'question_id' => '1', 'name' => '4.png', 'file_id' => '44', 'grades' => '2'],
				['id' => '5', 'question_id' => '1', 'name' => '5.png', 'file_id' => '45', 'grades' => '0'],
				['id' => '6', 'question_id' => '3', 'name' => '0.png', 'file_id' => '46', 'grades' => '2'],
				['id' => '7', 'question_id' => '3', 'name' => '1.png', 'file_id' => '47', 'grades' => '0'],
				['id' => '8', 'question_id' => '3', 'name' => '2.png', 'file_id' => '48', 'grades' => '0'],
				['id' => '9', 'question_id' => '3', 'name' => '3.png', 'file_id' => '49', 'grades' => '0'],
				['id' => '10', 'question_id' => '3', 'name' => '4.png', 'file_id' => '50', 'grades' => '0'],
				['id' => '11', 'question_id' => '2', 'name' => '我运动我存在', 'file_id' => '', 'grades' => '0'],
				['id' => '12', 'question_id' => '2', 'name' => '一切皆有可能', 'file_id' => '', 'grades' => '0'],
				['id' => '13', 'question_id' => '2', 'name' => '把精彩留给自己', 'file_id' => '', 'grades' => '0'],
				['id' => '14', 'question_id' => '2', 'name' => '一切皆有可能', 'file_id' => '', 'grades' => '0'],
				['id' => '15', 'question_id' => '2', 'name' => '让改变发生', 'file_id' => '', 'grades' => '2'],
				['id' => '16', 'question_id' => '4', 'name' => '1分', 'file_id' => '', 'grades' => '1'],
				['id' => '17', 'question_id' => '4', 'name' => '2分', 'file_id' => '', 'grades' => '2'],
				['id' => '18', 'question_id' => '4', 'name' => '3分', 'file_id' => '', 'grades' => '3'],
				['id' => '19', 'question_id' => '4', 'name' => '4分', 'file_id' => '', 'grades' => '4'],
				['id' => '20', 'question_id' => '4', 'name' => '5分', 'file_id' => '', 'grades' => '5'],
				['id' => '21', 'question_id' => '5', 'name' => '1分', 'file_id' => '', 'grades' => '1'],
				['id' => '22', 'question_id' => '5', 'name' => '2分', 'file_id' => '', 'grades' => '2'],
				['id' => '23', 'question_id' => '5', 'name' => '3分', 'file_id' => '', 'grades' => '3'],
				['id' => '24', 'question_id' => '5', 'name' => '4分', 'file_id' => '', 'grades' => '4'],
				['id' => '25', 'question_id' => '5', 'name' => '5分', 'file_id' => '', 'grades' => '5'],
				['id' => '26', 'question_id' => '6', 'name' => '1分', 'file_id' => '', 'grades' => '1'],
				['id' => '27', 'question_id' => '6', 'name' => '2分', 'file_id' => '', 'grades' => '2'],
				['id' => '28', 'question_id' => '6', 'name' => '3分', 'file_id' => '', 'grades' => '3'],
				['id' => '29', 'question_id' => '6', 'name' => '4分', 'file_id' => '', 'grades' => '4'],
				['id' => '30', 'question_id' => '6', 'name' => '5分', 'file_id' => '', 'grades' => '5'],
				['id' => '31', 'question_id' => '7', 'name' => '1分', 'file_id' => '', 'grades' => '1'],
				['id' => '32', 'question_id' => '7', 'name' => '2分', 'file_id' => '', 'grades' => '2'],
				['id' => '33', 'question_id' => '7', 'name' => '3分', 'file_id' => '', 'grades' => '3'],
				['id' => '34', 'question_id' => '7', 'name' => '4分', 'file_id' => '', 'grades' => '4'],
				['id' => '35', 'question_id' => '7', 'name' => '5分', 'file_id' => '', 'grades' => '5'],
				['id' => '36', 'question_id' => '8', 'name' => 'E', 'file_id' => '', 'grades' => '1'],
				['id' => '37', 'question_id' => '8', 'name' => 'e', 'file_id' => '', 'grades' => '1'],
				['id' => '38', 'question_id' => '8', 'name' => 'M', 'file_id' => '', 'grades' => '1'],
				['id' => '39', 'question_id' => '8', 'name' => 'm', 'file_id' => '', 'grades' => '1'],
				['id' => '40', 'question_id' => '8', 'name' => 'A', 'file_id' => '', 'grades' => '1'],
				['id' => '41', 'question_id' => '8', 'name' => 'a', 'file_id' => '', 'grades' => '1'],
				['id' => '42', 'question_id' => '8', 'name' => '运动', 'file_id' => '', 'grades' => '1'],
				['id' => '43', 'question_id' => '8', 'name' => '简单', 'file_id' => '', 'grades' => '1'],

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
