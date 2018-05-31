#!/bin/bash
bash -c /usr/bin/mysqld_safe &
sleep 5
mysql -u root  -e "CREATE DATABASE $MYSQL_DATABASE;" -p$ROOT_MYSQL_PASS
mysql -u root  -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';" -p$ROOT_MYSQL_PASS
mysql -u root  -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_PASS'@'%' WITH GRANT OPTION;" -p$ROOT_MYSQL_PASS
mysql -u root  -e "FLUSH PRIVILEGES;" -p$ROOT_MYSQL_PASS
