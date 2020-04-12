<?php
$config = [
	'name' => 'Yii2 Starter Kit',
	'vendorPath' => __DIR__ . '/../../vendor',
	'extensions' => require(__DIR__ . '/../../vendor/yiisoft/extensions.php'),
	'timeZone' => 'Asia/Shanghai',
	'language' => 'zh-CN',
	'bootstrap' => ['log'],
	'aliases' => [
		'@bower' => '@vendor/bower-asset',
		'@npm' => '@vendor/npm-asset',
	],
	'components' => [
		'authManager' => [
			'class' => yii\rbac\DbManager::class,
			'itemTable' => '{{%rbac_auth_item}}',
			'itemChildTable' => '{{%rbac_auth_item_child}}',
			'assignmentTable' => '{{%rbac_auth_assignment}}',
			'ruleTable' => '{{%rbac_auth_rule}}'
		],

		'cache' => [
			'class' => 'yii\redis\Cache',
			'keyPrefix' => 'INV_CACHE:',
		],

		'redis' => [
			'class' => 'yii\redis\Connection',
			'hostname' => env('REDIS_HOST'),
			'port' => env('REDIS_PORT', 6379),
			'database' => env('REDIS_DATABASE', 0),
			'password' => env('REDIS_PASSWORD', null) ?: null,
		],

		'commandBus' => [
			'class' => trntv\bus\CommandBus::class,
			'middlewares' => [
				[
					'class' => trntv\bus\middlewares\BackgroundCommandMiddleware::class,
					'backgroundHandlerPath' => '@console/yii',
					'backgroundHandlerRoute' => 'command-bus/handle',
				]
			]
		],

		'formatter' => [
			'class' => yii\i18n\Formatter::class
		],

		'glide' => [
			'class' => trntv\glide\components\Glide::class,
			'sourcePath' => '@storage/web/source',
			'cachePath' => '@storage/cache',
			'urlManager' => 'urlManagerStorage',
			'maxImageSize' => env('GLIDE_MAX_IMAGE_SIZE'),
			'signKey' => env('GLIDE_SIGN_KEY')
		],

		'mailer' => [
			'class' => yii\swiftmailer\Mailer::class,
			'transport' => [
				'class' => 'Swift_SmtpTransport',
				'host' => env('SMTP_HOST'),
				'username' => env('SMTP_ACCOUNT'),
				'password' => env('SMTP_PASSWORD'),
				'port' => env('SMTP_PORT'),
				'encryption' => env('SMTP_ENCRYPTION'),
			],
			'messageConfig' => [
				'charset' => 'UTF-8',
				'from' => env('ADMIN_EMAIL')
			]
		],

		'db' => [
			'class' => yii\db\Connection::class,
			'dsn' => env('DB_DSN'),
			'username' => env('DB_USERNAME'),
			'password' => env('DB_PASSWORD'),
			'tablePrefix' => env('DB_TABLE_PREFIX'),
			'charset' => env('DB_CHARSET', 'utf8'),
			'enableSchemaCache' => YII_ENV_PROD,
		],

		'log' => [
			'traceLevel' => YII_DEBUG ? 3 : 0,
			'targets' => [
				'db' => [
					'enabled' => false,
					'class' => 'yii\log\DbTarget',
					'levels' => ['error', 'warning'],
					'except' => ['yii\web\HttpException:*', 'yii\i18n\I18N\*'],
					'prefix' => function () {
						$url = !Yii::$app->request->isConsoleRequest ? Yii::$app->request->getUrl() : null;
						return sprintf('[%s][%s]', Yii::$app->id, $url);
					},
					'logVars' => [],
					'logTable' => '{{%system_log}}',
					'exportInterval' => 1,
				],
				'file' => [
					'class' => 'yii\log\FileTarget',
					'levels' => ['error', 'warning'],
					'except' => ['yii\web\HttpException:*', 'yii\i18n\I18N\*'],
					'prefix' => function () {
						$url = !Yii::$app->request->isConsoleRequest ? Yii::$app->request->getUrl() : null;
						return sprintf('[%s][%s]', Yii::$app->id, $url);
					},
					'logFile' => env('LOG_FILE'),
				]
			]
		],

		'i18n' => [
			'translations' => [
				'*' => [
					'class' => yii\i18n\PhpMessageSource::class,
					'basePath' => '@common/messages',
					'fileMap' => [
						'common' => 'common.php',
						'backend' => 'backend.php',
						'frontend' => 'frontend.php',
					],
					'on missingTranslation' => [backend\modules\translation\Module::class, 'missingTranslation']
				],
				/* Uncomment this code to use DbMessageSource
				 '*'=> [
					'class' => yii\i18n\DbMessageSource::class,
					'sourceMessageTable'=>'{{%i18n_source_message}}',
					'messageTable'=>'{{%i18n_message}}',
					'enableCaching' => YII_ENV_DEV,
					'cachingDuration' => 3600,
					'on missingTranslation' => [backend\modules\translation\Module::class, 'missingTranslation']
				],
				*/
			],
		],

		'fileStorage' => [
			'class' => trntv\filekit\Storage::class,
			'baseUrl' => env('PREVIEW_URL'),
			'filesystem' => [
				'class' => common\components\filesystem\LocalFlysystemBuilder::class,
				'path' => env('UPLOAD_PATH'),
			]
		],
		'urlManagerBackend' => \yii\helpers\ArrayHelper::merge(
			[
				'hostInfo' => env('BACKEND_HOST_INFO'),
				'baseUrl' => env('BACKEND_BASE_URL'),
			],
			require(Yii::getAlias('@backend/config/_urlManager.php'))
		),
		'urlManagerFrontend' => \yii\helpers\ArrayHelper::merge(
			[
				'hostInfo' => env('FRONTEND_HOST_INFO'),
				'baseUrl' => env('FRONTEND_BASE_URL'),
			],
			require(Yii::getAlias('@frontend/config/_urlManager.php'))
		),
		'urlManagerStorage' => \yii\helpers\ArrayHelper::merge(
			[
				'hostInfo' => env('STORAGE_HOST_INFO'),
				'baseUrl' => env('STORAGE_BASE_URL'),
			],
			require(Yii::getAlias('@storage/config/_urlManager.php'))
		),

		'queue' => [
			'class' => \yii\queue\file\Queue::class,
			'path' => '@common/runtime/queue',
		],
		'userExport' => [
			'class' => \common\components\excel\UserExport::class,
			'exportTemplate' => \common\excel\templates\UserTemplate::class
		],
		'divideExport' => [
			'class' => \common\components\excel\DivideExport::class,
			'exportTemplate' => \common\excel\templates\DivideTemplate::class
		]
	],
	'params' => [
		'adminEmail' => env('ADMIN_EMAIL'),
		'robotEmail' => env('ROBOT_EMAIL'),
		'availableLocales' => [
			'en-US' => 'English (US)',
			'ru-RU' => 'Русский (РФ)',
			'uk-UA' => 'Українська (Україна)',
			'es' => 'Español',
			'fr' => 'Français',
			'vi' => 'Tiếng Việt',
			'zh-CN' => '简体中文',
			'pl-PL' => 'Polski (PL)',
		],
		'frontendBaseUrl' => env('FRONTEND_BASE_URL'),
		'backendBaseUrl' => env('BACKEND_BASE_URL'),
		'swoolePort' => env('SWOOLE_PORT'),
		'egoAlgorithm' => env('EGO_ALGORITHM'),
		'accessPath' => env('UPLOAD_PATH'),
		'accessUrl' => env('PREVIEW_URL'),
		'previewUrl'=>env('PREVIEW_URL'),
		'uploadPath'=>env('UPLOAD_PATH'),
	],
];

if (YII_ENV_DEV) {
	$config['bootstrap'][] = 'gii';
	$config['modules']['gii'] = [
		'class' => yii\gii\Module::class
	];

//	$config['components']['cache'] = [
//		'class' => yii\caching\DummyCache::class
//	];
	$config['components']['log']['targets']['db']['enabled'] = false;
	$config['components']['log']['targets']['file']['enabled'] = true;
	$config['components']['log']['targets']['file']['levels'][] = 'trace';
}

return $config;
