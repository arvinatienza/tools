FROM ubuntu:17.04
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

# Install global software
RUN apt-get update
RUN apt-get install -yq \
        ack-grep \
        curl \
        docker.io \
        exuberant-ctags \
        git \
        groff \
        locales \
        mc \
        npm \
        php \
        python \
        python-pip \
        rake \
        ruby \
        sudo \
        tidy \
        tmux \
        tree \
        vim \
        wget \
        zsh \
	&& rm -rf /var/lib/apt-lists/*

# configure base system
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PATH /home/dev/bin:/home/dev/.npm-global/bin:$PATH
ENV TERM screen-256color

# Continue installing global software
RUN gem install shopify_theme
RUN pip install --upgrade \
        awscli \
        docker-compose

# add dev user
RUN useradd -ms /bin/zsh dev && usermod -aG sudo,docker dev
RUN echo "dev:dev!" | chpasswd

WORKDIR /home/dev

# Install user software
USER dev
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN curl -L https://bit.ly/janus-bootstrap | bash
RUN mkdir /home/dev/.janus \
    && cd /home/dev/.janus \
    && git clone https://github.com/leafgarland/typescript-vim.git \
    && git clone https://github.com/lumiliet/vim-twig \
    && git clone https://github.com/mattn/emmet-vim.git \
    && git clone https://github.com/tpope/vim-liquid.git

# Add and Link shared configration
USER root
ADD tmux.conf /home/dev/.tmux.conf
ADD zshrc /home/dev/.zshrc
ADD zsh_aliases /home/dev/.zsh_aliases
ADD vimrc.before /home/dev/.vimrc.before
ADD vimrc.after /home/dev/.vimrc.after

RUN mkdir /var/shared \
    && touch /var/shared/placeholder \
    && ln -s /var/shared/.ssh \
    && ln -s /var/shared/.gitconfig \
    && ln -s /var/shared/.aws
RUN chown -R dev:dev /var/shared && chown -R dev:dev /home/dev

USER dev
VOLUME /var/shared
CMD ["/bin/zsh"]
