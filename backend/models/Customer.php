<?php
namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer".
 *
 * @property integer $c_id
 * @property string $c_name
 * @property string $c_email
 * @property string $c_contact_no
 * @property integer $cg_id
 */
class Customer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['c_name', 'c_email', 'c_contact_no', 'cg_id'], 'required'],
            [['cg_id'], 'integer'],
            [['c_name', 'c_email'], 'string', 'max' => 255],
            [['c_contact_no'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'c_name' => 'Name',
            'c_email' => 'Email',
            'c_contact_no' => 'Contact No',
            'cg_id' => 'Cg ID',
        ];
    }
}
