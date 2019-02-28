#!/bin/sh

stow -t ~ tmux
stow -t ~ zsh
stow -t ~ vim

cd vim/.vim
rake

