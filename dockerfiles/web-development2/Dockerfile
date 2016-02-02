FROM ubuntu:15.10
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>
ENV LANG en_US.UTF-8

RUN apt-get update

RUN apt-get install -yq \
        wget \
        curl \
        links \
        git \
        subversion \
        tmux \
        vim \
        mc \
        mysql-client \
        php5 \
        ruby \
        ruby-dev \
        rake \
        rails \
        npm \
        exuberant-ctags \
        ack-grep \
        zsh \
        nodejs-legacy \
	&& rm -rf /var/lib/apt-lists/*

RUN curl -sS https://getcomposer.org/installer | \
        php -- --install-dir=/usr/bin --filename=composer && \
    npm install -g bower && \
    npm install -g grunt-cli && \
    npm install -g less && \
    gem install sass && \
    gem install compass && \
    wget https://get.docker.com/builds/Linux/x86_64/docker-1.7.1 -O /usr/bin/docker && \
    chmod +x /usr/bin/docker

RUN curl -L https://bit.ly/janus-bootstrap | bash
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

COPY ./tmux.conf /root/.tmux.conf
COPY ./zshrc /root/.zshrc
COPY ./vimrc.before /root/.vimrc.before
COPY ./vimrc.after /root/.vimrc.after

WORKDIR /app

CMD ["/bin/zsh"]
