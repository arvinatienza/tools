FROM php:5.6-apache
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

# RUN apt-get update && apt-get install -y \
#     libfreetype6-dev \
#     libjpeg62-turbo-dev \
#     libpng12-dev \
#     && docker-php-ext-install mysqli \
#     && docker-php-ext-configure gd \
#     --with-freetype-dir=/usr/include/ \
#     --with-jpeg-dir=/usr/include/ \
#     && docker-php-ext-install gd

COPY php.ini-development /usr/local/etc/php/php.ini

CMD ["apache2-foreground"]
