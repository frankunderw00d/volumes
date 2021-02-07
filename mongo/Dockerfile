FROM mongo:4.4.3

MAINTAINER FrankUnderwood <frankunderw00d123123412345@gmail.com>

ENV TZ=Asia/Shanghai

RUN mkdir -p /mongo/conf /mongo/data /mongo/log && chmod 777 /mongo/log /mongo/data

COPY mongod.conf /mongo/conf/