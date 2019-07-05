<?php


namespace api\modules\v1\models;

use common\models\UserIncarnationGrades as CommonUserIncarnationGrades;

class UserIncarnationGrades extends CommonUserIncarnationGrades
{
	/**
	 * @param $approveResult Approve[]
	 * @param $immerseResult Immerse[]
	 */
	public static function saveUserIncarnation($approveResult, $immerseResult)
	{
		foreach ($approveResult as $incarnationID => $approve) {
			$approveGrades = $approve->grades;
			$immerseGrades = $immerseResult[$incarnationID]->grades;
			$userIncarnationGrades = new UserIncarnationGrades();
			$userIncarnationGrades->user_id = $approve->user_id;
			$userIncarnationGrades->incarnation_id = $incarnationID;
			$userIncarnationGrades->grades = ($approveGrades + $immerseGrades) / 2;
			$userIncarnationGrades->save();
		}
	}
}