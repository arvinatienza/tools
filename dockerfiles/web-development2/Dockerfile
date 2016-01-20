FROM ubuntu:15.10
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

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
        npm \
        exuberant-ctags \
        ack-grep \
        zsh \
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

#/* COPY ./vimrc /root/.vimrc */
COPY ./tmux.conf /root/.tmux.conf
#COPY ./zshrc /root/.zshrc

#/* RUN mkdir -p ~/.vim/bundle && \ */
#/*    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \ */
#/*    vim +PluginInstall +qall > /dev/null */

RUN curl -L https://bit.ly/janus-bootstrap | bash && \
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

WORKDIR /app
