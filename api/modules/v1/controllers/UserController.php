<?php

namespace api\modules\v1\controllers;
use yii;
use yii\rest\ActiveController;
use common\models\LoginForm;
use frontend\models\SignupForm;
use common\models\User;

/**
 * Country Controller API
 *
 * @author Budi Irawan <deerawan@gmail.com>
 */
class UserController extends ActiveController
{

    public $modelClass = 'common\models\User';

    /**
     * This method implemented to demonstrate the receipt of the token.
     * Do not use it on production systems.
     * @return string AuthKey or model with errors
     */
    public function actionLogin()
    {
        $model = new LoginForm();
        $user=new User();

        if ($model->load(\Yii::$app->getRequest()->getBodyParams(), '') && $model->login())
        {
            $Id = \Yii::$app->user->identity->getId();
            $data=$user->findIdentity($Id);
            
            return $data;
            
        }
        else
        {
            return $model;
        }
    }

    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->getRequest()->getBodyParams(),''))
        {
            if ($user = $model->signup())
            {
                return $user;
            }
        }
    }

}
