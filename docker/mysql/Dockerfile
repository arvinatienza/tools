FROM ubuntu:trusty
MAINTAINER MKA <it@mkainc.com>

ENV DEBIAN_FRONTEND noninteractive
ENV MYSQL_PASSWORD secret
ENV MYSQL_DATABASE db
ENV MYSQL_USER dbuser
ENV RESTORE_FILE test.sql

RUN apt-get update && \
    apt-get install -yq mysql-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD . /data

RUN mv /data/run.sh / && \
    chmod +x /run.sh && \
    rm /data/Dockerfile

WORKDIR /data

VOLUME /var/lib/mysql
VOLUME /data

EXPOSE 3306

CMD /Dockerinit
