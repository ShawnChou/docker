FROM php:7.3-fpm
MAINTAINER Shawn.Chou "shawnchou1988@gmail.com"
RUN docker-php-source extract && docker-php-source delete
RUN apt-get update

RUN apk add libzip-dev ldb-dev libldap openldap-dev
RUN apk add openldap-back-mdb
RUN apk add --update --virtual .build-deps autoconf g++ make zlib-dev curl-dev libidn2-dev libevent-dev icu-dev libidn-dev openldap libxml2-dev

RUN apt-get install -y vim net-tools procps libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libz-dev libmemcached-dev libgmp-dev libldap2-dev

RUN apk --update --no-cache add php7-ldap libldap php-ldap  openldap-clients openldap openldap-back-mdb
RUN apk add --no-cache ldb-dev
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
&& ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so
#RUN docker-php-ext-configure ldap --prefix=/usr/local/php --with-ldap=/usr/lib/libldap.so
#RUN docker-php-ext-install ldap
ARG DOCKER_PHP_ENABLE_LDAP


RUN echo -n "With ldap support:          " ; if [[ "${DOCKER_PHP_ENABLE_LDAP}" = "on" ]] ;      then echo "Yes"; else echo "No" ; fi && \
    if [ -z ${DOCKER_USER_UID+x} ]; then echo "DOCKER_USER_UID is unset"; DOCKER_USER_UID=1000; else echo "DOCKER_USER_UID is set to '$DOCKER_USER_UID'"; fi && \
    if [ -z ${DOCKER_USER_GID+x} ]; then echo "DOCKER_USER_GID is unset"; DOCKER_USER_GID=1000; else echo "DOCKER_USER_GID is set to '$DOCKER_USER_GID'"; fi

# Enable LDAP
RUN if [ "${DOCKER_PHP_ENABLE_LDAP}" != "off" ]; then \
      # Dependancy for ldap \
      apk add --update --no-cache \
          libldap && \
      # Build dependancy for ldap \
      apk add --update --no-cache --virtual .docker-php-ldap-dependancies \
          openldap-dev && \
      docker-php-ext-configure ldap && \
      docker-php-ext-install ldap && \
      apk del .docker-php-ldap-dependancies && \
      php -m; \
    else \
      echo "Skip ldap support"; \
    fi



RUN docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir --enable-gd-native-ttf
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu
#RUN docker-php-ext-install -j$(nproc) ldap

RUN docker-php-ext-install gd mbstring pdo pdo_mysql mysqli gmp bcmath zip pcntl
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

