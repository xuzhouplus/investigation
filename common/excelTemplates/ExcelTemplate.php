<?php


namespace common\components\excelTemplate;


abstract class ExcelTemplate
{
	private $tableTitle;
	private $sheetTitle;
	private $title = [];
	private $head = [];
	private $body = [];

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
		return $this->getTitle('content');
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
	public function getTitle($key = null)
	{
		if (is_null($key)) {
			return $this->title;
		}
		return $this->title[$key];
	}

	/**
	 * @param array $title
	 */
	public function setTitle($title)
	{
		$this->title = $title;
	}

	/**
	 * @param null $key
	 * @return array|mixed
	 */
	public function getHead($key = null)
	{
		if (is_null($key)) {
			return $this->head;
		}
		return $this->head[$key];
	}

	/**
	 * @param array $head
	 */
	public function setHead($head)
	{
		$this->head = $head;
	}

	/**
	 * @param null $key
	 * @return array|mixed
	 */
	public function getBody($key = null)
	{
		if (is_null($key)) {
			return $this->body;
		}
		return $this->body[$key];
	}

	/**
	 * @param array $body
	 */
	public function setBody($body)
	{
		$this->body = $body;
	}

	abstract public function run();
}