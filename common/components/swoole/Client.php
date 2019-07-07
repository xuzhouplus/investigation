<?php


namespace common\components\swoole;


use yii\helpers\ArrayHelper;
use Swoole\Client as SwooleClient;

class Client
{
	/**
	 * @param $requestData
	 * @throws \Exception
	 */
	public static function request($requestData)
	{
		if (!is_string($requestData)) {
			$requestData = json_encode($requestData);
		}
		$swooleClient = new SwooleClient(SWOOLE_SOCK_TCP);
		$swooleClient->connect('127.0.0.1', ArrayHelper::getValue(\Yii::$app->params, 'swoolePort') ?: 2046, 10);
		$swooleClient->send($requestData);
		$receive = $swooleClient->recv();
		$swooleClient->close();
		if ($receive != 'success') {
			throw new \Exception('发送异步任务失败:' . $receive);
		}
	}

	/**
	 * redis加锁
	 * @return array
	 */
	public static function lock()
	{
		$lockKey = 'lock_key';
		$randValue = rand(10000, 99999);
		$lock = \Yii::$app->redis->set($lockKey, $randValue, ['NX', 'EX' => 1]);
		if ($lock) {
			return compact('lockKey', 'randValue');
		}
		return [];
	}

	/**
	 * redis解锁
	 * @param $lockKey
	 * @param $randValue
	 */
	public static function unlock($lockKey, $randValue = null)
	{
		if (is_array($lockKey)) {
			$lockKey = ArrayHelper::getValue($lockKey, 'lockKey');
			$randValue = ArrayHelper::getValue($lockKey, 'randValue');
		}
		//unlock
		if (function_exists('shell_exec')) {
			$script = 'if redis.call("get",KEYS[1]) == ARGV[1] then
                              return redis.call("del",KEYS[1])
                           else
                              return 0
                           end
                           ';
			\Yii::$app->redis->eval($script, [$lockKey, $randValue], 1);
		} else {
			if (\Yii::$app->redis->get($lockKey) == $randValue) {
				\Yii::$app->redis->del($lockKey);
			}
		}
	}
}