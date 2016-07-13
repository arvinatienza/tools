FROM node:latest
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>
RUN apt-get update && \
     apt-get install -y \
     ruby \
     rubygems \
     ruby-dev \
     python3 \
     python3-pip && \
     gem install compass sass
VOLUME /usr/development/app
WORKDIR /usr/development/app
RUN npm install -g yo bower grunt-cli gulp grunt
RUN useradd --create-home --shell /bin/bash non-root && \
    usermod -aG sudo non-root && \
    chown -R non-root:non-root /usr/development/app
USER non-root
EXPOSE 9000
CMD ["grunt", "serve"]
