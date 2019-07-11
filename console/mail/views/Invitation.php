<?php
/**
 * @var $this \yii\web\View
 * @var $user \common\models\User
 */

use yii\helpers\Html;
use yii\helpers\ArrayHelper;

$baseUrl = ArrayHelper::getValue(Yii::$app->params, 'frontendBaseUrl');
?>
<div>
	<div><?php echo Html::encode($user->username) ?></div>
	<div style="margin-top: 20px">
		现在邀请你参加我们下一阶段的调查答卷，请点击下方链接登录参与
	</div>
	<div>
		<a href="<?php echo $baseUrl ?>"><?php echo $baseUrl ?></a>
	</div>
</div>
