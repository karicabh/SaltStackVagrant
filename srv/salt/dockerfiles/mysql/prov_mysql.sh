#!/bin/bash
find /etc/mysql/ -name '*.cnf' -print0 \
		| xargs -0 grep -lZE '^(bind-address|log)' \
		| xargs -rt -0 sed -Ei 's/^(bind-address|log)/#&/'

#bash -c /usr/bin/mysqld_safe &
#mysql -u root  -h 127.0.0.1 -e "CREATE DATABASE petclinic;" -proot
#mysql -u root  -e "CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';" -proot
#mysql -u root  -e "GRANT ALL PRIVILEGES ON mydb.* TO 'monty'@'%';" -proot
#mysql -u root  -e "FLUSH PRIVILEGES;" -proot


