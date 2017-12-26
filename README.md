1. 恢复数据库， 在 database 文件夹
2. 拷贝 \humhub\protected\config\dynamic_dev.php， 重命名为 dynamic.php
3. 改里面的数据库参数
4. 本地为了快捷起见，可以开放所有权限给webserver， 比如windows IIS 可以开放所有权限，否则也可以按照：
File Permissions
Make the following directories/files writable by the webserver

/assets
/protected/config/
/protected/modules
/protected/runtime
/uploads/*
Make the following files executable:

/protected/yii
/protected/yii.bat
