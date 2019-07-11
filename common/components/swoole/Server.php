<?php


namespace common\components\swoole;


use Swoole\Server as SwooleServer;
use yii\helpers\ArrayHelper;

/**
 * Class Server
 * @package common\components\swoole
 */
class Server
{
	/**
	 * @var $server SwooleServer
	 */
	public static $server;

	/**
	 * @param $class Callable|string
	 * 实例化或类名，类中必须实现事件方法
	 * onInit 服务初始化完成的时候执行
	 * onStart 服务启动时执行
	 * onWorkerStart 服务worker子进程启动时执行
	 * onReceive 接受到数据时执行
	 * onTask 启动task进程时执行
	 * onFinish task进程执行结束时执行
	 */
	public static function run($class)
	{
		$logFile = ArrayHelper::getValue(\Yii::$app->params, 'LOG_FILE');
		if ($logFile === null) {
			$logFile = \Yii::$app->getRuntimePath() . DIRECTORY_SEPARATOR . 'logs' . DIRECTORY_SEPARATOR . 'swoole.log';
		} else {
			$logFile = str_replace('\\', '/', $logFile);
			$logFile = str_replace('/', DIRECTORY_SEPARATOR, $logFile);
			$explode = explode(DIRECTORY_SEPARATOR, $logFile);
			array_pop($explode);
			array_push($explode, 'swoole.log');
			$logFile = implode(DIRECTORY_SEPARATOR, $explode);
		}
		self::$server = new SwooleServer('0.0.0.0', ArrayHelper::getValue(\Yii::$app->params, 'swoolePort') ?: 2046);
		/**
		 * @link https://wiki.swoole.com/wiki/page/274.html
		 */
		self::$server->set(array(
			'worker_num' => 8,
			'task_worker_num' => 8,
			'daemonize' => YII_ENV_DEV ? 0 : 1,
			'max_request' => 10000,
			'dispatch_mode' => 3,
			'debug_mode' => 1,
			'log_file' => $logFile,
		));

		self::$server->on('start', [$class, 'onStart']);

		self::$server->on('WorkerStart', [$class, 'onWorkerStart']);

		self::$server->on('receive', [$class, 'onReceive']);

		self::$server->on('task', [$class, 'onTask']);

		self::$server->on('finish', [$class, 'onFinish']);

		self::$server->on('Shutdown', [$class, 'onShutdown']);

		self::$server->start();

		call_user_func_array([$class, 'onInit'], ['server' => self::$server]);
	}

	public static function setProcessName($name)
	{
		if (function_exists('cli_set_process_title')) {
			cli_set_process_title($name);
		} else {
			swoole_set_process_name($name);
		}
	}
}