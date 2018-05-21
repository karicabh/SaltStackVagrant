#!/bin/bash
git clone --depth 1 https://github.com/karicabh/spring-petclinic /usr/src/petclinic/sc/ && \
cd /usr/src/petclinic/sc && \
mvn clean package && cp /usr/src/petclinic/sc/target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /data/ 
