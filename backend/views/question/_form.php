<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
/* @var $this yii\web\View */
/* @var $model backend\models\Question */
/* @var $form yii\widgets\ActiveForm */

?>
<div class="question-form">
        <?php $form = ActiveForm::begin(); ?>
              <div class="box-body">
                <div class="form-group col-md-8 row">
                  <label for="title">Question Type</label>
                  <?= $form->field($model, 'answer_type')->dropDownList([ 'single' => 'Single', 'multiple' => 'Multiple', ], ['prompt' => ''])->label(false); ?>
                </div>
                
                <div class="form-group col-md-8 row">
                  <label for="title">Question</label>
                <?= $form->field($model, 'question')->textarea(['rows' => 6])->label(false); ?>

                </div>
                <div class="form-group col-md-8 row">
                  <label for="title">Answer</label>
                  <?php $model->answer =  ['red', 'green']; // initial value
                    echo $form->field($model, 'answer')->widget(Select2::classname(), [
                        'data' => $data,
                        'options' => ['placeholder' => 'Enter a answer choice  ...', 'multiple' => true],
                        'pluginOptions' => [
                            'tags' => true,
                            'tokenSeparators' => [',', ' '],
                            'maximumInputLength' => 10
                        ],
                    ])->label(false);
                    ?>

                </div>
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                 <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
              </div>
            <?php ActiveForm::end(); ?>
    
  </div>


