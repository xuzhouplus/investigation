<?php


namespace common\models;


use yii\db\ActiveRecord;
use yii\web\UploadedFile;

/**
 * Class File
 * @package common\models
 * @property $id
 * @property $name
 * @property $base_url
 * @property $file_path
 * @property $md5
 * @property $size
 * @property $type
 */
class File extends ActiveRecord
{
	public static function tableName()
	{
		return '{{%file}}';
	}

	public function upload($attribute)
	{
		/* @var \yii\web\UploadedFile $uploadedFile */
		$uploadedFile = UploadedFile::getInstanceByName($attribute);
		if (!$uploadedFile) {
			return null;
		}

		$this->name = $uploadedFile->name;
		$this->base_url = \Yii::$app->fileStorage->baseUrl;
		$this->type = $uploadedFile->type;
		$this->size = $uploadedFile->size;

		if ($uploadedFile->error === UPLOAD_ERR_OK) {
			$path = \Yii::$app->fileStorage->save($uploadedFile, false, false, [], '');
			if ($path) {
				$this->file_path = $path;
				return $this->save();
			} else {
				throw new \Exception('文件上传失败');
			}
		} else {
			throw new \Exception($this->resolveErrorMessage($uploadedFile->error));
		}
	}

	public function deleteFile()
	{
		return \Yii::$app->fileStorage->delete($this->file_path) && $this->delete();
	}

	public function fileUrl()
	{
		return $this->base_url . $this->file_path;
	}
}