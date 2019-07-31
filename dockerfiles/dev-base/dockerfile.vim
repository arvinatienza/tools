FROM node:10-alpine
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

ADD . /app
WORKDIR /app
#RUN npm install -g @angular/cli firebase-tools
#RUN npm install

USER node

EXPOSE 4200

CMD ["node"]
