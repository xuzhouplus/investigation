<?php

use yii\db\Migration;

/**
 * Class m190726_071145_advertisement
 */
class m190726_071145_advertisement extends Migration
{
	public $tableName = '{{%advertisement}}';

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
			'id' => $this->primaryKey(11)->comment('品牌广告ID'),
			'incarnation_id' => $this->integer(11)->notNull()->comment('化身id'),
			'on_file_id' => $this->integer(11)->notNull()->comment('广告在化身上的图片文件id'),
			'side_file_id' => $this->integer(11)->notNull()->comment('广告在化身旁边的图片文件id'),
			'description' => $this->string(255)->comment('广告描述'),
		], $tableOptions);
		$this->createIndex($this->tableName, 'inv_advertisement', 'incarnation_id');
		$this->batchInsert($this->tableName, ['id', 'incarnation_id', 'on_file_id', 'side_file_id', 'description'], [
			[
				'id' => 1,
				'incarnation_id' => 1,
				'on_file_id' => 13,
				'side_file_id' => 14,
				'description' => ''
			],
			[
				'id' => 2,
				'incarnation_id' => 2,
				'on_file_id' => 15,
				'side_file_id' => 16,
				'description' => ''
			],
			[
				'id' => 3,
				'incarnation_id' => 3,
				'on_file_id' => 17,
				'side_file_id' => 18,
				'description' => ''
			],
			[
				'id' => 4,
				'incarnation_id' => 4,
				'on_file_id' => 19,
				'side_file_id' => 20,
				'description' => ''
			],
			[
				'id' => 5,
				'incarnation_id' => 5,
				'on_file_id' => 21,
				'side_file_id' => 22,
				'description' => ''
			],
			[
				'id' => 6,
				'incarnation_id' => 6,
				'on_file_id' => 23,
				'side_file_id' => 24,
				'description' => ''
			],
			[
				'id' => 7,
				'incarnation_id' => 7,
				'on_file_id' => 25,
				'side_file_id' => 26,
				'description' => ''
			],
			[
				'id' => 8,
				'incarnation_id' => 8,
				'on_file_id' => 27,
				'side_file_id' => 28,
				'description' => ''
			],
			[
				'id' => 9,
				'incarnation_id' => 9,
				'on_file_id' => 29,
				'side_file_id' => 30,
				'description' => ''
			],
			[
				'id' => 10,
				'incarnation_id' => 10,
				'on_file_id' => 31,
				'side_file_id' => 32,
				'description' => ''
			],
			[
				'id' => 11,
				'incarnation_id' => 11,
				'on_file_id' => 33,
				'side_file_id' => 34,
				'description' => ''
			],
			[
				'id' => 12,
				'incarnation_id' => 12,
				'on_file_id' => 35,
				'side_file_id' => 36,
				'description' => ''
			]
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
		echo "m190726_071145_advertisement cannot be reverted.\n";

		return false;
	}
	*/
}
