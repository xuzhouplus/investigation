<?php


namespace common\filters;


use yii\filters\auth\AuthMethod;
use yii\helpers\ArrayHelper;
use yii\web\IdentityInterface;
use yii\web\Request;
use yii\web\Response;
use yii\web\UnauthorizedHttpException;
use yii\web\User;

class AccessTokenAuth extends AuthMethod
{
	public $tokenParam = 'access_token';

	/**
	 * @param User $user
	 * @param Request $request
	 * @param Response $response
	 * @return IdentityInterface|null
	 * @throws UnauthorizedHttpException
	 */
	public function authenticate($user, $request, $response)
	{
		if ($request->isGet) {
			$accessToken = $request->getQueryParam($this->tokenParam);
		} else {
			$accessToken = $request->getBodyParam($this->tokenParam);
		}
		if (is_string($accessToken)) {
			$identity = $user->loginByAccessToken($accessToken, get_class($this));
			if ($identity !== null) {
				return $identity;
			}
		}
		if ($accessToken !== null) {
			$this->handleFailure($response);
		}

		return null;
	}
}