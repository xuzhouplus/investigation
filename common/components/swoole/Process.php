<?php


namespace common\components\swoole;

use Yii;
use Swoole\Process as SwooleProcess;
class Process
{
	public $daemon = false;
	public $masterPid = 0;
	public $maxPrecess = 1;
	public $workers = [];

	public function execute()
	{
		try {
			if ($this->daemon) {
				SwooleProcess::daemon();
			}
			$this->setProcessName(sprintf('php-ps:%s', 'master'));
			$this->masterPid = posix_getpid();
			$this->run();
			$this->processWait();
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
		}
	}


	/**
	 * 进程池入口
	 */
	public function run()
	{
		for ($i = 0; $i < $this->maxPrecess; $i++) {
			$this->CreateProcess($i);
		}
	}

	/**
	 * 创建新进程
	 * @param $index
	 * @return int
	 */
	public function CreateProcess($index)
	{
		$process = new \Swoole\Process(function (\Swoole\Process $worker) use ($index) {
			$this->setProcessName(sprintf('php-ps:%s', $index));
			Yii::info($worker->pid . '：开启进程');
			try {
				//外层循环，使kafka出现问题时能重新初始化
				while (true) {
					//检测父进程是否已退出，父进程退出则子进程退出
					$this->checkMasterPid($worker);
					$this->process();
					//一分钟后重新初始化kafka消费者
					sleep(10);
				}
			} catch (Exception $exception) {
				$this->log($worker->pid . '：' . $exception->__toString(), 'kafka');
				$this->printToScreen($worker->pid . '：' . $exception->__toString(), 'error');
				sleep(10);
			}
			$this->log($worker->pid . '：进程结束', 'kafka');
			$this->printToScreen($worker->pid . '：进程结束');
			$worker->exit(0);
		}, false, false);
		$pid = $process->start();
		$this->workers[$index] = $pid;
		return $pid;
	}

	/**
	 * 检测父进程是否已退出
	 * @param \Swoole\Process $worker
	 */
	public function checkMasterPid(\Swoole\Process &$worker)
	{
		if (!Swoole\Process::kill($this->masterPid, 0)) {
			$this->printToScreen($worker->pid . '：父进程已退出，子进程退出');
			$this->log($worker->pid . '：父进程已退出，子进程退出', 'kafka');
			$worker->exit(0);
		}
	}

	/**
	 * 重启进程
	 * @param $ret
	 * @throws Exception
	 */
	public function rebootProcess($ret)
	{
		$index = array_search($ret['pid'], $this->workers);
		if ($index !== false) {
			$newPid = $this->CreateProcess($index);
			$this->log($newPid . '：重启进程', 'kafka');
			$this->printToScreen($newPid . '：重启进程');
		} else {
			throw new \Exception('rebootProcess Error: no pid');
		}
	}

	/**
	 * 处理僵尸进程，并重启进程
	 * @throws Exception
	 */
	public function processWait()
	{
		while (true) {
			if (count($this->workers)) {
				$ret = \Swoole\Process::wait();
				if ($ret) {
					$this->rebootProcess($ret);
				}
			} else {
				break;
			}
		}
	}

	/**
	 * 设置进程名
	 * @param $name
	 */
	public function setProcessName($name)
	{
		if (function_exists('cli_set_process_title')) {
			cli_set_process_title($name);
		} else {
			swoole_set_process_name($name);
		}
	}

	/**
	 * 用户的逻辑
	 */
	public function process(){}
}