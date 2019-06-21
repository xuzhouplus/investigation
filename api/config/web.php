<?php
$config = [
	'homeUrl' => Yii::getAlias('@apiUrl'),
	'controllerNamespace' => 'api\controllers',
	'defaultRoute' => 'site/index',
	'bootstrap' => ['maintenance'],
	'modules' => [
		'v1' => \api\modules\v1\Module::class
	],
	'components' => [
		'errorHandler' => [
			'errorAction' => 'site/error'
		],
		'maintenance' => [
			'class' => common\components\maintenance\Maintenance::class,
			'enabled' => function ($app) {
				if (env('APP_MAINTENANCE') === '1') {
					return true;
				}
				return false;
			}
		],
		'request' => [
			'enableCookieValidation' => false,
		],
		'user' => [
			'class' => yii\web\User::class,
			'identityClass' => common\models\User::class,
			'enableSession' => false,
			'loginUrl' => null,
			'enableAutoLogin' => false,
			'as afterLogin' => common\behaviors\LoginTimestampBehavior::class
		]
	]
];

return $config;
