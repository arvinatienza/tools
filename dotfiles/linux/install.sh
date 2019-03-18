#!/bin/sh

sudo apt-get update
sudo apt-get install \
      ack-grep \
      curl \
      docker.io \
      exuberant-ctags \
      git \
      git-flow \
      gnupg2 \
      groff \
      jq \
      mc \
      psmisc \
      python \
      python-pip \
      rake \
      ruby \
      stow \
      tidy \
      tmux \
      tmuxinator \
      tree \
      vim \
      wget \
      zsh \

sudo pip install awscli

stow -t ~ tmux
stow -t ~ zsh
stow -t ~ vim

cd vim/.vim
rake

