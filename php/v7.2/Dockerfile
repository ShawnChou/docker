FROM php:7.2-fpm
MAINTAINER Shawn.Chou "shawnchou1988@gmail.com"
RUN docker-php-source extract && docker-php-source delete
RUN apt-get update
RUN apt-get install -y vim net-tools procps libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libz-dev libmemcached-dev libgmp-dev
RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-install -j$(nproc)  gd mbstring pdo pdo_mysql mysqli gmp bcmath zip pcntl
#安装memcached扩展
RUN pecl install memcached
RUN docker-php-ext-enable memcached
#安装redis扩展
RUN pecl install redis
RUN docker-php-ext-enable redis
#composer相关
RUN curl -sS http://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer


#创建用户
RUN useradd -ms /bin/bash dev
RUN usermod -aG root dev
USER dev
WORKDIR /workspace/htdocs/

