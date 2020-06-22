FROM mysql:8.0
MAINTAINER shawnchou1988@gmail.com

#设置免密登录
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

RUN mkdir -p /mysql

COPY setup.sh /mysql/setup.sh
COPY privileges.sql /mysql/privileges.sql


