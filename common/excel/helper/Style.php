<?php


namespace common\excel\helper;

/**
 * Class Style
 * @package common\excel\helper
 * fontSize 字体大小，int，如“10”
 * fontColor 字体颜色，string，argb，如“FFFFFF00”
 * fontBold 字体是否加粗，bool，true加粗，false不加粗，如“true”
 * fontItalic 字体是否斜体，bool，true斜体，false正常，如“true”
 * bgColor 背景填充色，string，argb，如“FFFFFF00”
 * width 单元格宽度，只对head有用，int，默认12，如“24”
 * borderColor 单元格边框颜色，string，argb，默认“black”，如“FFFFFFFFF”
 */
class Style
{
	private $fontName;
	private $fontSize;
	private $fontBold;
	private $fontColor;
	private $fontItalic;
	private $bgColor;
	private $borderColor;
	private $width;
	private $height;

	public function __construct($settings)
	{
		foreach ($settings as $key => $value) {
			if (property_exists($this, $key)) {
				$this->$key = $value;
			}
		}
	}

	/**
	 * @return mixed
	 */
	public function getFontName()
	{
		return $this->fontName;
	}

	/**
	 * @param mixed $fontName
	 * @return Style
	 */
	public function setFontName($fontName)
	{
		$this->fontName = $fontName;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getFontSize()
	{
		return $this->fontSize;
	}

	/**
	 * @param mixed $fontSize
	 * @return Style
	 */
	public function setFontSize($fontSize)
	{
		$this->fontSize = $fontSize;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getFontBold()
	{
		return $this->fontBold;
	}

	/**
	 * @param mixed $fontBold
	 * @return Style
	 */
	public function setFontBold($fontBold)
	{
		$this->fontBold = $fontBold;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getFontColor()
	{
		return $this->fontColor;
	}

	/**
	 * @param mixed $fontColor
	 * @return Style
	 */
	public function setFontColor($fontColor)
	{
		$this->fontColor = $fontColor;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getFontItalic()
	{
		return $this->fontItalic;
	}

	/**
	 * @param mixed $fontItalic
	 * @return Style
	 */
	public function setFontItalic($fontItalic)
	{
		$this->fontItalic = $fontItalic;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getBgColor()
	{
		return $this->bgColor;
	}

	/**
	 * @param mixed $bgColor
	 * @return Style
	 */
	public function setBgColor($bgColor)
	{
		$this->bgColor = $bgColor;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getBorderColor()
	{
		return $this->borderColor;
	}

	/**
	 * @param mixed $borderColor
	 * @return Style
	 */
	public function setBorderColor($borderColor)
	{
		$this->borderColor = $borderColor;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getWidth()
	{
		return $this->width;
	}

	/**
	 * @param mixed $width
	 * @return Style
	 */
	public function setWidth($width)
	{
		$this->width = $width;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getHeight()
	{
		return $this->height;
	}

	/**
	 * @param mixed $height
	 * @return Style
	 */
	public function setHeight($height)
	{
		$this->height = $height;
		return $this;
	}
}