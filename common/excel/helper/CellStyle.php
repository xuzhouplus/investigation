<?php


namespace common\excel\helper;

/**
 * Class CellStyle
 * @package common\excel\helper
 */
class CellStyle
{
	/**
	 * @var $columnBegin string 列开始
	 */
	private $columnBegin;
	private $columnEnd;
	private $rowBegin;
	private $rowEnd;
	/**
	 * @var $style Style
	 */
	private $style;

	/**
	 * CellStyle constructor.
	 * @param $settings
	 * @throws \Exception
	 */
	public function __construct($settings)
	{
		foreach ($settings as $key => $value) {
			if (property_exists($this, $key)) {
				if ($key == 'style' && !$value instanceof Style) {
					throw new \Exception('style参数不是Style');
				}
				$this->$key = $value;
			}
		}
	}

	/**
	 * @return string
	 */
	public function getColumnBegin(): string
	{
		return $this->columnBegin;
	}

	/**
	 * @param string $columnBegin
	 * @return CellStyle
	 */
	public function setColumnBegin(string $columnBegin): CellStyle
	{
		$this->columnBegin = $columnBegin;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getColumnEnd()
	{
		return $this->columnEnd;
	}

	/**
	 * @param mixed $columnEnd
	 * @return CellStyle
	 */
	public function setColumnEnd($columnEnd)
	{
		$this->columnEnd = $columnEnd;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getRowBegin()
	{
		return $this->rowBegin;
	}

	/**
	 * @param mixed $rowBegin
	 * @return CellStyle
	 */
	public function setRowBegin($rowBegin)
	{
		$this->rowBegin = $rowBegin;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getRowEnd()
	{
		return $this->rowEnd;
	}

	/**
	 * @param mixed $rowEnd
	 * @return CellStyle
	 */
	public function setRowEnd($rowEnd)
	{
		$this->rowEnd = $rowEnd;
		return $this;
	}

	/**
	 * @return Style
	 */
	public function getStyle(): Style
	{
		return $this->style;
	}

	/**
	 * @param Style $style
	 * @return CellStyle
	 */
	public function setStyle(Style $style): CellStyle
	{
		$this->style = $style;
		return $this;
	}


}