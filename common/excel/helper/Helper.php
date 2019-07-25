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
	 * @param $columnBegin
	 * @param $rowBegin
	 * @param $columnEnd
	 * @param $rowEnd
	 * @param $style
	 */
	public static function setRangeStyle(Worksheet &$objActSheet, $columnBegin, $rowBegin, $columnEnd, $rowEnd, $style)
	{
		$styleArray = [
			'font' => [
				'size' => ArrayHelper::getValue($style, 'fontSize'),
				'name' => ArrayHelper::getValue($style, 'fontName'),
				'italic' => ArrayHelper::getValue($style, 'fontItalic'),
				'bold' => ArrayHelper::getValue($style, 'fontBold'),
				'color' => [
					'argb' => ArrayHelper::getValue($style, 'fontColor')
				]
			],
			'alignment' => [
				'vertical' => ArrayHelper::getValue($style, 'verticalAlign'),
				'horizontal' => ArrayHelper::getValue($style, 'horizontalAlign')
			],
			'borders' => [
				'allBorders' => [
					'borderStyle' => Border::BORDER_THIN,
					'color' => ['argb' => ArrayHelper::getValue($style, 'borderColor')],
				],
			],
			'fill' => [
				'fillType' => Fill::FILL_SOLID,
				'startColor' => [
					'argb' => ArrayHelper::getValue($style, 'bgColor'),
				]
			],
		];
		$objActSheet->getStyleByColumnAndRow($columnBegin, $rowBegin, $columnEnd, $rowEnd)->applyFromArray($styleArray);
	}

	/**
	 * @param Worksheet $objActSheet
	 * @param $column
	 * @param $row
	 * @param $style
	 */
	public static function setCellStyle(Worksheet &$objActSheet, $column, $row, $style)
	{
		$styleArray = [
			'font' => [
				'size' => ArrayHelper::getValue($style, 'fontSize'),
				'name' => ArrayHelper::getValue($style, 'fontName'),
				'italic' => ArrayHelper::getValue($style, 'fontItalic'),
				'bold' => ArrayHelper::getValue($style, 'fontBold'),
				'color' => [
					'argb' => ArrayHelper::getValue($style, 'fontColor')
				]
			],
			'alignment' => [
				'vertical' => ArrayHelper::getValue($style, 'verticalAlign'),
				'horizontal' => ArrayHelper::getValue($style, 'horizontalAlign')
			],
			'borders' => [
				'allBorders' => [
					'borderStyle' => Border::BORDER_THIN,
					'color' => ['argb' => ArrayHelper::getValue($style, 'borderColor')],
				],
			],
			'fill' => [
				'fillType' => Fill::FILL_SOLID,
				'startColor' => [
					'argb' => ArrayHelper::getValue($style, 'bgColor'),
				]
			],
		];
		$objActSheet->getStyleByColumnAndRow($column, $row)->applyFromArray($styleArray);
	}

	/**
	 * @param Worksheet $objActSheet
	 * @param $columnBegin
	 * @param $rowBegin
	 * @param $columnEnd
	 * @param $rowEnd
	 * @param $color
	 */
	public static function setRangeBorderColor(Worksheet &$objActSheet, $columnBegin, $rowBegin, $columnEnd, $rowEnd, $color)
	{
		$color = $color ?: Color::COLOR_BLACK;
		$styleArray = [
			'borders' => [
				'allBorders' => [
					'borderStyle' => Border::BORDER_THIN,
					'color' => ['argb' => $color],
				],
			],
		];
		$objActSheet->getStyleByColumnAndRow($columnBegin, $rowBegin, $columnEnd, $rowEnd)->applyFromArray($styleArray);
	}

	/**
	 * @param Worksheet $objActSheet
	 * @param $column
	 * @param $row
	 * @param $color
	 */
	public static function setCellBorderColor(Worksheet &$objActSheet, $column, $row, $color)
	{
		$color = $color ?: Color::COLOR_BLACK;
		$objActSheet->getStyleByColumnAndRow($column, $row)->getBorders()->getBottom()->setBorderStyle(Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyleByColumnAndRow($column, $row)->getBorders()->getTop()->setBorderStyle(Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyleByColumnAndRow($column, $row)->getBorders()->getLeft()->setBorderStyle(Border::BORDER_THIN)->getColor()->setARGB($color);
		$objActSheet->getStyleByColumnAndRow($column, $row)->getBorders()->getRight()->setBorderStyle(Border::BORDER_THIN)->getColor()->setARGB($color);
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $columnBegin
	 * @param $rowBegin
	 * @param $columnEnd
	 * @param $rowEnd
	 * @param array $style
	 */
	public static function setRangeFontStyle(Worksheet &$worksheet, $columnBegin, $rowBegin, $columnEnd, $rowEnd, Array $style)
	{
		$worksheet->getStyleByColumnAndRow($columnBegin, $rowBegin, $columnEnd, $rowEnd)->getFont()->setSize(ArrayHelper::getValue($style, 'fontSize'))->setName(ArrayHelper::getValue($style, 'fontName'))->setItalic(ArrayHelper::getValue($style, 'fontItalic'))->setBold(ArrayHelper::getValue($style, 'fontBold'))->getColor()->setARGB(ArrayHelper::getValue($style, 'fontColor'));
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $column
	 * @param $row
	 * @param array $style
	 */
	public static function setCellFontStyle(Worksheet &$worksheet, $column, $row, Array $style)
	{
		$worksheet->getStyleByColumnAndRow($column, $row)->getFont()->setSize(ArrayHelper::getValue($style, 'fontSize'))->setName(ArrayHelper::getValue($style, 'fontName'))->setItalic(ArrayHelper::getValue($style, 'fontItalic'))->setBold(ArrayHelper::getValue($style, 'fontBold'))->getColor()->setARGB(ArrayHelper::getValue($style, 'fontColor'));
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $columnBegin
	 * @param $rowBegin
	 * @param $columnEnd
	 * @param $rowEnd
	 * @param null $color
	 */
	public static function setRangeFillColor(Worksheet &$worksheet, $columnBegin, $rowBegin, $columnEnd, $rowEnd, $color = null)
	{
		$worksheet->getStyleByColumnAndRow($columnBegin, $rowBegin, $columnEnd, $rowEnd)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB($color ?: Color::COLOR_WHITE);
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $column
	 * @param $row
	 * @param $color
	 */
	public static function setCellFillColor(Worksheet &$worksheet, $column, $row, $color = null)
	{
		$worksheet->getStyleByColumnAndRow($column, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB($color ?: Color::COLOR_WHITE);
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $columnBegin
	 * @param $rowBegin
	 * @param $columnEnd
	 * @param $rowEnd
	 * @param string $vertical
	 * @param string $horizontal
	 */
	public static function setRangeAlignment(Worksheet &$worksheet, $columnBegin, $rowBegin, $columnEnd, $rowEnd, $vertical = Alignment::VERTICAL_CENTER, $horizontal = Alignment::HORIZONTAL_CENTER)
	{
		if (!in_array($vertical, static::$verticalAligns)) {
			$vertical = Alignment::VERTICAL_BOTTOM;
		}
		if (!in_array($horizontal, static::$horizontalAlign)) {
			$horizontal = Alignment::HORIZONTAL_LEFT;
		}
		$worksheet->getStyleByColumnAndRow($columnBegin, $rowBegin, $columnEnd, $rowEnd)->getAlignment()->setVertical($vertical)->setHorizontal($horizontal);
	}

	/**
	 * @param Worksheet $worksheet
	 * @param $column
	 * @param $row
	 * @param string $vertical
	 * @param string $horizontal
	 */
	public static function setCellAlignment(Worksheet &$worksheet, $column, $row, $vertical = Alignment::VERTICAL_CENTER, $horizontal = Alignment::HORIZONTAL_CENTER)
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