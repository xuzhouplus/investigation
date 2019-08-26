<?php

use yii\db\Migration;

/**
 * Class m190826_092934_incarnation
 */
class m190826_092934_incarnation extends Migration
{
	public $tableName = '{{%incarnation}}';

	/**
	 * {@inheritdoc}
	 */
	public function safeUp()
	{
		$tableOptions = null;
		if ($this->db->driverName === 'mysql') {
			$tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB COMMENT="化身"';
		}
		$this->createTable($this->tableName, [
			'id' => $this->integer(11)->notNull(),
			'name' => $this->string(255)->comment('化身名称')->notNull(),
			'file_id' => $this->string(255)->comment('化身图片id')->notNull(),
			'description' => $this->string(2000)->comment('说明'),
			'gender' => $this->string(255)->comment('性别')->notNull(),
			'grade' => $this->string(255)->comment('化身分值')
		], $tableOptions);
		$this->addPrimaryKey('primaryKey', $this->tableName, ['id']);
		$this->batchInsert($this->tableName, ['id', 'name', 'file_id', 'description', 'gender', 'grade'],
			[
				['id' => '1', 'name' => '暗夜精灵', 'file_id' => '1', 'description' => '一万年前，暗夜精灵就已经建立了一个庞大的帝国，但是他们无节制地滥用魔法，最终导致了帝国的毁灭。幸存的暗夜精灵怀着悲伤重新回到了森林中，过起了与世隔绝的隐居生活，直到他们过去的敌人燃烧军团重新来到这个世界。现在，别无选择的暗夜精灵重新开始和外界接触，为了自己的种族能在这个新的世界中生存下去而战斗着。', 'gender' => 'male', 'grade' => null],
				['id' => '2', 'name' => '暗夜精灵', 'file_id' => '2', 'description' => '一万年前，暗夜精灵就已经建立了一个庞大的帝国，但是他们无节制地滥用魔法，最终导致了帝国的毁灭。幸存的暗夜精灵怀着悲伤重新回到了森林中，过起了与世隔绝的隐居生活，直到他们过去的敌人燃烧军团重新来到这个世界。现在，别无选择的暗夜精灵重新开始和外界接触，为了自己的种族能在这个新的世界中生存下去而战斗着。', 'gender' => 'female', 'grade' => null],
				['id' => '3', 'name' => '德莱尼', 'file_id' => '3', 'description' => '高贵的德莱尼人从他们生活着的阿古斯世界逃出来之后，被燃烧军团追杀了数不清的岁月，最终在一个遥远的星球定居。他们与这个世界的原住民——信奉萨满教义的兽人和平相处，并给这里取名为德拉诺。在兽人被燃烧军团腐蚀而变得嗜血好战之后，德莱尼人几乎遭到了灭顶之灾。一部分幸存者逃到了艾泽拉斯，并在这里找到了共同对付燃烧军团的盟友。', 'gender' => 'male', 'grade' => null],
				['id' => '4', 'name' => '德莱尼', 'file_id' => '4', 'description' => '高贵的德莱尼人从他们生活着的阿古斯世界逃出来之后，被燃烧军团追杀了数不清的岁月，最终在一个遥远的星球定居。他们与这个世界的原住民——信奉萨满教义的兽人和平相处，并给这里取名为德拉诺。在兽人被燃烧军团腐蚀而变得嗜血好战之后，德莱尼人几乎遭到了灭顶之灾。一部分幸存者逃到了艾泽拉斯，并在这里找到了共同对付燃烧军团的盟友。', 'gender' => 'female', 'grade' => null],
				['id' => '5', 'name' => '巨魔', 'file_id' => '5', 'description' => '暗矛部落的巨魔原本居住在荆棘谷的丛林中，但是由于各阵营间的连年征战而被迫流离失所。兽人的部落向他们伸出了援手，并说服暗矛部落度过无尽之海，在卡利姆多的蛮荒之地定居下来。虽然他们继承了巨魔种族的黑暗本性，但是暗矛巨魔主张保持部落的团结，并愿意以强大的武力和原始部族魔法为部落共同的事业而效力。', 'gender' => 'male', 'grade' => null],
				['id' => '6', 'name' => '巨魔', 'file_id' => '6', 'description' => '暗矛部落的巨魔原本居住在荆棘谷的丛林中，但是由于各阵营间的连年征战而被迫流离失所。兽人的部落向他们伸出了援手，并说服暗矛部落度过无尽之海，在卡利姆多的蛮荒之地定居下来。虽然他们继承了巨魔种族的黑暗本性，但是暗矛巨魔主张保持部落的团结，并愿意以强大的武力和原始部族魔法为部落共同的事业而效力。', 'gender' => 'female', 'grade' => null],
				['id' => '7', 'name' => '牛头人', 'file_id' => '7', 'description' => '牛头人一直以来都在努力保护自然的平衡，并时刻遵循着他们所信仰的女神：大地母亲的意愿。众多游牧部族聚集在同一面大旗下，定居于莫高雷的肥沃平原上。要不是兽人及时伸出了援手，这个种族可能已经被劫掠成性的半人马灭绝了。牛头人至今依然牢记这笔血债，为保护自己的土地而与部落并肩作战。', 'gender' => 'male', 'grade' => null],
				['id' => '8', 'name' => '牛头人', 'file_id' => '8', 'description' => '牛头人一直以来都在努力保护自然的平衡，并时刻遵循着他们所信仰的女神：大地母亲的意愿。众多游牧部族聚集在同一面大旗下，定居于莫高雷的肥沃平原上。要不是兽人及时伸出了援手，这个种族可能已经被劫掠成性的半人马灭绝了。牛头人至今依然牢记这笔血债，为保护自己的土地而与部落并肩作战。', 'gender' => 'female', 'grade' => null],
				['id' => '9', 'name' => '人类', 'file_id' => '9', 'description' => '人类是个年轻而多才多艺的种族，可以以惊人的效率学习战斗技巧、制造技术和操控魔法的技艺。靠着勇猛和乐观的 天性，人类建造了许多世界上最伟大的王国。在这个动乱的时代，经历了世代纷争的人类正努力恢复昔日的辉煌，创造光明的未来。', 'gender' => 'male', 'grade' => null],
				['id' => '10', 'name' => '人类', 'file_id' => '10', 'description' => '人类是个年轻而多才多艺的种族，可以以惊人的效率学习战斗技巧、制造技术和操控魔法的技艺。靠着勇猛和乐观的 天性，人类建造了许多世界上最伟大的王国。在这个动乱的时代，经历了世代纷争的人类正努力恢复昔日的辉煌，创造光明的未来。', 'gender' => 'female', 'grade' => null],
				['id' => '11', 'name' => '亡灵', 'file_id' => '11', 'description' => '作为昔日的无脑奴隶，阴郁的被遗忘者推翻了可怕的巫妖王，转而向邪恶的女妖之王希尔瓦娜斯宣誓效忠。在她的领导下，被遗忘者大军夺回了洛丹伦王国的废墟。然而面对一心复仇的人类，以及那些不信任亡灵邪恶动机的部落盟友，每一天对他们来说都是持续不断的抗争与战斗。', 'gender' => 'female', 'grade' => null],
				['id' => '12', 'name' => '亡灵', 'file_id' => '12', 'description' => '作为昔日的无脑奴隶，阴郁的被遗忘者推翻了可怕的巫妖王，转而向邪恶的女妖之王希尔瓦娜斯宣誓效忠。在她的领导下，被遗忘者大军夺回了洛丹伦王国的废墟。然而面对一心复仇的人类，以及那些不信任亡灵邪恶动机的部落盟友，每一天对他们来说都是持续不断的抗争与战斗。', 'gender' => 'male', 'grade' => null],
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
		echo "m190826_092934_incarnation cannot be reverted.\n";

		return false;
	}
	*/
}
