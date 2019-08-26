<?php

use yii\db\Migration;

/**
 * Class m190826_092542_file
 */
class m190826_092542_file extends Migration
{
	public $tableName = '{{%file}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="化身、问题、问题选项文件"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->integer(11)->notNull(),
			'base_url' => $this->string(1024)->notNull(),
			'file_path' => $this->string(1024)->notNull(),
			'type' => $this->string(255),
			'size' => $this->integer(11),
			'name' => $this->string(255)
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['id']);
		$this->batchInsert($this->tableName, ['id', 'base_url', 'file_path', 'type', 'size', 'name'],
			[
				['id' => '1', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/yqdb_KNylEGszYIqaXvnQ3v9z6r25AFl.png', 'type' => 'image/png', 'size' => '383797', 'name' => '暗夜男.png'],
				['id' => '2', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/ZYdZ5G9JxQeTHnHkWMfYqpu4e9sWe-Sv.png', 'type' => 'image/png', 'size' => '301283', 'name' => '暗夜女.png'],
				['id' => '3', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/j4zYJeUF5DsAmo_iaqPIHBEXijRuEwWA.png', 'type' => 'image/png', 'size' => '517185', 'name' => '德莱尼男.png'],
				['id' => '4', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/djNfw2_5X1iqQQLP8UNNeDYETh4sQuiH.png', 'type' => 'image/png', 'size' => '294498', 'name' => '德莱尼女.png'],
				['id' => '5', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/ct6eWOSgJBESzM-QTcEZXuX-IvfAIAEE.png', 'type' => 'image/png', 'size' => '492353', 'name' => '巨魔男.png'],
				['id' => '6', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/khsOnGpSGEvFnyOSFDAz17jWonV6VoQF.png', 'type' => 'image/png', 'size' => '331167', 'name' => '巨魔女.png'],
				['id' => '7', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/Dls48oNKwEIl3Mvzr3O6_RFEaUNpE9CG.png', 'type' => 'image/png', 'size' => '549665', 'name' => '牛头男.png'],
				['id' => '8', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/eZqAUdbYh77OkyQ91wDQ7zIIpHzFHOYN.png', 'type' => 'image/png', 'size' => '374689', 'name' => '牛头女.png'],
				['id' => '9', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/jjosyM2RaLMwC4V26_HPfCajlUtr430_.png', 'type' => 'image/png', 'size' => '304216', 'name' => '人类男.png'],
				['id' => '10', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/tFKP91Dj417WjuRNvnQLpWPvqTzSCOqF.png', 'type' => 'image/png', 'size' => '206395', 'name' => '人类女.png'],
				['id' => '11', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/FYNayeOSW5JPP9WY3x4vnLcjmw7rmLZR.png', 'type' => 'image/jpeg', 'size' => '41934', 'name' => '亡灵女.png'],
				['id' => '12', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/p34V0h1aKEfFcsblpXXJFn33dyVQm3yi.png', 'type' => 'image/jpeg', 'size' => '58309', 'name' => '亡灵男.png'],
				['id' => '13', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/o9t2USiGGQg7eGmvaCyDk1B0lUUWoeeL.jpg', 'type' => 'image/jpeg', 'size' => '702865', 'name' => '暗夜男-高关联.jpg'],
				['id' => '14', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/wpWIKJNs5jc1PT_0-pDIWcCHOBykpafQ.jpg', 'type' => 'image/jpeg', 'size' => '700464', 'name' => '暗夜男-低关联.jpg'],
				['id' => '15', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/pXYM_43qJI1A_-kKspgENTAg6FrRx8oB.jpg', 'type' => 'image/jpeg', 'size' => '678942', 'name' => '暗夜女-高关联.jpg'],
				['id' => '16', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/O0ZjedNAhDog4ORrJf8gHpHlZA8mon_4.jpg', 'type' => 'image/jpeg', 'size' => '678104', 'name' => '暗夜女-低关联.jpg'],
				['id' => '17', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/Og_lBAHeMjTa3xsZK4WwiMq1KzEuKO3N.jpg', 'type' => 'image/jpeg', 'size' => '721974', 'name' => '德莱尼男-高关联.jpg'],
				['id' => '18', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/CyT9enuq0FRd__Uhf-9coo5L9YnDihtY.jpg', 'type' => 'image/jpeg', 'size' => '720518', 'name' => '德莱尼男-低关联.jpg'],
				['id' => '19', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/GDLpJI9DX3ZmwJ5qVP6ZWs7YcOu8o2n-.jpg', 'type' => 'image/jpeg', 'size' => '674355', 'name' => '德莱尼女-高关联.jpg'],
				['id' => '20', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/DXkDlknZyUyvLZ8aCyRlrA5voaka5r8Z.jpg', 'type' => 'image/jpeg', 'size' => '678899', 'name' => '德莱尼女-低关联.jpg'],
				['id' => '21', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/f8V3eMtWznglH6YLKJ2S9-vPaqT0oFSh.jpg', 'type' => 'image/jpeg', 'size' => '733099', 'name' => '巨魔男-高关联.jpg'],
				['id' => '22', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/96Q_yZjG0Jjv8HXAu55SnBK7weQAduwm.jpg', 'type' => 'image/jpeg', 'size' => '723913', 'name' => '巨魔男-低关联.jpg'],
				['id' => '23', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/e01jlSvWu2e3D0itPo-MCLK3r5DoaFep.jpg', 'type' => 'image/jpeg', 'size' => '677928', 'name' => '巨魔女-高关联.jpg'],
				['id' => '24', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/28xcrhAzFV8WlbzVCmU5s85U35ignPjf.jpg', 'type' => 'image/jpeg', 'size' => '676718', 'name' => '巨魔女-低关联.jpg'],
				['id' => '25', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/ClS7FJK9Mywa0Wqc0m6B054MS_L-sfn4.jpg', 'type' => 'image/jpeg', 'size' => '772311', 'name' => '牛头男-高关联.jpg'],
				['id' => '26', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/0p4faBYxDCVXAG5vY_he3XYZHmGxa9Vi.jpg', 'type' => 'image/jpeg', 'size' => '757875', 'name' => '牛头男-低关联.jpg'],
				['id' => '27', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/Tr4KUwf1O2Leudn2GWlMdXpFyDyCo-jD.jpg', 'type' => 'image/jpeg', 'size' => '700292', 'name' => '牛头女-高关联.jpg'],
				['id' => '28', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/SfqSGQG35TMHv5uFCK5u7J4qfxAjUIr_.jpg', 'type' => 'image/jpeg', 'size' => '691753', 'name' => '牛头女-低关联.jpg'],
				['id' => '29', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/iskMIjXofhc8APNv3ziIiPBEsBw0dXwO.jpg', 'type' => 'image/jpeg', 'size' => '683025', 'name' => '人类男-高关联.jpg'],
				['id' => '30', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/2X8p6PsB1KidinjmK5tJzwp4Qi_PZiKq.jpg', 'type' => 'image/jpeg', 'size' => '682309', 'name' => '人类男-低关联.jpg'],
				['id' => '31', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/omc8qDw_MbsIMMFKzGMPDfvGESBxps41.jpg', 'type' => 'image/jpeg', 'size' => '662009', 'name' => '人类女-高关联.jpg'],
				['id' => '32', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/QBFd9nijLESt7iv1ZcquKU-2qCp8LcQb.jpg', 'type' => 'image/jpeg', 'size' => '655433', 'name' => '人类女-低关联.jpg'],
				['id' => '35', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/PA8gxq-beAXDl0Py8jHNA6dc03-0HxAD.jpg', 'type' => 'image/jpeg', 'size' => '698089', 'name' => '亡灵男-高关联.jpg'],
				['id' => '36', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/epcVxknZ74nz3Po1Anw3hCVfrAg_dBhK.jpg', 'type' => 'image/jpeg', 'size' => '696457', 'name' => '亡灵男-低关联.jpg'],
				['id' => '37', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/BwCNQNgnJAUs2ohYJ0bh1-c5VbkBMchy.jpg', 'type' => 'image/jpeg', 'size' => '673669', 'name' => '亡灵女-高关联.jpg'],
				['id' => '38', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/BAzBjiZwE8G3U55Ubrk63mBzBMSpDd9z.jpg', 'type' => 'image/jpeg', 'size' => '676506', 'name' => '亡灵女-低关联.jpg'],
				['id' => '41', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/1.png', 'type' => 'image/png', 'size' => null, 'name' => '1.png'],
				['id' => '42', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/2.png', 'type' => 'image/png', 'size' => null, 'name' => '2.png'],
				['id' => '43', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/3.png', 'type' => 'image/png', 'size' => null, 'name' => '3.png'],
				['id' => '44', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/4.png', 'type' => 'image/png', 'size' => null, 'name' => '4.png'],
				['id' => '45', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/5.png', 'type' => 'image/png', 'size' => null, 'name' => '5.png'],
				['id' => '46', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/position-0.png', 'type' => 'image/png', 'size' => null, 'name' => 'position-0.png'],
				['id' => '47', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/position-1.png', 'type' => 'image/png', 'size' => null, 'name' => 'position-1.png'],
				['id' => '48', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/position-2.png', 'type' => 'image/png', 'size' => null, 'name' => 'position-2.png'],
				['id' => '49', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/position-3.png', 'type' => 'image/png', 'size' => null, 'name' => 'position-3.png'],
				['id' => '50', 'base_url' => 'http://188.131.207.200:8009/storage', 'file_path' => '/1/position-4.png', 'type' => 'image/png', 'size' => null, 'name' => 'position-4.png'],
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
		echo "m190826_092542_file cannot be reverted.\n";

		return false;
	}
	*/
}
