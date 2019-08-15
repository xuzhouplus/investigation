<?php

use yii\db\Migration;

/**
 * Class m190815_021754_advertisement_question
 */
class m190815_021754_advertisement_question extends Migration
{
	public $tableName = '{{%advertisement_question}}';

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
			'title' => $this->string(255)->notNull(),
			'description' => $this->string(255),
			'type' => $this->string(255),
			'kind' => $this->string(255)->notNull()->defaultValue('choice')->comment('问题类型，completion填空题，choice选择题'),
			'status' => $this->integer(1)->notNull()->defaultValue(1)->comment('1启用，2禁用'),
			'file_id' => $this->integer(11)
		], $tableOptions);
		$this->batchInsert($this->tableName, ['id', 'title', 'description', 'type', 'kind', 'status', 'file_id'],
			[
				['id' => '1', 'title' => '在前面虚拟角色界面中，您所看到的是以下哪一个样式的Logo?', 'description' => '图片选择', 'type' => 'brandMemory', 'kind' => 'choice', 'status' => '2', 'file_id' => ''],
				['id' => '2', 'title' => '在前面虚拟角色界面中，广告Logo下方的广告语是以下哪一个？', 'description' => '广告语', 'type' => 'brandMemory', 'kind' => 'choice', 'status' => '2', 'file_id' => ''],
				['id' => '3', 'title' => '在前面虚拟角色界面中，广告Logo文字的位置是以下哪一种？', 'description' => '位置判断', 'type' => 'brandMemory', 'kind' => 'choice', 'status' => '2', 'file_id' => ''],
				['id' => '4', 'title' => '不可爱的（1分）————可爱的（5分）', 'description' => '您对前面虚拟角色界面中所植入的”LI-NING“品牌的态度是:', 'type' => 'brandAttitude', 'kind' => 'choice', 'status' => '1', 'file_id' => ''],
				['id' => '5', 'title' => '不喜欢的（1分）————喜欢的（5分）', 'description' => '您对前面虚拟角色界面中所植入的”LI-NING“品牌的态度是:', 'type' => 'brandAttitude', 'kind' => 'choice', 'status' => '1', 'file_id' => ''],
				['id' => '6', 'title' => '消极的（1分）————积极的（5分）', 'description' => '您对前面虚拟角色界面中所植入的”LI-NING“品牌的态度是:', 'type' => 'brandAttitude', 'kind' => 'choice', 'status' => '1', 'file_id' => ''],
				['id' => '7', 'title' => '不好的（1分）————好的（5分）', 'description' => '您对前面虚拟角色界面中所植入的”LI-NING“品牌的态度是:', 'type' => 'brandAttitude', 'kind' => 'choice', 'status' => '1', 'file_id' => ''],
				['id' => '8', 'title' => '请填写在前面虚拟角色界面出现的广告Logo中缺少的文字：', 'description' => '文字内容', 'type' => 'brandMemory', 'kind' => 'completion', 'status' => '1', 'file_id' => ''],
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
		echo "m190815_021754_advertisement_question cannot be reverted.\n";

		return false;
	}
	*/
}
