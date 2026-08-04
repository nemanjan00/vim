" Pin the python provider to the global asdf python so virtualenvs and
" per-project .tool-versions can't break it (same trick as node in init.vim)
let s:python = substitute(system("cd ~ && asdf which python3 2>/dev/null"), "\n", '', 'g')
if v:shell_error != 0 || empty(s:python)
	let s:python = substitute(system("which python3"), "\n", '', 'g')
endif
let g:python3_host_prog = s:python

function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

set termguicolors
set t_Co=256 " 256 Colors in terminal
set autoread " detect when a file is changed
filetype plugin on " Filetype detection
set number relativenumber " Display relative numbers
set mouse=a " Add mouse support

set nocompatible

set cursorline
set cursorcolumn

" switch syntax highlighting on
syntax enable
set showmatch " show matching braces

autocmd FileType asm set ft=nasm
autocmd FileType conf set ft=dosini
autocmd FileType ini set ft=dosini
au BufNewFile,BufRead *.ejs set filetype=html

set encoding=utf8

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

