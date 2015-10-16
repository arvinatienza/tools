FROM ubuntu:vivid
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

RUN apt-get update

RUN apt-get install -yq \
        wget \
        curl \
        links \
        subversion \
        git \
        tmux \
        vim \
        mc \
        mysql-client \
        php5 \
        ruby \
        ruby-dev \
        npm \
	&& rm -rf /var/lib/apt-lists/*
        
RUN curl -sS https://getcomposer.org/installer | \
        php -- --install-dir=/usr/bin --filename=composer && \
    npm install -g bower && \
    npm install -g grunt-cli && \
    gem install sass && \
    gem install compass && \
    wget https://get.docker.com/builds/Linux/x86_64/docker-1.7.1 -O /usr/bin/docker && \
    chmod +x /usr/bin/docker

COPY ./vimrc /root/.vimrc
COPY ./tmux.conf /root/.tmux.conf

RUN mkdir -p ~/.vim/bundle && \
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
   vim +PluginInstall +qall > /dev/null

WORKDIR /app
