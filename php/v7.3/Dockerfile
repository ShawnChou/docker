FROM php:7.3-fpm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN docker-php-ext-configure gd --with-gd --with-jpeg-dir --with-png-dir --with-freetype-dir && \
docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions bcmath bz2 calendar exif gd gettext gmp igbinary imagick memcached mongodb mysqli pcntl pdo_mysql pdo_pgsql pgsql redis shmop sockets swoole sysvmsg sysvsem sysvshm wddx xhprof xsl zip ldap

RUN install-php-extensions @composer
#创建用户
RUN useradd -ms /bin/bash dev
RUN usermod -aG root dev
USER dev
WORKDIR /workspace/htdocs/
