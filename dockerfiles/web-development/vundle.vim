set nocompatible
filetype off

" Setting up Vundle - the vim plugin bundler
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets.git'
Plugin 'joonty/vdebug'
Plugin 'flazz/vim-colorschemes'
Plugin 'tmhedberg/matchit'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

