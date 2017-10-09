<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "answer_choices".
 *
 * @property string $id
 * @property string $choice
 * @property string $question_id
 * @property integer $order
 *
 * @property Questions $question
 * @property SubmissionAnswer[] $submissionAnswers
 */
class AnswerChoices extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'answer_choices';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['question_id'], 'required'],
            [['question_id', 'order'], 'integer'],
            [['choice'], 'string', 'max' => 255],
            [['question_id'], 'exist', 'skipOnError' => true, 'targetClass' => Questions::className(), 'targetAttribute' => ['question_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'choice' => 'Choice',
            'question_id' => 'Question ID',
            'order' => 'Order',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuestion()
    {
        return $this->hasOne(Questions::className(), ['id' => 'question_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubmissionAnswers()
    {
        return $this->hasMany(SubmissionAnswer::className(), ['choice_id' => 'id']);
    }
}
