<?php


namespace api\modules\v1\models;

use common\models\File;
use common\models\Incarnation as CommonIncarnation;
use yii\helpers\ArrayHelper;

class Incarnation extends CommonIncarnation
{
	public static function create($data)
	{
		$file = new File();
		$file->upload('file');
		$incarnation = new Incarnation();
		$incarnation->setScenario('create');
		$incarnation->load($data, '');
		$incarnation->file_id = $file->id;
		if ($incarnation->validate()) {
			if ($incarnation->save()) {
				return $incarnation;
			}
			throw new \Exception('保存失败');
		}
		$errors = $incarnation->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	public static function modify($data)
	{
		/**
		 * @var $incarnation Incarnation
		 */
		$incarnation = self::find()->joinWith(['file'])->where([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')])->one();
		$incarnation->setScenario('update');
		$incarnation->load($data, '');
		$file = new File();
		if ($file->upload('file')) {
			$incarnation->file_id = $file->id;
			$incarnation->file->deleteFile();
		}
		if ($incarnation->validate()) {
			if ($incarnation->save()) {
				return $incarnation;
			}
			throw new \Exception('保存失败');
		}
		$errors = $incarnation->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	public static function remove($data)
	{
		/**
		 * @var $incarnation Incarnation
		 */
		$incarnation = self::find()->joinWith(['file'])->where([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')])->one();
		return $incarnation->file->deleteFile() && $incarnation->delete();
	}
}