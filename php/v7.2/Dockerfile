FROM php:7.2-fpm
MAINTAINER Shawn.Chou "shawnchou1988@gmail.com"
#更新debian源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list
RUN docker-php-source extract && docker-php-source delete
RUN apt-get update
RUN apt-get install -y vim net-tools procps libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libz-dev libmemcached-dev
RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-install gd mbstring pdo pdo_mysql mysqli
#安装memcached扩展
RUN pecl install memcached
RUN docker-php-ext-enable memcached
#安装redis扩展
RUN pecl install redis
RUN docker-php-ext-enable redis
#composer相关
RUN docker-php-ext-install zip
RUN docker-php-ext-install pcntl
RUN curl -sS http://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
#创建用户
RUN useradd -ms /bin/bash dev
RUN usermod -aG root dev
USER dev
WORKDIR /workspace/htdocs/

