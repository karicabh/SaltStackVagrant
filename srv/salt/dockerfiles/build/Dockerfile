FROM karic/mvn as builder
RUN mkdir /data/
RUN mkdir /root/.m2/
WORKDIR /usr/src/petclinic/
RUN git clone --depth 1 https://github.com/karicabh/spring-petclinic /usr/src/petclinic/
ADD . .
CMD [ "./provision.sh" ]
