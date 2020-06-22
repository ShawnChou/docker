#!/bin/bash
set -e
#启动mysql
mysqld
sleep 3
#还原mysql_native_password验证
mysql < /mysql/privileges.sql
tail -f /dev/null
