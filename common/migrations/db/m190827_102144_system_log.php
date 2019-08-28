<?php

use yii\db\Migration;

/**
 * Class m190827_102144_system_log
 */
class m190827_102144_system_log extends Migration
{
	public $tableName = '{{%system_log}}';
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			// http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
		}

		$this->createTable($this->tableName, [
			'id' => $this->bigPrimaryKey(),
			'level' => $this->integer(),
			'category' => $this->string(),
			'log_time' => $this->double(),
			'prefix' => $this->text(),
			'message' => $this->text(),
		], $tableOptions);

		$this->createIndex('idx_log_level', $this->tableName, 'level');
		$this->createIndex('idx_log_category', $this->tableName, 'category');
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
        echo "m190827_102144_system_log cannot be reverted.\n";

        return false;
    }
    */
}
