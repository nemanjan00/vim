au BufNewFile,BufRead *.ejs set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')
	" UI

	Plug 'johngrib/vim-game-code-break'

	Plug 'mhinz/vim-signify'

	Plug 'vim-airline/vim-airline'

	Plug 'jeffkreeftmeijer/vim-numbertoggle' " Switch normal and relative numbers when go to INSERT/NORMAL mode
	Plug 'gorodinskiy/vim-coloresque' " Color display inside Vim

	" Colorschemes

	Plug 'iCyMind/NeoSolarized'

	Plug 'vim-airline/vim-airline-themes'

	" File managment and search

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	Plug 'brooth/far.vim'

	" Lint and syntax

	Plug 'benekastah/neomake' " Linter

	Plug 'kelwin/vim-smali', { 'for': 'smali' } " Syntax highlighting for smali
	Plug 'StanAngeloff/php.vim', { 'for': 'php' } " PHP syntax

	" Comment

	Plug 'scrooloose/nerdcommenter'

	" Code generation and helpers

	Plug 'mzlogin/vim-markdown-toc'

	Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'ejs'] } " Fast HTML

	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'

	" Autocomplete

	function! DoRemote(arg)
		UpdateRemotePlugins
	endfunction

	Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')}
	Plug 'ervandew/supertab'

	Plug 'artur-shaik/vim-javacomplete2'

	Plug 'ternjs/tern_for_vim'
	Plug 'carlitux/deoplete-ternjs'

	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'mhartington/nvim-typescript'

	Plug 'Shougo/neosnippet'
	Plug 'Shougo/neosnippet-snippets'

	"Plug 'cyansprite/Extract'

	" Efficiency

	Plug 'wakatime/vim-wakatime'

	Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'

	Plug 'tpope/vim-fugitive'

	" Must be loaded at the end

	Plug 'ryanoasis/vim-devicons'
call plug#end()

set nocompatible " No need for Vi specific commands

" Commands

" Neomake
autocmd! BufWritePost * Neomake " Lint

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

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

set encoding=utf8

set background=dark
colorscheme NeoSolarized

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

set autoindent " automatically set indent of new line
set smartindent

set laststatus=2 " show the satus line all the time

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
" => Window movement
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

function! CommentLine()
	let original_cursor_position = getpos('.')
	
	exe "normal ^i//\e"

	call setpos('.', original_cursor_position)

	exe "normal 2l"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

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
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'

map <C-M-P> :Ag<cr>

" Gist

map <C-g> :Gist -p<cr>
map <C-M-g> :Gist<cr>
let g:gist_open_browser_after_post = 1

