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
      gnupg2 \
      groff \
      jq \
      libappindicator1 \
      libgconf-2-4 \
      locales \
      lsb-release \
      mc \
      psmisc \
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

# configure base system
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM screen-256color
ENV EDITOR vim

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash  && apt-get install git-lfs
RUN curl -O https://prerelease.keybase.io/keybase_amd64.deb && dpkg -i keybase_amd64.deb
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && unzip /tmp/terraform.zip && mv terraform /usr/local/bin

RUN pip install --upgrade awscli docker-compose

RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
      && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
      && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
      && apt-get update && apt-get install -yq \
          google-cloud-sdk \
          kubectl

# add dev user
RUN useradd -ms /bin/zsh dev && usermod -aG sudo,docker dev
RUN echo "dev:dev!" | chpasswd
RUN mkdir /var/shared && touch /var/shared/placeholder

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

# setup home folder
USER root
RUN ln -s /var/shared/.aws \
    && ln -s /var/shared/.gitconfig \
    && ln -s /var/shared/.gnupg \
    && ln -s /var/shared/.ssh \
    && ln -s /var/shared/.vim-sessions \
    && ln -s /var/shared/.tmuxinator
RUN chown -R dev:dev /var/shared && chown -R dev:dev /home/dev

USER dev

VOLUME /var/shared
CMD ["/bin/zsh"]
