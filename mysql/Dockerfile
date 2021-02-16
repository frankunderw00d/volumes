FROM mysql:8.0.0

MAINTAINER FrankUnderwood <frankunderw00d123123412345@gmail.com>

ENV MYSQL_ROOT_PASSWORD="root"
ENV TZ=Asia/Shanghai

RUN mkdir -p /mysql/conf /mysql/data /mysql/log && chmod 777 /mysql/log

COPY my.cnf /mysql/conf/
COPY privilege.sql /mysql/
COPY databases.sql /mysql/
COPY tables.sql /mysql/