<?php


namespace common\components\swoole;


use Yii;
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
	 * @throws \yii\base\Exception
	 */
	public static function lock()
	{
		$lockKey = 'INV_CACHE:LOCK_KEY';
		$randValue = Yii::$app->getSecurity()->generateRandomString(32);
		$lock = \Yii::$app->redis->setnx($lockKey, $randValue);
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
			$randValue = ArrayHelper::getValue($lockKey, 'randValue');
			$lockKey = ArrayHelper::getValue($lockKey, 'lockKey');
		}
		//unlock
		if (\Yii::$app->redis->get($lockKey) == $randValue) {
			\Yii::$app->redis->del($lockKey);
		}
	}
}