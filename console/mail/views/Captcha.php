<?php
/**
 * @var $this \yii\web\View
 * @var $user \common\models\User
 * @var $captcha string
 */

use yii\helpers\Html;
use yii\helpers\ArrayHelper;

$baseUrl = ArrayHelper::getValue(Yii::$app->params, 'frontendBaseUrl');
?>
<div>
	<div><?php echo Html::encode($user->username) ?></div>
	<div style="margin-top: 20px">
		你本次操作的验证码是
	</div>
	<div>
		<?php echo $captcha;?>
	</div>
	<div style="margin-top: 20px">
		请不要把验证码透露给其他人。
	</div>
</div>
