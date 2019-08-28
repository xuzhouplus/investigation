<?php

use yii\db\Migration;

/**
 * Class m190826_090211_ego_option
 */
class m190826_090211_ego_option extends Migration
{
	public $tableName = '{{%ego_option}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="自我差异问题选项"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->primaryKey(11)->notNull(),
			'question_id' => $this->integer(11)->notNull(),
			'name' => $this->string(255)->notNull(),
			'grades' => $this->integer(2)->notNull(),
			'description' => $this->string(255)
		], $tableOptions);
		$this->batchInsert($this->tableName, ['id', 'question_id', 'name', 'grades', 'description'],
			[
				['id' => '1', 'question_id' => '1', 'name' => '非常反对', 'grades' => '5', 'description' => null],
				['id' => '2', 'question_id' => '1', 'name' => '比较反对', 'grades' => '4', 'description' => null],
				['id' => '3', 'question_id' => '1', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '4', 'question_id' => '1', 'name' => '比较认同', 'grades' => '2', 'description' => null],
				['id' => '5', 'question_id' => '1', 'name' => '非常认同', 'grades' => '1', 'description' => null],
				['id' => '6', 'question_id' => '2', 'name' => '非常反对', 'grades' => '1', 'description' => null],
				['id' => '7', 'question_id' => '2', 'name' => '比较反对', 'grades' => '2', 'description' => null],
				['id' => '8', 'question_id' => '2', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '9', 'question_id' => '2', 'name' => '比较认同', 'grades' => '4', 'description' => null],
				['id' => '10', 'question_id' => '2', 'name' => '非常认同', 'grades' => '5', 'description' => null],
				['id' => '11', 'question_id' => '3', 'name' => '非常反对', 'grades' => '5', 'description' => null],
				['id' => '12', 'question_id' => '3', 'name' => '比较反对', 'grades' => '4', 'description' => null],
				['id' => '13', 'question_id' => '3', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '14', 'question_id' => '3', 'name' => '比较认同', 'grades' => '2', 'description' => null],
				['id' => '15', 'question_id' => '3', 'name' => '非常认同', 'grades' => '1', 'description' => null],
				['id' => '16', 'question_id' => '4', 'name' => '非常反对', 'grades' => '1', 'description' => null],
				['id' => '17', 'question_id' => '4', 'name' => '比较反对', 'grades' => '2', 'description' => null],
				['id' => '18', 'question_id' => '4', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '19', 'question_id' => '4', 'name' => '比较认同', 'grades' => '4', 'description' => null],
				['id' => '20', 'question_id' => '4', 'name' => '非常认同', 'grades' => '5', 'description' => null],
				['id' => '21', 'question_id' => '5', 'name' => '非常反对', 'grades' => '5', 'description' => null],
				['id' => '22', 'question_id' => '5', 'name' => '比较反对', 'grades' => '4', 'description' => null],
				['id' => '23', 'question_id' => '5', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '24', 'question_id' => '5', 'name' => '比较认同', 'grades' => '2', 'description' => null],
				['id' => '25', 'question_id' => '5', 'name' => '非常认同', 'grades' => '1', 'description' => null],
				['id' => '26', 'question_id' => '6', 'name' => '非常反对', 'grades' => '1', 'description' => null],
				['id' => '27', 'question_id' => '6', 'name' => '比较反对', 'grades' => '2', 'description' => null],
				['id' => '28', 'question_id' => '6', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '29', 'question_id' => '6', 'name' => '比较认同', 'grades' => '4', 'description' => null],
				['id' => '30', 'question_id' => '6', 'name' => '非常认同', 'grades' => '5', 'description' => null],
				['id' => '31', 'question_id' => '7', 'name' => '非常反对', 'grades' => '5', 'description' => null],
				['id' => '32', 'question_id' => '7', 'name' => '比较反对', 'grades' => '4', 'description' => null],
				['id' => '33', 'question_id' => '7', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '34', 'question_id' => '7', 'name' => '比较认同', 'grades' => '2', 'description' => null],
				['id' => '35', 'question_id' => '7', 'name' => '非常认同', 'grades' => '1', 'description' => null],
				['id' => '36', 'question_id' => '8', 'name' => '非常反对', 'grades' => '1', 'description' => null],
				['id' => '37', 'question_id' => '8', 'name' => '比较反对', 'grades' => '2', 'description' => null],
				['id' => '38', 'question_id' => '8', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '39', 'question_id' => '8', 'name' => '比较认同', 'grades' => '4', 'description' => null],
				['id' => '40', 'question_id' => '8', 'name' => '非常认同', 'grades' => '5', 'description' => null],
				['id' => '41', 'question_id' => '9', 'name' => '非常反对', 'grades' => '1', 'description' => null],
				['id' => '42', 'question_id' => '9', 'name' => '比较反对', 'grades' => '2', 'description' => null],
				['id' => '43', 'question_id' => '9', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '44', 'question_id' => '9', 'name' => '比较认同', 'grades' => '4', 'description' => null],
				['id' => '45', 'question_id' => '9', 'name' => '非常认同', 'grades' => '5', 'description' => null],
				['id' => '46', 'question_id' => '10', 'name' => '非常反对', 'grades' => '1', 'description' => null],
				['id' => '47', 'question_id' => '10', 'name' => '比较反对', 'grades' => '2', 'description' => null],
				['id' => '48', 'question_id' => '10', 'name' => '既不认同也不反对', 'grades' => '3', 'description' => null],
				['id' => '49', 'question_id' => '10', 'name' => '比较认同', 'grades' => '4', 'description' => null],
				['id' => '50', 'question_id' => '10', 'name' => '非常认同', 'grades' => '5', 'description' => null],
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
		echo "m190826_090211_ego_option cannot be reverted.\n";

		return false;
	}
	*/
}
