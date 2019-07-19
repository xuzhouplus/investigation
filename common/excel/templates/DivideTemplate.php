<?php


namespace common\excel\templates;


class DivideTemplate extends ExcelTemplate
{
	public function run()
	{
		$this->setSheetTitle('调查数据');
		$this->setHead([
			['content' => '分组计数', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'B4C6E7'],
			['content' => '分组标记', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'B4C6E7'],
			['content' => '认同1', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '认同2', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '认同均值', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFCC'],
			['content' => '外倾1（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '外倾2（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '外倾均值（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'DBDBDB'],
			['content' => '宜人1（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '宜人2（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '宜人均值（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'DBDBDB'],
			['content' => '尽责1（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '尽责2（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '尽责均值（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'DBDBDB'],
			['content' => '情稳1（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '情稳2（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '情稳均值（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'DBDBDB'],
			['content' => '开放1（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '开放2（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '开放均值（现实）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'DBDBDB'],
			['content' => '外倾1（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '外倾2（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '外倾均值（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'D9E1F2'],
			['content' => '宜人1（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '宜人2（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '宜人均值（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'D9E1F2'],
			['content' => '尽责1（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '尽责2（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '尽责均值（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'D9E1F2'],
			['content' => '情稳1（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '情稳2（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '情稳均值（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'D9E1F2'],
			['content' => '开放1（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '开放2（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '开放均值（虚拟）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'D9E1F2'],
			['content' => '外倾均值差异', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'EDEDED'],
			['content' => '宜人均值差异', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'EDEDED'],
			['content' => '尽责均值差异', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'EDEDED'],
			['content' => '情稳均值差异', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'EDEDED'],
			['content' => '开放均值差异', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'EDEDED'],
			['content' => '虚拟自我差异', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor'  => 'FFC7CE', 'fontColor' =>  'BE5055'],
			['content' => '|差异|×认同', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'ED7D31', 'fontColor' => 'FFFFFF'],
			['content' => '活跃', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '热情', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '快乐', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '兴高采烈', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '兴奋', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '自豪', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '欣喜', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '精神充沛', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '感激', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '正性情绪均值', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => '70AD47', 'fontColor' => 'FFFFFF'],
			['content' => '难过', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '害怕', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '紧张', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '惊恐', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '内疚', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '战战兢兢', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '恼怒', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '羞愧', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '易怒', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '负性情绪均值', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'C6E0D4'],
			['content' => '品牌态度A', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '品牌态度B', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '品牌态度C', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '品牌态度D', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '品牌态度均值', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'F8837B'],
			['content' => '品牌记忆1', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '品牌记忆2', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '品牌记忆3', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '品牌记忆总分', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'F8837B'],
			['content' => '用户ID', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '性别 （1=男）', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '年龄', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '化身认同', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '差异大小', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '差异方向', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
			['content' => '关联性', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF'],
		]);
		$this->setBody([
			['content' => 'divideIndex', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'B4C6E7'],
			['content' => 'divideStamp', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'B4C6E7'],
			['content' => 'approveGrades', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'immerseGrades', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'identifyMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'FFFFCC', 'text' => function ($column, $row) {
				return '=(C' . $row . '+D' . $row . ')/2';
			}],
			['content' => 'extravertReality1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'extravertReality2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'extravertRealityMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'DBDBDB', 'text' => function ($column, $row) {
				return '=(F' . $row . '+G' . $row . ')/2';
			}],
			['content' => 'pleasantReality1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'pleasantReality2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'pleasantRealityMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'DBDBDB', 'text' => function ($column, $row) {
				return '=(I' . $row . '+J' . $row . ')/2';
			}],
			['content' => 'conscientiousReality1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'conscientiousReality2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'conscientiousRealityMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'DBDBDB', 'text' => function ($column, $row) {
				return '=(L' . $row . '+M' . $row . ')/2';
			}],
			['content' => 'nervousReality1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'nervousReality2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'nervousRealityMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'DBDBDB', 'text' => function ($column, $row) {
				return '=(O' . $row . '+P' . $row . ')/2';
			}],
			['content' => 'openReality1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'openReality2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'openRealityMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'DBDBDB', 'text' => function ($column, $row) {
				return '=(R' . $row . '+S' . $row . ')/2';
			}],
			['content' => 'extravertInvented1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'extravertInvented2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'extravertInventedMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'D9E1F2', 'text' => function ($column, $row) {
				return '=(U' . $row . '+V' . $row . ')/2';
			}],
			['content' => 'pleasantInvented1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'pleasantInvented2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'pleasantInventedMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'D9E1F2', 'text' => function ($column, $row) {
				return '=(X' . $row . '+Y' . $row . ')/2';
			}],
			['content' => 'conscientiousInvented1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'conscientiousInvented2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'conscientiousInventedMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'D9E1F2', 'text' => function ($column, $row) {
				return '=(AA' . $row . '+AB' . $row . ')/2';
			}],
			['content' => 'nervousInvented1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'nervousInvented2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'nervousInventedMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'D9E1F2', 'text' => function ($column, $row) {
				return '=(AD' . $row . '+AE' . $row . ')/2';
			}],
			['content' => 'openInvented1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'openInvented2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'openInventedMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'D9E1F2', 'text' => function ($column, $row) {
				return '=(AG' . $row . '+AH' . $row . ')/2';
			}],
			['content' => 'extravertDifference', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'EDEDED', 'text' => function ($column, $row) {
				return '=W' . $row . '-H' . $row;
			}],
			['content' => 'pleasantDifference', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'EDEDED', 'text' => function ($column, $row) {
				return '=Z' . $row . '-K' . $row;
			}],
			['content' => 'conscientiousDifference', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'EDEDED', 'text' => function ($column, $row) {
				return '=AC' . $row . '-N' . $row;
			}],
			['content' => 'nervousDifference', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'EDEDED', 'text' => function ($column, $row) {
				return '=AF' . $row . '-Q' . $row;
			}],
			['content' => 'openInventedMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'EDEDED', 'text' => function ($column, $row) {
				return '=AI' . $row . '-T' . $row;
			}],
			['content' => 'egoDifference', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'FFC7CE', 'fontColor' => 'BE5055', 'text' => function ($column, $row) {
				return '=SUM(AJ' . $row . ':AN' . $row . ')';
			}],
			['content' => 'egoMultiplyIdentify', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'ED7D31', 'fontColor' => 'FFFFFF', 'text' => function ($column, $row) {
				return '=ABS(AO' . $row . ')*E' . $row;
			}],
			['content' => 'egoAlive', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoWarmth', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoHappy', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoJubilant', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoExcited', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoProud', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoDelighted', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoEnergetic', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoGrateful', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoPositiveMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => '70AD47', 'fontColor' => 'FFFFFF', 'text' => function ($column, $row) {
				return '=(AQ' . $row . '+AR' . $row . '+AS' . $row . '+AT' . $row . '+AU' . $row . '+AV' . $row . '+AW' . $row . '+AX' . $row . '+AY' . $row . ')/9';
			}],
			['content' => 'egoSad', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoScared', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoNervous', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoTerrified', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoGuilt', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoTrembled', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoAnnoyed', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoAshamed', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoIrritable', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'egoNegativeMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'C6E0D4', 'text' => function ($column, $row) {
				return '=(BA' . $row . '+BB' . $row . '+BC' . $row . '+BD' . $row . '+BE' . $row . '+BF' . $row . '+BG' . $row . '+BH' . $row . '+BI' . $row . ')/9';
			}],
			['content' => 'brandAttitudeA', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'brandAttitudeB', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'brandAttitudeC', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'brandAttitudeD', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'brandAttitudeMean', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'F8837B', 'text' => function ($column, $row) {
				return '=(BK' . $row . '+BL' . $row . '+BM' . $row . '+BN' . $row . ')/4';
			}],
			['content' => 'brandMemory1', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'brandMemory2', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'brandMemory3', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'brandMemoryTotal', 'fontName' => '微软雅黑', 'fontSize' => 9, 'bgColor' => 'F8837B', 'text' => function ($column, $row) {
				return '=BP' . $row . '+BQ' . $row . '+BR' . $row;
			}],
			['content' => 'userID', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'gender', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'age', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'identifyStamp', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'differenceSize', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'differenceDirection', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'associationStrength', 'fontName' => '微软雅黑', 'fontSize' => 9],
		]);
	}
}