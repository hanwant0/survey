<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Professions */

$this->title = 'Create Professions';
$this->params['breadcrumbs'][] = ['label' => 'Professions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
<div class="col-md-8">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><?= Html::encode($this->title) ?></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

          </div>
          <!-- /.box -->
    </div>
    
</div>
