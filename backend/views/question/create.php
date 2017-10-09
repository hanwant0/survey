<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Question */

$this->title = 'Create Question';
$this->params['breadcrumbs'][] = ['label' => 'Questions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$data = array();
?>
<div class="row">
    <div class="col-md-12" style="height: 500px">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><?= Html::encode($this->title) ?></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            
            <?= $this->render('_form', [
                'model' => $model,'data'=>$data
            ]) ?>

          
          <!-- /.box -->
    </div>
    
</div>
