<?php


namespace common\excel\templates;


class UserTemplate extends ExcelTemplate
{
	public function run()
	{
		$this->setTitle(['content' => '用户导出', 'fontName' => '微软雅黑', 'fontSize' => 11, 'fontBold' => true, 'bgColor' => 'FFFFFF00']);
		$this->setHead([
			['content' => '姓名', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF00'],
			['content' => '性别', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF00'],
			['content' => '年龄', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF00', 'width' => 24],
			['content' => '单位', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF00', 'width' => 24],
			['content' => '手机号码', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF00', 'width' => 24],
			['content' => '身份证', 'fontName' => '微软雅黑', 'fontSize' => 9, 'fontBold' => true, 'bgColor' => 'FFFFFF00', 'width' => 24],
		]);
		$this->setBody([
			['content' => 'username', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'gender', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'age', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'department', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'mobile', 'fontName' => '微软雅黑', 'fontSize' => 9],
			['content' => 'id_card', 'fontName' => '微软雅黑', 'fontSize' => 9],
		]);
	}
}