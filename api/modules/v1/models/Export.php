<?php


namespace api\modules\v1\models;

use common\models\Export as CommonExport;
use yii\data\Sort;
use yii\helpers\ArrayHelper;

class Export extends CommonExport
{
	/**
	 * @param $data
	 * @throws \PhpOffice\PhpSpreadsheet\Exception
	 * @throws \PhpOffice\PhpSpreadsheet\Writer\Exception
	 * @throws \yii\base\InvalidConfigException
	 */
	public static function export($data)
	{
		ini_set('memory_limit', '100M');
		set_time_limit(600);
		$round = ArrayHelper::getValue($data, 'round');
		$fileName = $round ?: 'all';
		$tmpFile = \Yii::$app->runtimePath . DIRECTORY_SEPARATOR . 'tmp' . DIRECTORY_SEPARATOR . $fileName . '.xlsx';
		$cacheSign = \Yii::$app->cache->get('EXPORT_CACHE_SIGN_' . $fileName);
		if (!$cacheSign || !file_exists($tmpFile)) {
			\Yii::$app->divideExport->createExcel();
			\Yii::$app->divideExport->setTitle();
			\Yii::$app->divideExport->renderTitle();
			\Yii::$app->divideExport->renderHead();
			$query = static::find();
			$query->andFilterWhere(['round' => $round]);
			$query->orderBy(['divide_mark' => SORT_ASC]);
			$exports = $query->all();
			$divideIndex = 0;
			foreach ($exports as $export) {
				/**
				 * @var $export Export
				 */
				$divideIndex++;
				$exportData = [
					'divideIndex' => $divideIndex,
					'divideStamp' => $export->divide_stamp,
					'approveGrades' => $export->approve_grades,
					'immerseGrades' => $export->immerse_grades,
					'extravertReality1' => $export->extravert_reality1,
					'extravertReality2' => $export->extravert_reality2,
					'pleasantReality1' => $export->pleasant_reality1,
					'pleasantReality2' => $export->pleasant_reality2,
					'conscientiousReality1' => $export->conscientious_reality1,
					'conscientiousReality2' => $export->conscientious_reality2,
					'nervousReality1' => $export->nervous_reality1,
					'nervousReality2' => $export->nervous_reality2,
					'openReality1' => $export->open_reality1,
					'openReality2' => $export->open_reality2,
					'extravertInvented1' => $export->extravert_invented1,
					'extravertInvented2' => $export->extravert_invented2,
					'pleasantInvented1' => $export->pleasant_invented1,
					'pleasantInvented2' => $export->pleasant_invented2,
					'conscientiousInvented1' => $export->conscientious_invented1,
					'conscientiousInvented2' => $export->conscientious_invented2,
					'nervousInvented1' => $export->nervous_invented1,
					'nervousInvented2' => $export->nervous_invented2,
					'openInvented1' => $export->open_invented1,
					'openInvented2' => $export->open_invented2,
					'emotionAlive' => $export->emotion_alive,
					'emotionHappy' => $export->emotion_happy,
					'emotionWarmth' => $export->emotion_warmth,
					'emotionJubilant' => $export->emotion_excited,
					'emotionExcited' => $export->emotion_excited,
					'emotionProud' => $export->emotion_proud,
					'emotionDelighted' => $export->emotion_delighted,
					'emotionEnergetic' => $export->emotion_energetic,
					'emotionGrateful' => $export->emotion_grateful,
					'emotionSad' => $export->emotion_sad,
					'emotionScared' => $export->emotion_scared,
					'emotionNervous' => $export->emotion_nervous,
					'emotionTerrified' => $export->emotion_terrified,
					'emotionGuilt' => $export->emotion_guilt,
					'emotionTrembled' => $export->emotion_trembled,
					'emotionAnnoyed' => $export->emotion_annoyed,
					'emotionAshamed' => $export->emotion_ashamed,
					'emotionIrritable' => $export->emotion_irritable,
					'brandAttitudeA' => $export->brand_attitude_a,
					'brandAttitudeB' => $export->brand_attitude_b,
					'brandAttitudeC' => $export->brand_attitude_c,
					'brandAttitudeD' => $export->brand_attitude_d,
					'brandMemory1' => $export->brand_memory_1,
					'brandMemory2' => $export->brand_memory_2,
					'brandMemory3' => $export->brand_memory_3,
					'brandMemory4' => $export->brand_memory_4,
					'brandMemory5' => $export->brand_memory_5,
					'userID' => $export->user_id,
					'userName' => $export->user_name,
					'userEmail' => $export->user_email,
					'gender' => $export->gender,
					'age' => $export->age,
					'identifyStamp' => $export->identify_stamp,
					'differenceSize' => $export->difference_size,
					'differenceDirection' => $export->difference_direction,
					'associationStrength' => $export->association_strength
				];
				\Yii::$app->divideExport->addRow($exportData);
//				\Yii::$app->divideExport->renderBody($exportData);
			}
			\Yii::$app->divideExport->fillRows(1, null, 0);
			\Yii::$app->divideExport->setBodyStyle();
			\Yii::$app->divideExport->file($tmpFile);
			\Yii::$app->cache->set('EXPORT_CACHE_SIGN_' . $fileName, $tmpFile, 60);
		}
		return $tmpFile;
	}
}