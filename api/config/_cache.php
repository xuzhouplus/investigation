<?php
/**
 * @author Eugene Terentev <eugene@terentev.net>
 */

$cache = [
	'class' => 'yii\redis\Cache',
	'redis' => 'redis',
	'keyPrefix' => 'INV_CACHE:',
];

if (YII_ENV_DEV) {
//	$cache = [
//		'class' => yii\caching\DummyCache::class
//	];
}

return $cache;
