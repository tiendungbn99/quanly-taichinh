<?php
namespace app\models;

use amnah\yii2\user\models\Profile as BaseProfile;
use Yii;

class Profile extends BaseProfile {

    public function rules()
    {
        return [
            // [['user_id'], 'required'],
            // [['user_id'], 'integer'],
            // [['create_time', 'update_time'], 'safe'],
            [['full_name'], 'string', 'max' => 255],
            [['language', 'startpage', 'currencycode', 'decimalseparator'], 'string', 'max' => 100],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id'          => Yii::t('user', 'ID'),
            'user_id'     => Yii::t('user', 'User ID'),
            'create_time' => Yii::t('user', 'Create Time'),
            'update_time' => Yii::t('user', 'Update Time'),
            'full_name'   => Yii::t('user', 'Full Name'),
            'language' => Yii::t('user', 'Language'),
            'startpage'   => Yii::t('user', 'Start Page'), 
            'currencycode'   => Yii::t('user', 'Currency'), 
            'decimalseparator'   => Yii::t('user', 'Decimal Separator'), 
        ];
    }
}