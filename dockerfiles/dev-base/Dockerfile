FROM ubuntu:16.04
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>
ENV TERM screen-256color

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# add dev user
RUN useradd -ms /bin/zsh dev \
    && usermod -aG sudo dev
WORKDIR /home/dev
ENV PATH /home/dev/bin:$PATH

# Install global software
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

RUN gem install shopify_theme

USER dev
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN curl -L https://bit.ly/janus-bootstrap | bash

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/bin \
    && php -r "unlink('composer-setup.php');"

# Install user software
RUN npm install webpack
RUN pip install --upgrade --user \
        awscli \
        docker-compose

# Configure base system and add user
USER root
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Add and Link shared configration
ADD tmux.conf /home/dev/.tmux.conf
ADD zshrc /home/dev/.zshrc
ADD vimrc.before /home/dev/.vimrc.before
ADD vimrc.after /home/dev/.vimrc.after
RUN ln -s /var/shared/.ssh \
    && ln -s /var/shared/.gitconfig

# Setup user dev
#RUN mv /root/.vim /home/dev/ \
    #&& mv /root/.oh-my-zsh /home/dev \
    #&& ln -s /home/dev/.vim/janus/vim/vimrc /home/dev/.vimrc
RUN mkdir /var/shared \
    && touch /var/shared/placeholder \
    && chown -R dev:dev /var/shared \
    && chown -R dev:dev /home/dev

VOLUME /var/shared
USER dev

CMD ["/bin/zsh"]
