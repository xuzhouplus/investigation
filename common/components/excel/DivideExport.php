<?php


namespace common\components\excel;


use common\excel\helper\Helper;
use common\excel\templates\DivideTemplate;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use yii\base\Component;
use yii\helpers\ArrayHelper;

class DivideExport extends Component
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
	 * @param $data
	 * @param $file
	 * @throws \PhpOffice\PhpSpreadsheet\Exception
	 * @throws \PhpOffice\PhpSpreadsheet\Writer\Exception
	 * @throws \yii\base\InvalidConfigException
	 */
	public function renderExcel($data, $file)
	{
		/**
		 * @var $templateObj DivideTemplate
		 */
		$templateObj = \Yii::createObject($this->exportTemplate);
		$columnNumber = count($templateObj->getBody());
		$spreadsheet = new Spreadsheet();
		$sheet = $spreadsheet->getActiveSheet();

		//设置表格名
		$sheet->setTitle($templateObj->getSheetTitle());

		//设置行高
		$sheet->getDefaultRowDimension()->setRowHeight(20);

		//设置表标题
		if (!empty($templateObj->getTitle())) {
			//合并单元格
			$sheet->mergeCellsByColumnAndRow(1, 1, $columnNumber, 1);
			//设置标题文字
			$sheet->setCellValueByColumnAndRow(1, 1, $templateObj->getTableTitle() ?: $file);
			//设置字体、大小、加粗和斜体
			Helper::setExcelFontStyle($sheet, 1, 1, $templateObj->getTitle());
			//设置居中
			Helper::setExcelAlignment($sheet, 1, 1);
			//设置填充色
			Helper::setExcelFillColor($sheet, 1, 1, $templateObj->getTitle('bgColor'));
			//设置边框颜色
			Helper::setExcelBorderColor($sheet, 1, 1, $templateObj->getTitle('borderColor'));
			//表头偏移
			$rowOffset = 2;
		} else {
			//表头偏移
			$rowOffset = 1;
		}

		//设置表头
		foreach ($templateObj->getHead() as $index => $head) {
			$columnIndex = $index + 1;
			$sheet->getColumnDimensionByColumn($columnIndex)->setWidth(ArrayHelper::getValue($head, 'width') ?: 12);
			$sheet->setCellValueByColumnAndRow($columnIndex, $rowOffset, $head['content']);
			Helper::setExcelAlignment($sheet, $columnIndex, $rowOffset, ArrayHelper::getValue($head, 'verticalAlign'), ArrayHelper::getValue($head, 'horizontalAlign'));
			Helper::setExcelFontStyle($sheet, $columnIndex, $rowOffset, $head);
			Helper::setExcelFillColor($sheet, $columnIndex, $rowOffset, ArrayHelper::getValue($head, 'bgColor'));
			Helper::setExcelBorderColor($sheet, $columnIndex, $rowOffset, ArrayHelper::getValue($head, 'borderColor'));
		}
		$rowOffset++;
		//填充数据
		foreach ($templateObj->getBody() as $bodyIndex => $bodyDefinition) {
			$rowIndex = $rowOffset;
			foreach ($data as $datum) {
				$cellText = ArrayHelper::getValue($bodyDefinition, 'text');
				if (is_callable($cellText)) {
					$sheet->setCellValueByColumnAndRow($bodyIndex, $rowIndex, call_user_func($cellText, $bodyIndex, $rowIndex));
				} else {
					$sheet->setCellValueByColumnAndRow($bodyIndex, $rowIndex, ArrayHelper::getValue($datum, ArrayHelper::getValue($bodyDefinition, 'content')));
				}
				$rowIndex++;
			}
		}
		// Redirect output to a client’s web browser (Xlsx)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment;filename="' . $file . '.xlsx"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');
		// If you're serving to IE over SSL, then the following may be needed
		header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
		header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header('Pragma: public'); // HTTP/1.0

		$writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
		$writer->save('php://output');
		exit;
	}
}