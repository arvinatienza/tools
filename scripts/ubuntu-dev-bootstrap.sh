#!/bin/sh

sudo apt-get update
sudo apt-get install -yq \
        wget \
        curl \
        git \
        svn \
        tmux \
        vim \
        mc \
        exuberant-ctags \
        ack-grep \
        zsh \
        nodejs \
        npm \
        ruby \
        rake \
        python \
        python-pip \
        php \
        php-xml \
        php-mbstring \
        docker.io
sudo rm -rf /var/lib/apt-lists/*
sudo pip install --upgrade pip

wget https://getcomposer.org/download/1.2.1/composer.phar -O ~/bin/composer.phar
sudo gem install shopify_theme
sudo npm install -g webpack react-native-cli cordova

sudo ln -s /usr/bin/nodejs /usr/bin/node

pip install docker-compose
curl -L https://bit.ly/janus-bootstrap | bash
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

# apt-get install php-xdebug -- vim plugin

