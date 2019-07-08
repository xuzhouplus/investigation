<?php
/**
 * @var $this \yii\web\View
 * @var $user \common\models\User
 */

use yii\helpers\Html;
use yii\helpers\ArrayHelper;

$baseUrl = ArrayHelper::getValue(Yii::$app->params, 'frontendBaseUrl');
$link = $baseUrl . '/user/reset?access_token=' . $user->generateAccessToken();
?>
<div>
	<div><?php echo Html::encode($user->username) ?></div>
	<div style="margin-top: 20px">
		请点击下方的链接重置密码
	</div>
	<div>
		<a href="<?php echo $link ?>"><?php echo $link ?></a>
	</div>
	<div style="margin-top: 20px">
		如果不是你在操作，请登录系统修改你的信息。
	</div>
	<div>
		<a href="<?php echo $baseUrl ?>"><?php echo $baseUrl ?></a>
	</div>
</div>
