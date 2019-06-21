<?php


namespace api\modules\v1\actions\type;


use api\modules\v1\models\Type;
use yii\rest\Action;

class CreateAction extends Action
{
	public function run()
	{
		$request=\Yii::$app->request;
		try{
			if (!Yii::$app->getUser()->getIdentity()->administrator()) {
				throw new \Exception('你没有权限调用此接口');
			}
			/**
			 * @var $model Type
			 */
			$model=$this->modelClass;
			$type=$model::createType($request->getBodyParams());
			if($type){
				return [
					'code'=>200,
					'message'=>'新建成功过',
					'data'=>$type
				];
			}
			return [
				'code'=>300,
				'message'=>'新建失败',
				'data'=>(new \stdClass())
			];
		}catch (\Exception $exception){
			\Yii::error($exception->__toString());
			return [
				'code'=>300,
				'message'=>$exception->getMessage(),
				'data'=>(new \stdClass())
			];
		}
	}
}