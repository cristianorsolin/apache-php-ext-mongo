FROM php:5.6-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libssl-dev \
    && pecl install mongodb \
    && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/ext-mongodb.ini

RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

WORKDIR /var/www/html/
