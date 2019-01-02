" required
set nocompatible
filetype off

set nu

set ruler

set cursorline

" set column color
" set cursorcolumn


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

set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim
" These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256
let g:minBufExplForceSyntaxEnable = 1
" These lines use python3 if you install python3, otherwise use python
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
if ! has('gui_runing')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au insertEnter * set timeoutlen=0
		au insertLeave * set timeoutlen=1000
	augroup END
endif
set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ powerline:h14
set noshowmode " Hide the defaults mode test(e.g. --INSERT --below the statusline

"F5 run code
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
	exec "w"
if &filetype == 'c'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype == 'cpp'
	exec "!g++ % -o %<"
	exec "!time ./%<"
elseif &filetype == "java"
	exec "!javac %"
	exec "!time java %<"
elseif &filetype == "sh"
	:!time zsh %
elseif &filetype == 'python'
	exec "!time python %"
elseif &filetype == 'html'
	exec "!firefox % &"
elseif &filetype == 'go'
	exec "!go build %<"
	exec "!time go run %"
elseif &filetype == 'mkd'
	exec "!~/.vim/markdown.pl % > %.html &"
	exec "!firefox %.html &"
endif
    endfunc

