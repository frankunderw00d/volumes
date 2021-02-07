FROM redis:6.0.10

MAINTAINER FrankUnderwood <frankunderw00d123123412345@gmail.com>

ENV TZ=Asia/Shanghai

RUN mkdir -p /redis/conf /redis/data /redis/log && chmod 777 /redis/log /redis/data

COPY redis.conf /redis/conf/