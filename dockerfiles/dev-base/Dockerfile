FROM ubuntu:16.04
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>
ENV TERM screen-256color

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get install -yq \
        sudo \
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

RUN gem install shopify_theme \
    && npm install -g webpack
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN useradd -ms /bin/zsh ubuntu && usermod -aG sudo ubuntu

USER ubuntu
WORKDIR /home/ubuntu

RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN curl -L https://bit.ly/janus-bootstrap | bash
COPY ./tmux.conf /home/ubuntu/.tmux.conf
COPY ./zshrc /home/ubuntu/.zshrc
COPY ./vimrc.before /home/ubuntu/.vimrc.before
COPY ./vimrc.after /home/ubuntu/.vimrc.after

CMD ["/bin/zsh"]
