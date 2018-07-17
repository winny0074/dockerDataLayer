######################################################################################
# Dockerfile to build MYSQK container images.
# 
# Based on Ubuntu
######################################################################################
# Set the base image to Ubuntu
FROM mysql

# File Author / Maintainer
MAINTAINER Example Onlyme

ENV MYSQL_ROOT_PASSWORD root 
ENV MYSQL_DATABASEMYSQL_DATABASE abc
ENV MYSQL_USER, MYSQL_PASSWORD admin,admin

## create dump.sql under /docker-entrypoint-initdb.d folder of the container
## will sync ./dump.sql on your host with /docker-entrypoint-initdb.d/dump.sql on the container
## on initialization, the msql image will read all files (.sh,.sql,.zip,etc) under /docker-entrypoint-initdb.d and will initialize mysql server
## e.g in dumpl.sql contenne script to create table , on inilization, mysql will be filled
COPY ./resources/dump.sql /docker-entrypoint-initdb.d/dump.sql 

VOLUME /var/lib/mysql

# Expose tomcat http  port
EXPOSE 3306 33060

CMD ["mysqld"]
