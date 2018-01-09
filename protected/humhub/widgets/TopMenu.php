<?php

/**
 * @link https://www.humhub.org/
 * @copyright Copyright (c) 2017 HumHub GmbH & Co. KG
 * @license https://www.humhub.com/licences
 */

namespace humhub\widgets;

use Yii;
use humhub\modules\user\components\User;

/**
 * TopMenuWidget is the primary top navigation class extended from MenuWidget.
 *
 * @since 0.5
 * @author Luke
 */
class TopMenu extends BaseMenu
{

    /**
     * @inheritdoc
     */
    public $template = "topNavigation";

    /**
     * @inheritdoc
     */
    public $id = 'top-menu-nav';

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        parent::addItem(['url'=>'baidu.com','label'=>'文件','icon'=>'<i class="fa fa-tachometer"></i>']);
        parent::addItem(['url'=>'baidu.com','label'=>'广告','icon'=>'<i class="fa fa-tachometer"></i>']);
        // Don't show top menu if guest access is disabled
        if (Yii::$app->user->isGuest && !User::isGuestAccessEnabled()) {
            $this->template = '';
        }
    }

}

?>
