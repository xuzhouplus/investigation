<?php


namespace common\components\excel;


use yii\base\Component;

class UserExport extends Component
{
	public $exportTemplate;
	public $verticalAligns = ['top', 'middle', 'bottom'];
	public $horizontalAlign = ['left', 'center', 'right'];

	public function init()
	{
		if (!$this->exportTemplate) {
			throw new \Exception('用户到处模板没有配置');
		}
	}

	/**
	 * @param $file string
	 * @return array
	 * @throws Exception
	 * @throws PHPExcel_Exception
	 * @throws PHPExcel_Reader_Exception
	 */
	public function loadExcel($file)
	{
		//默认用excel2007读取excel，若格式不对，则用之前的版本进行读取
		$PHPReader = new PHPExcel_Reader_Excel2007();
		if (!$PHPReader->canRead($file)) {
			$PHPReader = new PHPExcel_Reader_Excel5();
			if (!$PHPReader->canRead($file)) {
				throw new Exception('excel读取失败');
			}
		}
		$PHPExcel = $PHPReader->load($file);
//  $PHPExcel = PHPExcel_IOFactory::load($file);
		$currentSheet = $PHPExcel->getSheet(0); //读取excel文件中的第一个工作表
//  $currentSheet = $PHPExcel->getAllSheets(); //读取excel文件中的第一个工作表
		$allColumn = $currentSheet->getHighestColumn();
		$allColumn = PHPExcel_Cell::columnIndexFromString($allColumn);
		//取得最大的列号
		$allRow = $currentSheet->getHighestRow(); // 取得一共有多少行
//    PHPExcel_Cell::columnIndexFromString(); //字母列转换为数字列 如:AA变为27
		$sheets = [];
		for ($currentRow = 1; $currentRow <= $allRow; $currentRow++) {
			$column_value = [];
			for ($currentColumn = 0; $currentColumn < $allColumn; $currentColumn++) {
				$column_value[] = $currentSheet->getCellByColumnAndRow($currentColumn, $currentRow)->getValue();
			}
			$sheets[] = $column_value;
//     $trailtime = date("Y-m-d H:i:s", PHPExcel_Shared_Date::ExcelToPHP($trailtime) - 28800); //时间的转换
		}
		return $sheets;
	}

	/**
	 * @param $datas
	 * @param $template
	 * @param $file
	 * @throws Exception
	 */
	public function renderExcel($datas, $file)
	{
		/**
		 * @var $templateObj BasicTemplate|UserExcelTemplate
		 */
		$templateObj = \Yii::createObject($this->exportTemplate);
		$columnNumber = count($templateObj->getBody());
		$excel = new PHPExcel();
		$sheet = $excel->getActiveSheet();
		$sheet->setTitle($file);
		if (!empty($templateObj->getTitle())) {
			//设置表标题
			$columnString = PHPExcel_Cell::stringFromColumnIndex($columnNumber - 1);
			//合并单元格
			$sheet->mergeCells('A1:' . $columnString . '1');
			//设置标题文字
			$sheet->setCellValue('A1', $templateObj->getTableTitle() ?: $file);
			//设置字体、大小、加粗和斜体
			$this->setExcelFontStyle($sheet, 'A1', $templateObj->getTitle());
			//设置居中
			$sheet->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER)->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
			//设置填充色
			$this->setExcelFillColor($sheet, 'A1', $templateObj->getTitle('bgColor'));
			//设置边框颜色
			$this->setExcelBorderColor($sheet, 'A1', $templateObj->getTitle('borderColor'));
			//表头偏移
			$offset = 2;
		} else {
			//表头偏移
			$offset = 1;
		}

		//设置表头
		foreach ($templateObj->getHead() as $index => $head) {
			$currentColumnString = PHPExcel_Cell::stringFromColumnIndex($index);
			$sheet->getColumnDimension($currentColumnString)->setWidth(Hash::get($head, 'width') ?: 12);
			$sheet->setCellValue($currentColumnString . $offset, $head['content']);
			$verticalAlign = Hash::get($head, 'verticalAlign');
			if (!in_array($verticalAlign, $this->verticalAligns)) {
				$verticalAlign = PHPExcel_Style_Alignment::VERTICAL_BOTTOM;
			}
			$horizontalAlign = Hash::get($head, 'horizontalAlign');
			if (!in_array($horizontalAlign, $this->horizontalAlign)) {
				$horizontalAlign = PHPExcel_Style_Alignment::HORIZONTAL_LEFT;
			}
			$sheet->getStyle($currentColumnString . $offset)->getAlignment()->setVertical($verticalAlign)->setHorizontal($horizontalAlign);
			$this->setExcelFontStyle($sheet, $currentColumnString . $offset, $head);
			$this->setExcelFillColor($sheet, $currentColumnString . $offset, Hash::get($head, 'bgColor'));
			$this->setExcelBorderColor($sheet, $currentColumnString . $offset, Hash::get($head, 'borderColor'));
		}

		//设置行高
		$sheet->getDefaultRowDimension()->setRowHeight(20);
		foreach ($datas as $index => $data) {
			foreach ($templateObj->getBody() as $tindex => $tbody) {
				$currentColumnString = PHPExcel_Cell::stringFromColumnIndex($tindex);
				$currentColumn = $currentColumnString . ($index + $offset + 1);
				$sheet->setCellValue($currentColumn, Hash::get($data, $tbody['content']) ?: '');
				$verticalAlign = Hash::get($tbody, 'verticalAlign');
				if (!in_array($verticalAlign, $this->verticalAligns)) {
					$verticalAlign = PHPExcel_Style_Alignment::VERTICAL_BOTTOM;
				}
				$horizontalAlign = Hash::get($tbody, 'horizontalAlign');
				if (!in_array($horizontalAlign, $this->horizontalAlign)) {
					$horizontalAlign = PHPExcel_Style_Alignment::HORIZONTAL_LEFT;
				}
				$sheet->getStyle($currentColumn)->getAlignment()->setVertical($verticalAlign)->setHorizontal($horizontalAlign);
				$this->setExcelBorderColor($sheet, $currentColumn, Hash::get($tbody, 'borderColor'));
				$this->setExcelFillColor($sheet, $currentColumn, Hash::get($tbody, 'bgColor'));
				$this->setExcelFontStyle($sheet, $currentColumn, $tbody);
			}
		}
		$obContents = ob_get_contents();
		if ($obContents) {
			$this->log($obContents);
			throw new Exception($obContents);
		}
		ob_start();
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="' . $file . '.xlsx"');
		header('Cache-Control: max-age=0');
		$objWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
		$objWriter->save('php://output');
	}

	/**
	 * @param PHPExcel_Worksheet $objActSheet
	 * @param $cell
	 * @param $color
	 * @throws PHPExcel_Exception
	 */
	private function setExcelBorderColor(PHPExcel_Worksheet &$objActSheet, $cell, $color)
	{
		$color = $color ?: PHPExcel_Style_Color::COLOR_BLACK;
		$objActSheet->getStyle($cell)->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyle($cell)->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyle($cell)->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyle($cell)->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN)->getColor()->setARGB($color);
	}

	/**
	 * @param PHPExcel_Worksheet $worksheet
	 * @param $cell
	 * @param array $style
	 * @throws PHPExcel_Exception
	 */
	private function setExcelFontStyle(PHPExcel_Worksheet &$worksheet, $cell, Array $style)
	{
		$worksheet->getStyle($cell)->getFont()->setSize(@$style['fontSize'])->setName(@$style['fontName'])->setItalic(@$style['fontItalic'])->setBold(@$style['fontBold'])->getColor()->setARGB(@$style['fontColor']);
	}

	/**
	 * @param PHPExcel_Worksheet $worksheet
	 * @param $cell
	 * @param $color
	 * @throws PHPExcel_Exception
	 */
	private function setExcelFillColor(PHPExcel_Worksheet &$worksheet, $cell, $color)
	{
		$worksheet->getStyle($cell)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setARGB(@$color ?: PHPExcel_Style_Color::COLOR_WHITE);
	}
}