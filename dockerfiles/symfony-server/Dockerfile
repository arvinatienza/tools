FROM php:5.6-apache
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-install mysqli \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && curl -LsS https://symfony.com/installer -o /bin/symfony \
    && chmod a+x /bin/symfony

RUN mkdir -p /var/www/html/web \
    && sed -ri 's/33:33/1000:1000/g' /etc/passwd \
    && sed -ri 's/\/var\/www\/html/\/var\/www\/html\/web/g' /etc/apache2/apache2.conf

#COPY php.ini-development /usr/local/etc/php/php.ini
CMD ["apache2-foreground"]
