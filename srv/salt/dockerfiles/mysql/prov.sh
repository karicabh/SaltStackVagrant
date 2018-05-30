#! /bin/bash

mysql_pass="root"
debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password password $mysql_pass"

debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password_again password $mysql_pass"

