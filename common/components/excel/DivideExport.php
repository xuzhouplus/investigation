<?php


namespace common\components\excel;


use common\excel\helper\Helper;
use common\excel\templates\DivideTemplate;
use common\models\File;
use PhpOffice\PhpSpreadsheet\Cell\Coordinate;
use PhpOffice\PhpSpreadsheet\Exception;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use yii\base\Component;
use yii\helpers\ArrayHelper;
use yii\web\Response;

class DivideExport extends Component
{
	public $exportTemplate;
	public $verticalAligns = ['top', 'middle', 'bottom'];
	public $horizontalAlign = ['left', 'center', 'right'];
	/**
	 * @var $templateObj DivideTemplate
	 */
	private $templateObj;
	/**
	 * @var $spreadsheet Spreadsheet
	 */
	private $spreadsheet;
	/**
	 * @var $sheet Worksheet
	 */
	private $sheet;
	/**
	 * @var $rowOffset int
	 */
	private $rowOffset;
	/**
	 * @var $rows array 要写入excel的数据
	 */
	private $rows;

	/**
	 * @throws \Exception
	 */
	public function init()
	{
		if (!$this->exportTemplate) {
			throw new \Exception('用户导出模板没有配置');
		}
		/**
		 * @var $templateObj DivideTemplate
		 */
		$this->templateObj = \Yii::createObject($this->exportTemplate);
	}

	/**
	 * @throws \PhpOffice\PhpSpreadsheet\Exception
	 */
	public function createExcel()
	{
		$this->spreadsheet = new Spreadsheet();
		$this->sheet = $this->spreadsheet->getActiveSheet();
	}

	//设置表格名
	public function setTitle()
	{
		$this->sheet->setTitle($this->templateObj->getSheetTitle());
	}

	/**
	 * @throws \PhpOffice\PhpSpreadsheet\Exception
	 */
	public function renderTitle()
	{
		//设置表标题
		if (!empty($this->templateObj->getTitleContent())) {
			//合并单元格
			$this->sheet->mergeCellsByColumnAndRow(1, 1, count($this->templateObj->getBodyContent()), 1);
			//设置标题文字
			$this->sheet->setCellValueByColumnAndRow(1, 1, $this->templateObj->getTableTitle());
			//设置字体、大小、加粗和斜体
			Helper::setCellFontStyle($this->sheet, 1, 1, $this->templateObj->getTitleContent());
			//设置居中
			Helper::setCellAlignment($this->sheet, 1, 1);
			//设置填充色
			Helper::setCellFillColor($this->sheet, 1, 1, $this->templateObj->getTitleContent('bgColor'));
			//设置边框颜色
			Helper::setCellBorderColor($this->sheet, 1, 1, $this->templateObj->getTitleContent('borderColor'));
			//表头偏移
			$this->rowOffset = 2;
		} else {
			//表头偏移
			$this->rowOffset = 1;
		}
	}

	public function renderHead()
	{
		//设置表头
		foreach ($this->templateObj->getHeadContent() as $index => $head) {
			$columnIndex = $index + 1;
			$this->sheet->getColumnDimensionByColumn($columnIndex)->setWidth(ArrayHelper::getValue($head, 'width') ?: 12);
			$this->sheet->setCellValueByColumnAndRow($columnIndex, $this->rowOffset, $head['content']);
			Helper::setCellStyle($this->sheet, $columnIndex, $this->rowOffset, $head);
		}
		$this->rowOffset++;
	}

	public function addRow($data)
	{
		//填充数据
		$row = [];
		foreach ($this->templateObj->getBodyContent() as $bodyIndex => $bodyDefinition) {
			$columnIndex = $bodyIndex + 1;
			$cellText = ArrayHelper::getValue($bodyDefinition, 'text');
			if (is_callable($cellText)) {
				$row[] = call_user_func($cellText, $columnIndex, $this->rowOffset);
			} else {
				$row[] = ArrayHelper::getValue($data, ArrayHelper::getValue($bodyDefinition, 'content'));
			}
		}
		$this->rows[] = $row;
		$this->rowOffset++;
	}

	/**
	 * @param int $beginColumn
	 * @param null $beginRow
	 * @param null $nullValue
	 * @throws Exception
	 */
	public function fillRows($beginColumn = 1, $beginRow = null, $nullValue = null)
	{
		if (!empty($this->rows)) {
			if (is_null($beginRow)) {
				$beginRow = 1;
				if ($this->templateObj->getTitleContent()) {
					$beginRow++;
				}
				if ($this->templateObj->getHeadContent()) {
					$beginRow++;
				}
			}
			$this->sheet->fromArray($this->rows, $nullValue, Coordinate::stringFromColumnIndex($beginColumn) . $beginRow);
		}
	}

	public function renderBody($data)
	{
		//填充数据
		foreach ($this->templateObj->getBodyContent() as $bodyIndex => $bodyDefinition) {
			$columnIndex = $bodyIndex + 1;
			$cellText = ArrayHelper::getValue($bodyDefinition, 'text');
			if (is_callable($cellText)) {
				$this->sheet->setCellValueByColumnAndRow($columnIndex, $this->rowOffset, call_user_func($cellText, $columnIndex, $this->rowOffset));
			} else {
				$this->sheet->setCellValueByColumnAndRow($columnIndex, $this->rowOffset, ArrayHelper::getValue($data, ArrayHelper::getValue($bodyDefinition, 'content')));
			}
		}
		$this->rowOffset++;
	}

	public function setBodyStyle()
	{
		$rowOffset = 0;
		if ($this->templateObj->getTitleContent()) {
			$rowOffset++;
		}
		if ($this->templateObj->getHeadContent()) {
			$rowOffset++;
		}
		$rowIndex = $this->rowOffset - 1;
		foreach ($this->templateObj->getBodyStyle() as $bodyIndex => $style) {
			$columnIndex = $bodyIndex + 1;
			Helper::setRangeStyle($this->sheet, $columnIndex, $rowOffset, $columnIndex, $rowIndex, $style);
		}
	}

	/**
	 * @param $file
	 * @throws \PhpOffice\PhpSpreadsheet\Writer\Exception
	 */
	public function save($file)
	{
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

		$writer = IOFactory::createWriter($this->spreadsheet, 'Xlsx');
		$writer->save('php://output');
	}

	/**
	 * @param $file
	 * @throws \PhpOffice\PhpSpreadsheet\Writer\Exception
	 */
	public function file($file)
	{
		$fileDir = dirname($file);
		if (!file_exists($fileDir)) {
			mkdir($fileDir);
		}
		$writer = IOFactory::createWriter($this->spreadsheet, 'Xlsx');
		$writer->save($file);
	}
}