FROM ubuntu:trusty
MAINTAINER MKA <it@mkainc.com>

ENV APPLICATION_ENV Production

RUN apt-get update && \
    apt-get install -yq \
        curl \
        git \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-curl \
        php5-xdebug \
        smarty && \
    rm -rf /var/lib/apt-lists/* && \
    curl -sS https://getcomposer.org/installer | \
        php -- --install-dir=/usr/bin --filename=composer 

RUN a2enmod rewrite && \
    a2enmod ssl

ADD . /var/www/html

RUN mv /var/www/html/run.sh / && \
    chmod +x /run.sh && \
    rm /var/www/html/Dockerfile

WORKDIR /var/www/html

VOLUME /var/www/html

EXPOSE 80
EXPOSE 443

CMD /run.sh

