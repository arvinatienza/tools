FROM ubuntu:18.04
MAINTAINER Arvin Atienza <arvin.atienza@gmail.com>

# Install global software
RUN apt-get update && apt-get install -yq \
      ansible \
      aptitude \
	&& rm -rf /var/lib/apt-lists/*

# configure base system
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM screen-256color
ENV EDITOR vim

# add dev user
RUN useradd -ms /bin/zsh dev && usermod -aG sudo,docker dev
RUN echo "dev:dev!" | chpasswd
RUN mkdir /var/shared && touch /var/shared/placeholder

# Install user software
USER dev
WORKDIR /home/dev

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
