<?php
namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "survey".
 *
 * @property string $id
 * @property string $title
 * @property integer $no_of_questions
 * @property string $created_at
 * @property string $updated_at
 *
 * @property SurveyProfessionTrans[] $surveyProfessionTrans
 * @property SurveyQuestionTrans[] $surveyQuestionTrans
 * @property UserSurveySubmission[] $userSurveySubmissions
 */
class Survey extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'survey';
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
    public function rules()
    {
        return [
            [['no_of_questions'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['title'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'no_of_questions' => 'No Of Questions',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSurveyProfessionTrans()
    {
        return $this->hasMany(SurveyProfessionTrans::className(), ['survey_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSurveyQuestionTrans()
    {
        return $this->hasMany(SurveyQuestionTrans::className(), ['survey_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserSurveySubmissions()
    {
        return $this->hasMany(UserSurveySubmission::className(), ['survey_id' => 'id']);
    }
}
