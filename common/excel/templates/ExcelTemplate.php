<?php


namespace common\excel\templates;


abstract class ExcelTemplate
{
	private $tableTitle;
	private $sheetTitle;
	private $titleContent = [];
	private $titleStyle = [];
	private $headContent = [];
	private $headStyle = [];
	private $bodyContent = [];
	private $bodyStyle = [];

	/**
	 * 模板定义方法
	 */
	public function __construct()
	{
		$this->run();
	}

	/**
	 * @return mixed
	 */
	public function getTableTitle()
	{
		if (!empty($this->tableTitle)) {
			return $this->tableTitle;
		}
		return $this->getTitleContent('content');
	}

	/**
	 * @param mixed $tableTitle
	 */
	public function setTableTitle($tableTitle)
	{
		$this->tableTitle = $tableTitle;
	}

	/**
	 * @return mixed
	 */
	public function getSheetTitle()
	{
		return $this->sheetTitle;
	}

	/**
	 * @param mixed $sheetTitle
	 */
	public function setSheetTitle($sheetTitle)
	{
		$this->sheetTitle = $sheetTitle;
	}

	/**
	 * @param null $key
	 * @return array|mixed
	 */
	public function getTitleContent($key = null)
	{
		if (is_null($key)) {
			return $this->titleContent;
		}
		return $this->titleContent[$key];
	}

	/**
	 * @param array $title
	 */
	public function setTitleContent($title)
	{
		$this->titleContent = $title;
	}

	/**
	 * @param null $key
	 * @return array|mixed
	 */
	public function getHeadContent($key = null)
	{
		if (is_null($key)) {
			return $this->headContent;
		}
		return $this->headContent[$key];
	}

	/**
	 * @param array $head
	 */
	public function setHeadContent($head)
	{
		$this->headContent = $head;
	}

	/**
	 * @param null $key
	 * @return array|mixed
	 */
	public function getBodyContent($key = null)
	{
		if (is_null($key)) {
			return $this->bodyContent;
		}
		return $this->bodyContent[$key];
	}

	/**
	 * @param array $body
	 */
	public function setBodyContent($body)
	{
		$this->bodyContent = $body;
	}

	/**
	 * @return array
	 */
	public function getTitleStyle(): array
	{
		return $this->titleStyle;
	}

	/**
	 * @param array $titleStyle
	 */
	public function setTitleStyle(array $titleStyle): void
	{
		$this->titleStyle = $titleStyle;
	}

	/**
	 * @return array
	 */
	public function getHeadStyle(): array
	{
		return $this->headStyle;
	}

	/**
	 * @param array $headStyle
	 */
	public function setHeadStyle(array $headStyle): void
	{
		$this->headStyle = $headStyle;
	}

	/**
	 * @return array
	 */
	public function getBodyStyle(): array
	{
		return $this->bodyStyle;
	}

	/**
	 * @param array $bodyStyle
	 */
	public function setBodyStyle(array $bodyStyle): void
	{
		$this->bodyStyle = $bodyStyle;
	}

	abstract public function run();
}