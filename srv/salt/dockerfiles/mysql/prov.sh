#! /bin/bash

debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password password $root_mysql_pass"

debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password_again password $root_mysql_pass"

