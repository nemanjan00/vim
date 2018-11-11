" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')
	" UI
	Plug 'mhinz/vim-signify' " Git changes in gutter
	Plug 'tpope/vim-fugitive' " Git helper

	Plug 'metakirby5/codi.vim' " Realtime interpreter
	Plug 'vimwiki/vimwiki' " Vim wiki
	Plug 'tpope/vim-repeat' " Better repeat for key mappings

	Plug 'vim-airline/vim-airline' " Status line
	Plug 'jeffkreeftmeijer/vim-numbertoggle' " Switch normal and relative numbers when go to INSERT/NORMAL mode
	Plug 'gorodinskiy/vim-coloresque' " Color display inside Vim
	Plug 'ryanoasis/vim-devicons' " Icons for file formats

	" Colorschemes
	Plug 'dracula/vim' " Dracula
	Plug 'skywind3000/vim-keysound' " Typewriter sound

	" File managment and search
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim' " Fuzzy find

	Plug 'brooth/far.vim' " Find and replace

	" Lint and syntax
	Plug 'benekastah/neomake' " Linter and automake

	Plug 'kelwin/vim-smali', { 'for': 'smali' } " Syntax highlighting for smali
	Plug 'StanAngeloff/php.vim', { 'for': 'php' } " PHP syntax

	" Comment
	Plug 'scrooloose/nerdcommenter' " Better comments

	" Code generation and helpers
	Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown']} " TOC for README.md

	Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'ejs', 'vue'] } " Fast HTML

	Plug 'tpope/vim-surround' " For changing quotes/xml tags

	" Autocomplete
	Plug 'autozimu/LanguageClient-neovim', {
		\ 'branch': 'next',
		\ 'do': 'bash install.sh',
		\ } " Client for langserver

	Plug 'sunaku/vim-dasht' " dasht integration for VIM (for offline docs)
	Plug 'dbeniamine/cheat.sh-vim' " cht.sh in VIM

	Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Async program runner for Vim
	Plug 'idanarye/vim-vebugger' " Debugger

	Plug 'vim-vdebug/vdebug' " Debugger

	function! DoRemote(arg)
		UpdateRemotePlugins
	endfunction

	Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')} " Autocomplete
	Plug 'ervandew/supertab'

	Plug 'ternjs/tern_for_vim'
	Plug 'carlitux/deoplete-ternjs'

	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'mhartington/nvim-typescript'
	Plug 'Shougo/neosnippet'
	Plug 'Shougo/neosnippet-snippets'
	Plug 'nemanjan00/snippets'

	" Efficiency
	Plug 'editorconfig/editorconfig-vim'
	Plug 'kana/vim-arpeggio'
	Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'jamessan/vim-gnupg'

	" Must be loaded at the end
	Plug 'ryanoasis/vim-devicons'
	Plug 'jkramer/vim-checkbox'
call plug#end()

set nocompatible " No need for Vi specific commands

set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

set t_Co=256

" Neomake
call neomake#configure#automake('rw')
set autoread " detect when a file is changed

" Shortcut settings
let maplocalleader = '.' 
let mapleader = ','

" Settings
filetype plugin on

" Use linux clipboard
set clipboard+=unnamedplus

" Display spaces and tabs
set list
set listchars=tab:\|\ ,space:␣

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set noexpandtab " TABS!!!
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" Display relative numbers
set number relativenumber

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" switch syntax highlighting on
syntax enable

autocmd FileType asm set ft=nasm
autocmd FileType conf set ft=dosini
autocmd FileType ini set ft=dosini

au BufNewFile,BufRead *.ejs set filetype=html

set encoding=utf8

set background=dark
colorscheme dracula
let g:airline_theme='dracula'

hi Normal guibg=NONE ctermbg=NONE

let g:airline_powerline_fonts = 1

set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time

let g:keysound_py_version = 3
let g:keysound_theme = 'typewriter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-y> :%y+<cr>

map <C-t> :%retab!<cr>
map <C-M-t> :set tabstop=2<cr> :%retab!<cr> :set tabstop=4<cr>

map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc
map <leader>wc :wincmd q<cr>

if has("nvim")
	" Exit terminal mode
	tnoremap <Esc> <C-\><C-n>
endif

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Chorded typing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call arpeggio#map('i', '', 0, 'jk', '<Esc>')
call arpeggio#map('i', '', 0, 'wq', '<Esc>:wq<cr>')
call arpeggio#map('i', '', 0, 'fn', 'function')
call arpeggio#map('i', '', 0, 'rq', 'require')
call arpeggio#map('i', '', 0, 'md', 'module.exports = function(){}')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.vim/functions/winmove.vim

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

let g:dasht_filetype_docsets = {}

let g:dasht_filetype_docsets['javascript'] = ['NodeJS', 'JavaScript']

source $HOME/.vim/autocomplete/servercommands.vim

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings 
let g:LanguageClient_settingsPath = '/home/nemanjan00/.config/nvim/settings.json'

" Plugin key-mappings.
imap <C-k>		 <Plug>(neosnippet_expand_or_jump)
smap <C-k>		 <Plug>(neosnippet_expand_or_jump)
xmap <C-k>		 <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \		 "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
	set conceallevel=2 concealcursor=niv
	autocmd FileType json set conceallevel=0
endif

" FZF

map <C-p> :FZF<cr>
map <M-a> :Ag<cr>

" Gist

map <C-g> :Gist -p<cr>
map <C-M-g> :Gist<cr>
let g:gist_open_browser_after_post = 1

