set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
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

call vundle#end()
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
filetype plugin indent on

map <F2> :NERDTreeToggle<CR>
map <F3> \be
