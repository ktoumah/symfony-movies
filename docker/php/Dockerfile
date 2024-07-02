FROM php:8.2.7-fpm-bookworm
LABEL maintainer="Karim TOUMAH"

#RUN apt-get update && apt-get install -y git  \
#    && docker-php-ext-install intl opcache pdo_mysql mysqli \
#    && pecl install apcu \
#    && docker-php-ext-enable apcu \

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt install -y symfony-cli

RUN usermod -u 1000 www-data
RUN usermod -a -G www-data root
RUN mkdir -p /var/www/app
RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/app
