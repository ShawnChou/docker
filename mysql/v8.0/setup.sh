#!/bin/bash
#还原mysql_native_password验证
/usr/bin/mysql -u root -p123456 < /mysql/privileges.sql
