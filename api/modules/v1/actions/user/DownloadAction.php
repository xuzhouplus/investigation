<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use Yii;
use yii\helpers\ArrayHelper;
use yii\rest\Action;

/**
 * Class DownloadAction
 * @package api\modules\v1\actions\user
 * @property User $modelClass
 */
class DownloadAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			$tmpFile = Yii::getAlias('@webroot') . DIRECTORY_SEPARATOR . 'userUpload';
			if (!file_exists($tmpFile)) {
				throw new \Exception('tmp文件不存在');
			}
			$path = file_get_contents($tmpFile);
			$path = ArrayHelper::getValue(Yii::$app->params, 'uploadPath') . $path;
			if (file_exists($path)) {
				Yii::$app->response->sendFile($path);
				return Yii::$app->response;
			}
			throw new \Exception('上传文件不存在');
		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => ''
			];
		}
	}
}