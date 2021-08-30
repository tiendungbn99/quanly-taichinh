<?php
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
//use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title>Economizzer</title>
    <?php $this->head();
    AppAsset::register($this);
    $js = <<< 'SCRIPT'
    /* To initialize BS3 tooltips set this below */
    $(function () {
    $("[data-toggle='tooltip']").tooltip();
    });;
    /* To initialize BS3 popovers set this below */
    $(function () {
    $("[data-toggle='popover']").popover();
    });
SCRIPT;
    // Register tooltip/popover initialization javascript
    $this->registerJs($js);
     ?>
    <link rel="shortcut icon" href="<?php echo Yii::$app->request->baseUrl;?>/images/favicon.ico">
    <link rel="apple-touch-icon" sizes="57x57" href="<?php echo Yii::$app->request->baseUrl;?>/images/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<?php echo Yii::$app->request->baseUrl;?>/images/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?php echo Yii::$app->request->baseUrl;?>/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?php echo Yii::$app->request->baseUrl;?>/images/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?php echo Yii::$app->request->baseUrl;?>/images/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?php echo Yii::$app->request->baseUrl;?>/images/apple-touch-icon-120x120.png">
    <link rel="icon" type="image/png" href="<?php echo Yii::$app->request->baseUrl;?>/images/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="<?php echo Yii::$app->request->baseUrl;?>/images/favicon-96x96.png" sizes="96x96">
    <link rel="icon" type="image/png" href="<?php echo Yii::$app->request->baseUrl;?>/images/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="<?php echo Yii::$app->request->baseUrl;?>/images/manifest.json">
    <meta name="apple-mobile-web-app-title" content="Economizzer">
    <meta name="application-name" content="Economizzer">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
</head>
<body>

<?php $this->beginBody() ?>
    <div class="wrap">
        <?php
            NavBar::begin([
                'brandLabel' => '<img src="'.Yii::$app->request->baseUrl.'/images/logo-icon.png" style="height:20px;float:left;margin-right: 5px" align="absbottom">  Economizzer',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar navbar-default navbar-fixed-top',
                ],
            ]);
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'encodeLabels' => false,
                'items' => [
                    ['label' => '<span class="glyphicon glyphicon-stats" aria-hidden="true"></span> '.Yii::t('app', 'Overview'), 'url' => ['/dashboard/overview'], 'visible' => !Yii::$app->user->isGuest,],
                    ['label' => '<span class="glyphicon glyphicon-usd" aria-hidden="true"></span> '.Yii::t('app', 'Entries'), 'url' => ['/cashbook/index'], 'visible' => !Yii::$app->user->isGuest,],
                    ['label' => '<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span> '.Yii::t('app', 'Targets'), 'url' => ['/cashbook/target'], 'visible' => !Yii::$app->user->isGuest,],
                    ['label' => '<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> '.Yii::t('app', 'Options'), 'visible' => !Yii::$app->user->isGuest,
                    'items' => 
                        [
                            ['label' => '<span class="glyphicon glyphicon-tags" aria-hidden="true"></span> '.Yii::t('app', 'Categories'), 'url' => ['/category/index']],
                            // ['label' => '<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> '.Yii::t('app', 'Tools'), 'url' => ['/site/tools']],                            
                        ],
                    ],
                    Yii::$app->user->isGuest ?
                    ['label' => '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '.Yii::t('app', 'Create an account'), 'url' => ['/user/register']] :
                    ['label' => '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '. Yii::$app->user->displayName,
                    'items' => 
                        [
                            ['label' => '<span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> '.Yii::t('app', 'Account'), 'url' => ['/user/account']],
                            ['label' => '<span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> '.Yii::t('app', 'Profile'), 'url' => ['/user/profile']],
                            '<li class="divider"></li>',
                            ['label' => '<i class="fa fa-unlock"></i> '.Yii::t('app', 'Sign Out'),
                                'url' => ['/user/logout'],
                                'linkOptions' => ['data-method' => 'post']],
                        ],
                    ],
                    
                ],
            ]);
            NavBar::end();
        ?>

        <div class="container">
            <p>
            <?= $content ?>
        </div>
    </div>

    <footer class="footer">
        <div class="container" align="center">
            <?= Html::a('Economizzer', 'http://www.economizzer.org', ['target'=>'_blank']) ?> &copy; <?= date('Y') ?>  
            <?= Html::a('<i class="fa fa-twitter-square fa-lg"></i>', 'https://twitter.com/economizzer', ['target'=>'_blank']) ?> 
            <?= Html::a('<i class="fa fa-facebook-square fa-lg"></i>', 'https://www.facebook.com/economizzer', ['target'=>'_blank']) ?>
        </div>
    </footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
