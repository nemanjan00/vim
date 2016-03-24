"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')

" Debugger

Plug 'joonty/vdebug' " Debug for PHP, Python, Ruby, Perl, Tcl and NodeJS
Plug 'vim-scripts/Conque-GDB' " GDB

Plug 'Shougo/vimproc.vim'
Plug 'idanarye/vim-vebugger'

" UI

Plug 'rhysd/nyaovim-markdown-preview'
Plug 'bling/vim-airline' " cool status line

" File managment and search

Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plug 'Xuyuanp/nerdtree-git-plugin' " Git for nerdtree

" Lint and syntax

Plug 'StanAngeloff/php.vim' " PHP syntax
Plug 'benekastah/neomake' " Linter
Plug 'jeffkreeftmeijer/vim-numbertoggle' " Switch normal and relative numbers when go to INSERT/NORMAL mode

" Comment

Plug 'scrooloose/nerdcommenter'

" Code generation and helpers

Plug 'mattn/emmet-vim' " Fast HTML
Plug 'KabbAmine/vCoolor.vim' " Color insert
Plug 'gorodinskiy/vim-coloresque' " Color display inside Vim
Plug 'Dinduks/vim-java-get-set' " Java getter/setter generator

" Autocomplete

Plug 'Shougo/deoplete.nvim'

Plug 'Shougo/neocomplcache'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Markdown
Plug 'suan/vim-instant-markdown'

" colorschemes
Plug 'gosukiwi/vim-atom-dark'

" Add plugins to &runtimepath
call plug#end()

filetype plugin on

" Lint on save
autocmd! BufWritePost * Neomake

let g:vebugger_leader = "č"
let maplocalleader = '.' 
let mapleader = ','


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
colorscheme atom-dark-256

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

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

let g:vcoolor_map = '<C-c>'

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
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
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
  set conceallevel=2 concealcursor=niv
endif

