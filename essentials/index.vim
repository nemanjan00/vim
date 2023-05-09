" Figume out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
	let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
	let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

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

