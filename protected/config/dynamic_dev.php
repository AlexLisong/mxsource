<?php return array (
  'components' => 
  array (
    'db' => 
    array (
      'class' => 'yii\\db\\Connection',
      'dsn' => 'mysql:host=localhost;dbname=hum',
      'username' => 'alex',
      'password' => 'alexsong',
      'charset' => 'utf8',
    ),
    'user' => 
    array (
    ),
    'mailer' => 
    array (
      'transport' => 
      array (
        'class' => 'Swift_MailTransport',
      ),
      'view' => 
      array (
        'theme' => 
        array (
          'name' => 'HumHub',
          'basePath' => 'E:\\humhub/themes\\HumHub',
          'publishResources' => false,
        ),
      ),
    ),
    'cache' => 
    array (
      'class' => 'yii\\caching\\FileCache',
      'keyPrefix' => 'humhub',
    ),
    'view' => 
    array (
      'theme' => 
      array (
        'name' => 'HumHub',
        'basePath' => 'E:\\humhub/themes\\HumHub',
        'publishResources' => false,
      ),
    ),
  ),
  'params' => 
  array (
    'installer' => 
    array (
      'db' => 
      array (
        'installer_hostname' => 'liunar.com',
        'installer_database' => 'hum',
      ),
    ),
    'config_created_at' => 1514248045,
    'horImageScrollOnMobile' => '1',
    'databaseInstalled' => true,
    'installed' => true,
  ),
  'name' => 'Utisfy',
  'language' => 'en-US',
); ?>