<?php


namespace api\modules\v1\actions\divide;


use api\modules\v1\models\User;
use common\models\Config;
use yii\rest\Action;

/**
 * Class ListAction
 * @package api\modules\v1\actions\divide
 * @property User $modelClass
 */
class RoundAction extends Action
{
	public function run()
	{
		try {
			return [
				'code' => 200,
				'message' => '获取成功',
				'data' => Config::getRound()
			];
		} catch (\Exception $exception) {
			return [
				'code' => 300,
				'message' => $exception->getMessage(),
				'data' => 0
			];
		}
	}
}