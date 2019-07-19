<?php


namespace common\excel\helper;


use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Color;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use yii\helpers\ArrayHelper;

class Helper
{
	public static $verticalAligns = ['top', 'middle', 'bottom'];
	public static $horizontalAlign = ['left', 'center', 'right'];

	/**
	 * @param Worksheet $objActSheet
	 * @param $column
	 * @param $row
	 * @param $color
	 */
	public static function setExcelBorderColor(Worksheet &$objActSheet, $column, $row, $color)
	{
		$color = $color ?: Color::COLOR_BLACK;
		$objActSheet->getStyleByColumnAndRow($column, $row)->getBorders()->getBottom()->setBorderStyle(Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyleByColumnAndRow($column, $row)->getBorders()->getTop()->setBorderStyle(Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyleByColumnAndRow($column, $row)->getBorders()->getLeft()->setBorderStyle(Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyleByColumnAndRow($column, $row)->getBorders()->getRight()->setBorderStyle(Border::BORDER_THIN)->getColor()->setARGB($color);
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $column
	 * @param $row
	 * @param array $style
	 */
	public static function setExcelFontStyle(Worksheet &$worksheet, $column, $row, Array $style)
	{
		$worksheet->getStyleByColumnAndRow($column, $row)->getFont()->setSize(ArrayHelper::getValue($style, 'fontSize'))->setName(ArrayHelper::getValue($style, 'fontName'))->setItalic(ArrayHelper::getValue($style, 'fontItalic'))->setBold(ArrayHelper::getValue($style, 'fontBold'))->getColor()->setARGB(ArrayHelper::getValue($style, 'fontColor'));
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $column
	 * @param $row
	 * @param $color
	 */
	public static function setExcelFillColor(Worksheet &$worksheet, $column, $row, $color = null)
	{
		$worksheet->getStyleByColumnAndRow($column, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB($color ?: Color::COLOR_WHITE);
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $column
	 * @param $row
	 * @param string $vertical
	 * @param string $horizontal
	 */
	public static function setExcelAlignment(Worksheet &$worksheet, $column, $row, $vertical = Alignment::VERTICAL_CENTER, $horizontal = Alignment::HORIZONTAL_CENTER)
	{
		if (!in_array($vertical, static::$verticalAligns)) {
			$vertical = Alignment::VERTICAL_BOTTOM;
		}
		if (!in_array($horizontal, static::$horizontalAlign)) {
			$horizontal = Alignment::HORIZONTAL_LEFT;
		}
		$worksheet->getStyleByColumnAndRow($column, $row)->getAlignment()->setVertical($vertical)->setHorizontal($horizontal);
	}
}