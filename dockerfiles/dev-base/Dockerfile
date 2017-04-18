FROM ubuntu:16.04
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
        less \
        locales \
        mc \
        #ngrok-server \
        #nodejs \
        #npm \
        php \
        php-xml \
        php-mbstring \
        php-mysql \
        python \
        python-pip \
        rake \
        ruby \
        sudo \
        tmux \
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
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') !== '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer corrupt'; unlink('composer-setup.php'); } " \
    && php composer-setup.php --install-dir=/usr/bin \
    && php -r "unlink('composer-setup.php');"
RUN wget -qO- https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar xvj -C /opt/ \
    && ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /bin/
RUN wget -qO- https://nodejs.org/dist/v6.10.2/node-v6.10.2-linux-x64.tar.xz | tar xvJ -C /opt/ \
    && ln -s /opt/node-v6.10.2-linux-x64/bin/node /bin/ \
    && ln -s /opt/node-v6.10.2-linux-x64/bin/npm /bin/
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
    && unzip ngrok-stable-linux-amd64.zip -d /opt/ \
    && rm ngrok-stable-linux-amd64.zip \
    && ln -s /opt/ngrok /bin/

# add dev user
RUN useradd -ms /bin/zsh dev && usermod -aG sudo,docker dev
RUN echo "dev:dev!" | chpasswd

WORKDIR /home/dev

# Install user software
USER dev
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN curl -L https://bit.ly/janus-bootstrap | bash
RUN mkdir /home/dev/.npm-global \
    && npm config set prefix '/home/dev/.npm-global' \
    && npm install -g webpack yo generator-fountain-webapp

# Add and Link shared configration
USER root
ADD tmux.conf /home/dev/.tmux.conf
ADD zshrc /home/dev/.zshrc
ADD vimrc.before /home/dev/.vimrc.before
ADD vimrc.after /home/dev/.vimrc.after

RUN mkdir /var/shared \
    && touch /var/shared/placeholder \
    && ln -s /var/shared/.ssh \
    && ln -s /var/shared/.gitconfig
RUN chown -R dev:dev /var/shared && chown -R dev:dev /home/dev

USER dev
VOLUME /var/shared
CMD ["/bin/zsh"]
