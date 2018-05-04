FROM ubuntu:16.04
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

# Install global software
RUN apt-get update && apt-get install -yq \
      ack-grep \
      curl \
      docker.io \
      exuberant-ctags \
      fuse \
      git \
      git-flow \
      groff \
      jq \
      libappindicator1 \
      libgconf-2-4 \
      locales \
      lsb-release \
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
      tmuxinator \
      tree \
      vim \
      wget \
      zsh \
	&& rm -rf /var/lib/apt-lists/*

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash \
  && apt-get install git-lfs

RUN curl -O https://prerelease.keybase.io/keybase_amd64.deb \
  && dpkg -i keybase_amd64.deb

# configure base system
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PATH /home/dev/bin:/home/dev/.npm-global/bin:$PATH
ENV TERM screen-256color
ENV EDITOR vim

# Continue installing global software
# TDOD: move this to another project similar to node projects
RUN gem install shopify_theme

RUN pip install --upgrade \
      awscli \
      docker-compose
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip?_ga=2.268116363.466504797.1519324486-1474700218.1519324486 \
      && unzip /tmp/terraform.zip \
      && mv terraform /usr/local/bin
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
      && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
      && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
      && apt-get update && apt-get install -yq \
          google-cloud-sdk \
          kubectl
ADD lib/todo.txt-cli /tmp/todo.txt-cli
RUN cd /tmp/todo.txt-cli && make && make install

RUN mkdir /var/shared && touch /var/shared/placeholder

# add dev user
RUN useradd -ms /bin/zsh dev && usermod -aG sudo,docker dev
RUN echo "dev:dev!" | chpasswd

# Install user software
USER dev
WORKDIR /home/dev
RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
RUN curl -L https://bit.ly/janus-bootstrap | bash
ADD vim-plugins /home/dev/.janus
ADD tmux.conf /home/dev/.tmux.conf
ADD zshrc /home/dev/.zshrc
ADD zsh_aliases /home/dev/.zsh_aliases
ADD vimrc.before /home/dev/.vimrc.before
ADD vimrc.after /home/dev/.vimrc.after
ADD power-overwhelming-ascii.txt /home/dev/power-overwhelming-ascii.txt

RUN ln -s /var/shared/.aws \
    && ln -s /var/shared/.gitconfig \
    && ln -s /var/shared/.gnupg \
    && ln -s /var/shared/.ssh \
    && ln -s /var/shared/.todo \
    && ln -s /var/shared/.vim-sessions
RUN chown -R dev:dev /var/shared && chown -R dev:dev /home/dev

VOLUME /var/shared
CMD ["/bin/zsh"]
