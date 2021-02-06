FROM redis:6.0.10

MAINTAINER FrankUnderwood <frankunderw00d123123412345@gmail.com>

RUN mkdir -p /redis/data /redis/conf /redis/log && chmod -R 777 /redis/
COPY ./redis.conf /redis/conf/