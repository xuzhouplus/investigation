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
		\Yii::error($receive);
		if ($receive != 'success') {
			throw new \Exception('发送异步任务失败:' . $receive);
		}
	}
}