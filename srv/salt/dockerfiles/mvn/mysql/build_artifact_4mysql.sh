#!/bin/bash

git clone --depth 1 https://github.com/karicabh/spring-petclinic /usr/src/petclinic/sc/ && \
cd /usr/src/petclinic/sc && \
cp /usr/src/petclinic/pom.xml ./pom.xml && \
cp /usr/src/petclinic/application-mysql.properties ./src/main/resources/application-mysql.properties && \
cp /usr/src/petclinic/application.properties ./src/main/resources/application.properties && \
sed -i "s/localhost/$(echo $IP)/" ./src/main/resources/application-mysql.properties && \
sed -i "s/3306/$(echo $PORT)/" ./src/main/resources/application-mysql.properties && \
sed -i "s/petclinic/$(echo $DATABASE)/" ./src/main/resources/application-mysql.properties && \
sed -i "s/rootuser/$(echo $USER)/" ./src/main/resources/application-mysql.properties && \
sed -i "s/rootpw/$(echo $PASS)/" ./src/main/resources/application-mysql.properties && \
mvn clean package -Dmaven.test.skip=true -Drun.profiles=mysql && \
cp /usr/src/petclinic/sc/target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /data/ 
