<?php


namespace api\modules\v1\models;

use common\models\Export as CommonExport;
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
		\Yii::$app->divideExport->createExcel();
		\Yii::$app->divideExport->setTitle();
		\Yii::$app->divideExport->renderTitle();
		\Yii::$app->divideExport->renderHead();
		foreach (User::IDENTIFY_DIVIDE_LEVEL as $identifyDivideLevel) {
			foreach (User::EGO_DIVIDE_LEVEL as $egoDivideLevel) {
				foreach (User::ADVERTISEMENT_DIVIDE_LEVEL as $advertisementDivideLevel) {
					$query = static::find()->where(['divide_stamp' => $identifyDivideLevel['key'] . $egoDivideLevel['key'] . $advertisementDivideLevel['key']]);
					$query->andFilterWhere(['round' => $round]);
					//每次循环取100个
					$divideIndex = 0;
					foreach ($query->each() as $export) {
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
							'egoAlive' => $export->ego_alive,
							'egoHappy' => $export->ego_happy,
							'egoJubilant' => $export->ego_excited,
							'egoExcited' => $export->ego_excited,
							'egoProud' => $export->ego_proud,
							'egoDelighted' => $export->ego_delighted,
							'egoEnergetic' => $export->ego_energetic,
							'egoGrateful' => $export->ego_grateful,
							'egoSad' => $export->ego_sad,
							'egoScared' => $export->ego_scared,
							'egoNervous' => $export->ego_nervous,
							'egoTerrified' => $export->ego_terrified,
							'egoGuilt' => $export->ego_guilt,
							'egoTrembled' => $export->ego_trembled,
							'egoAnnoyed' => $export->ego_annoyed,
							'egoAshamed' => $export->ego_ashamed,
							'egoIrritable' => $export->ego_irritable,
							'brandAttitudeA' => $export->brand_attitude_a,
							'brandAttitudeB' => $export->brand_attitude_b,
							'brandAttitudeC' => $export->brand_attitude_c,
							'brandAttitudeD' => $export->brand_attitude_d,
							'brandMemory1' => $export->brand_memory_1,
							'brandMemory2' => $export->brand_memory_2,
							'brandMemory3' => $export->brand_memory_3,
							'userID' => $export->user_id,
							'gender' => $export->gender,
							'age' => $export->age,
							'identifyStamp' => $export->identify_stamp,
							'differenceSize' => $export->difference_size,
							'differenceDirection' => $export->difference_direction,
							'associationStrength' => $export->association_strength
						];
						\Yii::$app->divideExport->renderBody($exportData);
					}
				}
			}
		}
		\Yii::$app->divideExport->setBodyStyle();
		\Yii::$app->divideExport->save($round ?: 'all');
		exit();
	}
}