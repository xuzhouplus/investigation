<?php
/**
 * Created by PhpStorm.
 * User: xuzhou
 * Date: 2018/1/16
 * Time: 17:24
 */

namespace common\components\curl;
use Yii;

class Curl
{
	public static function takeCurl($type, $url, $data = array())
	{
		try {
			$result = self::curlExec($type, $url, $data);
		} catch (\Exception $e) {
			\Yii::error($e->__toString());
			return false;
		}
		return $result;
	}

	/**
	 * @param $type
	 * @param $uri
	 * @param $data
	 * @return mixed
	 * @throws \Exception
	 */
	private static function curlExec($type, $uri, $data)
	{
		$ch = curl_init();
		$timeout = 60;
		if (is_array($data)) {
			$postData = http_build_query($data);
		} else {
			$postData = $data;
		}
		if (strtoupper($type) == "POST") {
			curl_setopt($ch, CURLOPT_URL, $uri);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
		} elseif (strtoupper($type) == "GET") {
			curl_setopt($ch, CURLOPT_URL, $uri . '?' . $postData);
		}
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
		$output = curl_exec($ch);
		$curlError = curl_error($ch);
		if ($curlError) {
			throw new \Exception($curlError);
		};
		curl_close($ch);
		Yii::debug(compact('uri', 'data', 'output'));
		return $output;
	}
}