FROM ubuntu:16.04
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>
ENV LANG en_US.UTF-8
ENV TERM screen-256color

RUN apt-get update

RUN apt-get install -yq \
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
        rails \
        ruby \
        docker.io \
        golang \
        python-pip \
        awscli \
        encfs \
        docker.io \
        docker-compose \
        owncloud-client? \
	&& rm -rf /var/lib/apt-lists/*

RUN curl -L https://bit.ly/janus-bootstrap | bash
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
# RUN install symfony
# RUN install laravel
#RUN curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > \
#    /usr/local/bin/docker-compose && \
#    chmod +x /usr/local/bin/docker-compose

COPY ./tmux.conf /root/.tmux.conf
COPY ./zshrc /root/.zshrc
COPY ./vimrc.before /root/.vimrc.before
COPY ./vimrc.after /root/.vimrc.after

WORKDIR /app

CMD ["/bin/zsh"]
