"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')

	" Plug 'juanes852/Eclim-for-Neovim'

	" Debugger

	Plug 'joonty/vdebug', { 'for': ['php'] } " Debug for PHP

	Plug 'Shougo/vimproc.vim'
	Plug 'idanarye/vim-vebugger', { 'for': ['java', 'c', 'cpp'] }  " JDB and GDB

	" UI

	Plug 'suan/vim-instant-markdown'

	Plug 'rhysd/nyaovim-markdown-preview', { 'for': ['markdown'] }
	Plug 'bling/vim-airline' " cool status line

	Plug 'jeffkreeftmeijer/vim-numbertoggle' " Switch normal and relative numbers when go to INSERT/NORMAL mode
	Plug 'gorodinskiy/vim-coloresque' " Color display inside Vim

	" File managment and search

	Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
	Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
	Plug 'Xuyuanp/nerdtree-git-plugin' " Git for nerdtree

	" Lint and syntax

	Plug 'benekastah/neomake' " Linter
	Plug 'kelwin/vim-smali', { 'for': 'smali' } " Syntax highlighting for smali

	Plug 'StanAngeloff/php.vim', { 'for': 'php' } " PHP syntax

	" Comment

	Plug 'scrooloose/nerdcommenter'

	" Code generation and helpers

	Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml'] } " Fast HTML
	Plug 'Dinduks/vim-java-get-set', { 'for': 'java' } " Java getter/setter generator

	" Autocomplete

	Plug 'Shougo/deoplete.nvim'

	Plug 'Shougo/neocomplcache'

	Plug 'Shougo/neosnippet.vim'
	Plug 'Shougo/neosnippet-snippets'

	" colorschemes
	Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" On save
autocmd! BufWritePost * Neomake " Lint

" On open
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t")) " Change tmux title

" Shortcut settings

let g:vebugger_leader = "č"

let maplocalleader = '.' 
let mapleader = ','

" Settings

filetype plugin on

" Use linux clipboard
set clipboard+=unnamedplus

set autoread " detect when a file is changed

" Display spaces and tabs
set list
set listchars=tab:\|\ ,space:␣

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set noexpandtab " TABS!!!
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" Display relative numbers
set relativenumber

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set conceallevel=0

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

set encoding=utf8

set background=dark
colorscheme PaperColor

let g:airline_theme='PaperColor'

set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Run
nmap <leader>e :below 30sp term://./start.sh<cr>i<cr>

"Debug
nmap <leader>w :call JdbStart()<cr>

map <C-t> :%retab!<cr>

map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc
map <leader>wc :wincmd q<cr>

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

function! JdbStart()
	!gradle build
	call vebugger#jdb#start('com.mycompany.app.App',{'classpath':'build/classes/main','srcpath':'src/main/java','args':[]})
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Disable auto instant markdown
let g:instant_markdown_autostart = 0

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
" nmap <silent> <leader>r :CtrlPBuffer<cr>
" let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
			\ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
			\ 'file': '\.exe$\|\.so$'
			\ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:neocomplcache_enable_at_startup = 1

let g:ctrlp_working_path_mode = 2

let g:easytags_syntax_keyword = 'always'

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
	set conceallevel=0 concealcursor=niv
endif

