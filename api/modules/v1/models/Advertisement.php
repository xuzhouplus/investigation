<?php


namespace api\modules\v1\models;

use common\models\Advertisement as CommonAdvertisement;
use common\models\File;
use Yii;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;

class Advertisement extends CommonAdvertisement
{
	public static function getList($data)
	{
		$query = self::find()->joinWith(['incarnation']);
		$query->andFilterWhere([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')]);
		$query->andFilterWhere([self::tableName() . '.incarnation_id' => ArrayHelper::getValue($data, 'incarnation_id')]);
		$query->andFilterWhere(['like', self::tableName() . '.description', ArrayHelper::getValue($data, 'description')]);
		$dataProvider = Yii::createObject([
			'class' => ActiveDataProvider::class,
			'query' => $query,
			'pagination' => [
				'params' => $data,
			],
			'sort' => [
				'params' => $data,
			],
		]);
		/**
		 * @var $records Advertisement[]
		 */
		$records = $dataProvider->getModels();
		$advertisements = [];
		if ($records) {
			foreach ($records as $record) {
				$advertisements[] = [
					'id' => $record->id,
					'description' => $record->description,
					'incarnation_id' => $record->incarnation_id,
					'incarnation_name' => $record->incarnation->name,
					'incarnation_file' => $record->incarnation->file->fileUrl(),
					'incarnation_gender' => $record->incarnation->gender,
					'on_file_id' => $record->on_file_id,
					'on_file_url' => $record->onFile->fileUrl(),
					'side_file_id' => $record->side_file_id,
					'side_file_url' => $record->sideFile->fileUrl()
				];
			}
		}
		$pagination = $dataProvider->getPagination();
		return [
			'size' => $pagination->getPageSize(),
			'count' => $pagination->getPageCount(),
			'page' => ($pagination->getPage() + 1),
			'total' => $pagination->totalCount,
			'offset' => $pagination->getOffset(),
			'advertisements' => $advertisements,
		];
	}

	public static function create($data)
	{
		$advertisement = new Advertisement();
		$advertisement->setScenario('create');
		$advertisement->load($data, '');
		$onFile = new File();
		$onFile->upload('on_file');
		$advertisement->on_file_id = $onFile->id;
		$sideFile = new File();
		$sideFile->upload('side_file');
		$advertisement->side_file_id = $sideFile->id;
		if ($advertisement->validate()) {
			if ($advertisement->save()) {
				return $advertisement;
			}
			throw new \Exception('保存失败');
		}
		$errors = $advertisement->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	public static function modify($data)
	{
		$advertisement = self::find()->where([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')])->one();
		if (!$advertisement) {
			throw new \Exception('广告不存在');
		}
		$advertisement->setScenario('update');
		$advertisement->load($data, '');
		$onFile = new File();
		$result = $onFile->upload('on_file');
		if (!is_null($result)) {
			$advertisement->onFile->deleteFile();
			$advertisement->on_file_id = $onFile->id;
		}
		$sideFile = new File();
		$sideFileResult = $sideFile->upload('on_file');
		if (!is_null($sideFileResult)) {
			$advertisement->sideFile->deleteFile();
			$advertisement->side_file_id = $sideFileResult->id;
		}
		if ($advertisement->validate()) {
			if ($advertisement->save()) {
				return $advertisement;
			}
			throw new \Exception('保存失败');
		}
		$errors = $advertisement->getFirstErrors();
		$error = reset($errors);
		throw new \Exception($error);
	}

	public static function remove($data)
	{
		$advertisement = self::find()->where([self::tableName() . '.id' => ArrayHelper::getValue($data, 'id')])->one();
		if (!$advertisement) {
			throw new \Exception('广告不存在');
		}
		return $advertisement->onFile->deleteFile() && $advertisement->sideFile->deleteFile() && $advertisement->delete();
	}
}