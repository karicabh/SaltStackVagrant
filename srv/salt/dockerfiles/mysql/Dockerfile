FROM ubuntu:16.04
EXPOSE 3306/tcp
ENV DEBIAN_FRONTEND=noninteractive
ADD . .
RUN apt-get update && apt-get upgrade -y 
RUN ./prov.sh
RUN apt-get -y install mysql-server-5.7
RUN mkdir /var/run/mysqld 
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
RUN ./prov_mysql.sh
USER mysql
RUN ./prov_mysql_2.sh
CMD ["mysqld_safe"]
