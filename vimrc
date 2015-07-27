set nocompatible
filetype off


" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'marcweber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'tomtom/tcomment_vim'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets.git'
Bundle 'joonty/vdebug'
Bundle 'flazz/vim-colorschemes'
Bundle 'tmhedberg/matchit'
Bundle 'bling/vim-airline'


if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80
syntax on
filetype plugin indent on

let NERDTreeShowHidden=1

map <F2> :NERDTreeToggle<CR>
:noremap <F3> :set hlsearch! hlsearch?<CR>
colorscheme 256-grayvim

