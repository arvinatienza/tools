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
        php-mysql \
	&& rm -rf /var/lib/apt-lists/*

RUN gem install shopify_theme \
    && npm install -g webpack
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN useradd -ms /bin/zsh dev && usermod -aG sudo dev

WORKDIR /home/dev

ENV PATH /home/dev/bin:$PATH
RUN mkdir /var/shared && touch /var/shared/placeholder && chown -R dev:dev /var/shared
VOLUME /var/shared
RUN ln -s /var/shared/.ssh
RUN ln -s /var/shared/.gitconfig

RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN curl -L https://bit.ly/janus-bootstrap | bash
RUN mv /root/.vim /home/dev/ \
    && mv /root/.oh-my-zsh /home/dev \
    && ln -s /home/dev/.vim/janus/vim/vimrc /home/dev/.vimrc

ADD tmux.conf /home/dev/.tmux.conf
ADD zshrc /home/dev/.zshrc
ADD vimrc.before /home/dev/.vimrc.before
ADD vimrc.after /home/dev/.vimrc.after
RUN chown -R dev:dev /home/dev

USER dev

CMD ["/bin/zsh"]
