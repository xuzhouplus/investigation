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
		如果不是你在操作，请登录系统修改你的信息。
	</div>
	<div>
		<a href="<?php echo $baseUrl ?>"><?php echo $baseUrl ?></a>
	</div>
</div>
