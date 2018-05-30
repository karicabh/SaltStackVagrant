#!/bin/bash
bash -c /usr/bin/mysqld_safe &
sleep 5
mysql -u root  -e "CREATE DATABASE petclinic;" -proot
mysql -u root  -e "CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';" -proot
mysql -u root  -e "GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%' WITH GRANT OPTION;" -proot
mysql -u root  -e "FLUSH PRIVILEGES;" -proot
