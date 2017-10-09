<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Survey */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="survey-form">
        <?php $form = ActiveForm::begin(); ?>
              <div class="box-body">
                <div class="form-group">
                  <label for="title">Title</label>
                  <?= $form->field($model, 'title')->textInput(['maxlength' => true])->label(false); ?>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">No of Question</label>
                  <?= $form->field($model, 'no_of_questions')->textInput()->label(false); ?>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                 <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
              </div>
            <?php ActiveForm::end(); ?>
    
  </div>
