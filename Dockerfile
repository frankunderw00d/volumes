FROM mariadb:latest

MAINTAINER FrankUnderwood <frankunderw00d123123412345@gmail.com>

ENV WORK_PATH /usr/local/work

ENV AUTO_RUN_DIR /docker-entrypoint-initdb.d

ENV FILE_0 aa.sql

ENV INSTALL_DATA_SHELL install_data.sh

RUN mkdir -p $WORK_PATH

COPY ./$FILE_0 $WORK_PATH/

COPY ./$INSTALL_DATA_SHELL $AUTO_RUN_DIR/

RUN chmod a+x $AUTO_RUN_DIR/$INSTALL_DATA_SHELL