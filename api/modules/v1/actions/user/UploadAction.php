<?php


namespace api\modules\v1\actions\user;


use api\modules\v1\models\User;
use Yii;
use yii\rest\Action;
use yii\web\UploadedFile;

/**
 * Class UploadAction
 * @package api\modules\v1\actions\user
 * @property User $modelClass
 */
class UploadAction extends Action
{
	public function run()
	{
		try {
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			/* @var \yii\web\UploadedFile $uploadedFile */
			$uploadedFile = UploadedFile::getInstanceByName('file');
			if (!$uploadedFile) {
				throw new \Exception('没有上传文件');
			}

			if ($uploadedFile->error === UPLOAD_ERR_OK) {
				$path = \Yii::$app->fileStorage->save($uploadedFile, false, false, [], '');
				if ($path) {
					file_put_contents(Yii::getAlias('@webroot') . DIRECTORY_SEPARATOR . 'userUpload', $path);
					return [
						'code' => 200,
						'message' => '上传成功',
						'data' => $path
					];
				} else {
					throw new \Exception('文件上传失败');
				}
			} else {
				throw new \Exception('上传失败');
			}
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