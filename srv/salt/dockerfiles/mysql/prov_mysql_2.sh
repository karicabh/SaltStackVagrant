#!/bin/bash
set -m
/usr/bin/mysqld_safe &
sleep 5
mysql -u root  -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" -p$ROOT_MYSQL_PASS
mysql -u root  -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';" -p$ROOT_MYSQL_PASS
mysql -u root  -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;" -p$ROOT_MYSQL_PASS
mysql -u root  -e "FLUSH PRIVILEGES;" -p$ROOT_MYSQL_PASS
fg