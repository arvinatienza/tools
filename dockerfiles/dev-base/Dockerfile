FROM ubuntu:16.04
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>
ENV TERM screen-256color

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get install -yq \
        #sudo \
        wget \
        curl \
        git \
        tmux \
        vim \
        mc \
        exuberant-ctags \
        ack-grep \
        zsh \
        rake \
        nodejs \
        npm \
        ruby \
        python \
        python-pip \
        php \
        php-xml \
        php-mbstring \
	&& rm -rf /var/lib/apt-lists/*

RUN wget https://getcomposer.org/download/1.2.1/composer.phar -O /root/bin/composer.phar \
    && pip install docker-compose \
    && gem install shopify_theme \
    && npm install -g webpack
RUN ln -s /usr/bin/nodejs /usr/bin/node

# pip install --upgrade pip
# apt-get install php-xdebug -- vim plugin

#RUN useradd -ms /bin/zsh ubuntu sudo

#USER ubuntu
RUN curl -L https://bit.ly/janus-bootstrap | bash
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
COPY ./tmux.conf /root/.tmux.conf
COPY ./zshrc /root/.zshrc
COPY ./vimrc.before /root/.vimrc.before
COPY ./vimrc.after /root/.vimrc.after

#WORKDIR /home/ubuntu

CMD ["/bin/zsh"]
