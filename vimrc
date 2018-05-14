" required
set nocompatible
filetype off

set nu

" UTF-8
set encoding=utf-8

" let code beautyful
let python_highlight_all=1
syntax on




" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead
" of Plugin)

" Auto indent
Plugin 'vim-scripts/indentpython.vim'

" Syntax check
Plugin 'scrooloose/syntastic'

" PEP8 style syntax check
Plugin 'nvie/vim-flake8'

" Browser file
Plugin 'scrooloose/nerdtree'
" use tab browser
Plugin 'jistr/vim-nerdtree-tabs'

" Super serach
Plugin 'kien/ctrlp.vim'



" All of your Plugins must be added before the following line
call vundle#end()



filetype plugin indent on

" Enable folding by input 'za'
set foldmethod=indent
set foldlevel=99


" PEP8 indent
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix




