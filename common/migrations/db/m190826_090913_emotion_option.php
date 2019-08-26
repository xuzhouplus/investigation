<?php

use yii\db\Migration;

/**
 * Class m190826_090913_emotion_option
 */
class m190826_090913_emotion_option extends Migration
{
	public $tableName = '{{%emotion_option}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="情绪量化问题选项"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->integer(11)->notNull(),
			'question_id' => $this->integer(11)->notNull(),
			'name' => $this->string(255)->notNull(),
			'grades' => $this->integer(2)->notNull(),
			'description' => $this->string(255)
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['id']);
		$this->batchInsert($this->tableName, ['id', 'question_id', 'name', 'grades', 'description'],
			[
				['id' => '1', 'question_id' => '1', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '2', 'question_id' => '1', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '3', 'question_id' => '1', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '4', 'question_id' => '1', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '5', 'question_id' => '1', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '6', 'question_id' => '2', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '7', 'question_id' => '2', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '8', 'question_id' => '2', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '9', 'question_id' => '2', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '10', 'question_id' => '2', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '11', 'question_id' => '3', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '12', 'question_id' => '3', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '13', 'question_id' => '3', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '14', 'question_id' => '3', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '15', 'question_id' => '3', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '16', 'question_id' => '4', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '17', 'question_id' => '4', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '18', 'question_id' => '4', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '19', 'question_id' => '4', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '20', 'question_id' => '4', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '21', 'question_id' => '5', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '22', 'question_id' => '5', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '23', 'question_id' => '5', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '24', 'question_id' => '5', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '25', 'question_id' => '5', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '26', 'question_id' => '6', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '27', 'question_id' => '6', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '28', 'question_id' => '6', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '29', 'question_id' => '6', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '30', 'question_id' => '6', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '31', 'question_id' => '7', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '32', 'question_id' => '7', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '33', 'question_id' => '7', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '34', 'question_id' => '7', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '35', 'question_id' => '7', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '36', 'question_id' => '8', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '37', 'question_id' => '8', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '38', 'question_id' => '8', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '39', 'question_id' => '8', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '40', 'question_id' => '8', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '41', 'question_id' => '9', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '42', 'question_id' => '9', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '43', 'question_id' => '9', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '44', 'question_id' => '9', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '45', 'question_id' => '9', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '46', 'question_id' => '10', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '47', 'question_id' => '10', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '48', 'question_id' => '10', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '49', 'question_id' => '10', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '50', 'question_id' => '10', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '51', 'question_id' => '11', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '52', 'question_id' => '11', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '53', 'question_id' => '11', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '54', 'question_id' => '11', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '55', 'question_id' => '11', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '56', 'question_id' => '12', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '57', 'question_id' => '12', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '58', 'question_id' => '12', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '59', 'question_id' => '12', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '60', 'question_id' => '12', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '61', 'question_id' => '13', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '62', 'question_id' => '13', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '63', 'question_id' => '13', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '64', 'question_id' => '13', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '65', 'question_id' => '13', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '66', 'question_id' => '14', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '67', 'question_id' => '14', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '68', 'question_id' => '14', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '69', 'question_id' => '14', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '70', 'question_id' => '14', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '71', 'question_id' => '15', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '72', 'question_id' => '15', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '73', 'question_id' => '15', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '74', 'question_id' => '15', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '75', 'question_id' => '15', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '76', 'question_id' => '16', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '77', 'question_id' => '16', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '78', 'question_id' => '16', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '79', 'question_id' => '16', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '80', 'question_id' => '16', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '81', 'question_id' => '17', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '82', 'question_id' => '17', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '83', 'question_id' => '17', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '84', 'question_id' => '17', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '85', 'question_id' => '17', 'name' => '非常强', 'grades' => '5', 'description' => null],
				['id' => '86', 'question_id' => '18', 'name' => '非常少或完全没有', 'grades' => '1', 'description' => null],
				['id' => '87', 'question_id' => '18', 'name' => '有一点', 'grades' => '2', 'description' => null],
				['id' => '88', 'question_id' => '18', 'name' => '中等', 'grades' => '3', 'description' => null],
				['id' => '89', 'question_id' => '18', 'name' => '较强', 'grades' => '4', 'description' => null],
				['id' => '90', 'question_id' => '18', 'name' => '非常强', 'grades' => '5', 'description' => null],
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
		echo "m190826_090913_emotion_option cannot be reverted.\n";

		return false;
	}
	*/
}
