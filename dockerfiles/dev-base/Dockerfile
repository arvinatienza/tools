FROM ubuntu:16.04
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

# Install global software
RUN apt-get update
RUN apt-get install -yq \
        ack-grep \
        awscli \
        curl \
        docker.io \
        exuberant-ctags \
        git \
        groff \
        less \
        locales \
        mc \
        python \
        rake \
        ruby \
        sudo \
        tmux \
        vim \
        wget \
        zsh \
	&& rm -rf /var/lib/apt-lists/*

# Continue installing global software
RUN gem install shopify_theme
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN curl -L https://bit.ly/janus-bootstrap | bash

# add dev user
RUN useradd -ms /bin/zsh dev && usermod -aG sudo,docker dev
RUN echo "dev:dev!" | chpasswd

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PATH /home/dev/bin:$PATH
ENV TERM screen-256color

RUN mv /root/.vim /home/dev/ \
    && mv /root/.oh-my-zsh /home/dev \
    && ln -s /home/dev/.vim/janus/vim/vimrc /home/dev/.vimrc

WORKDIR /home/dev

# Install user software
#RUN npm install webpack
#RUN pip install --upgrade --user \
        #awscli \
        #docker-compose

# Configure base system and add user
#USER root
#RUN ln -s /usr/bin/nodejs /usr/bin/node

# Add and Link shared configration
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
#RUN pip install --upgrade --user awscli
#RUN npm install webpack bower node-sass

VOLUME /var/shared
CMD ["/bin/zsh"]
