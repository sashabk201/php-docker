FROM php:7.0-fpm

RUN useradd -ms /bin/bash magento

ENV NODE_VERSION 12.6.0

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.16

RUN apt-get update \
    && apt-get install -y \
      libfreetype6-dev \
      libicu-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng-dev \
      libxslt1-dev \
      sendmail-bin \
      sendmail \
      sudo \
      git \
      unzip\
      libzip-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
     dom \
     gd \
     intl \
     mbstring \
     pdo_mysql \
     xsl \
     zip \
     soap \
     bcmath \
     pcntl \
     sockets \
     mcrypt

RUN docker-php-ext-enable bcmath

RUN yes | pecl install xdebug-2.5.5 \
     && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
     && echo "xdebug.remote_connect_back = 1" >> /usr/local/etc/php/conf.d/xdebug.ini \
     && echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/xdebug.ini \
     && echo "xdebug.remote_port = 9001" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN echo "date.timezone = Europe/London" > /usr/local/etc/php/conf.d/timezone.ini

RUN docker-php-ext-enable xdebug
EXPOSE 9000

RUN apt-get install -y apt-transport-https
RUN apt-get -y install nodejs
# RUN apt-get -y install npm
# RUN mkdir /.npm && chmod 777 /.npm

RUN echo "date.timezone = Europe/London" > /usr/local/etc/php/conf.d/timezone.ini

USER magento
WORKDIR /var/www/html
