" required
set nocompatible
filetype off

set nu

" UTF-8
set encoding=utf-8

" let code beautyful
let python_highlight_all=1
syntax on



" set the runtim path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call undle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older version of Vundle used Bundle instead of Plugin)

" Auto indent
Plugin 'vim-scripts/indentpython.vim'

" Syntax check
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

" Display blank
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h, match BadWhitespace /\s\+$/

" Auto open NERDTree
" autocmd vimenter * NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"NERDTree key
map <Tab> :NERDTreeMirror<CR>
map <Tab> :NERDTreeToggle<CR>
