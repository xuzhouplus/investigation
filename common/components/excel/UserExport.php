<?php


namespace common\components\excel;


use yii\base\Component;

class UserExport extends Component
{
	public $exportTemplate;
	public $verticalAligns = ['top', 'middle', 'bottom'];
	public $horizontalAlign = ['left', 'center', 'right'];

	/**
	 * @throws \Exception
	 */
	public function init()
	{
		if (!$this->exportTemplate) {
			throw new \Exception('用户导出模板没有配置');
		}
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
}