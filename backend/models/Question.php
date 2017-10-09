<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "questions".
 *
 * @property string $id
 * @property string $question
 * @property string $answer_type
 * @property string $created_at
 * @property string $updated_at
 *
 * @property AnswerChoices[] $answerChoices
 * @property SurveyQuestionTrans[] $surveyQuestionTrans
 */
class Question extends \yii\db\ActiveRecord
{
    
     public $answer;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'questions';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['question'], 'required'],
            [['question', 'answer_type'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
        ];
    }
     /**
     * auto update time
     */
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => 'updated_at',
                'value' => new Expression('NOW()'),
            ],
        ];
    }


    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'question' => 'Question',
            'answer_type' => 'Answer Type',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAnswerChoices()
    {
        return $this->hasMany(AnswerChoices::className(), ['question_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSurveyQuestionTrans()
    {
        return $this->hasMany(SurveyQuestionTrans::className(), ['question_id' => 'id']);
    }
}
