#!/bin/bash
set -e
#查看mysql服务的状态，方便调试，这条语句可以删除
echo `service mysql status`
echo '1.启动mysql....'
#启动mysql
service mysql start
sleep 3
echo `service mysql status`
echo '2.还原mysql_native_password验证'
mysql < /mysql/privileges.sql
tail -f /dev/null
