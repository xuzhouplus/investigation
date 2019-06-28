<?php


namespace api\modules\v1\actions\question;


use api\modules\v1\models\Question;
use Yii;
use yii\rest\Action;

/**
 * Class AnswerAction
 * @package api\modules\v1\actions\question
 * @property Question $modelClass
 */
class AnswerAction extends Action
{
	public function run(){
		try{
			$request=Yii::$app->request;

		} catch (\Exception $exception) {
			Yii::error($exception->__toString());
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => new \stdClass()
			];
		}
	}
}