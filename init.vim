" Important vars
let $VIMHOME = $HOME."/.vim"

" Should be defaults
source $VIMHOME/essentials/index.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')
	" UI
	Plug 'kizza/actionmenu.nvim'
	Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
	Plug 'mhinz/vim-signify' " Git changes in gutter
	Plug 'tpope/vim-fugitive' " Git helper

	Plug 'tpope/vim-repeat' " Better repeat for key mappings

	Plug 'godlygeek/tabular'

	Plug 'vim-airline/vim-airline' " Status line
	Plug 'jeffkreeftmeijer/vim-numbertoggle' " Switch normal and relative numbers when go to INSERT/NORMAL mode
	Plug 'gorodinskiy/vim-coloresque' " Color display inside Vim

	Plug 'urbainvaes/vim-remembrall'

	Plug 'majutsushi/tagbar'

	Plug 'junegunn/goyo.vim'
	Plug 'takac/vim-hardtime'

	" Colorschemes
	Plug 'dracula/vim' " Dracula
	Plug 'skywind3000/vim-keysound' " Typewriter sound

	" File managment and search
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim' " Fuzzy find

	Plug 'brooth/far.vim' " Find and replace

	" Lint and syntax
	Plug 'benekastah/neomake' " Linter and automake

	Plug 'leafgarland/typescript-vim'
	Plug 'posva/vim-vue'
	Plug 'mustache/vim-mustache-handlebars'
	Plug 'amadeus/vim-mjml'

	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'kelwin/vim-smali', { 'for': 'smali' } " Syntax highlighting for smali
	Plug 'StanAngeloff/php.vim', { 'for': 'php' } " PHP syntax

	" Comment
	Plug 'scrooloose/nerdcommenter' " Better comments

	" Code generation and helpers
	Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown']} " TOC for README.md
	Plug 'plasticboy/vim-markdown'
	Plug 'shime/vim-livedown'

	Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'ejs', 'vue', 'mst'] } " Fast HTML

	Plug 'tpope/vim-surround' " For changing quotes/xml tags

	" Autocomplete
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

	Plug 'sunaku/vim-dasht' " dasht integration for VIM (for offline docs)
	Plug 'dbeniamine/cheat.sh-vim' " cht.sh in VIM

	Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Async program runner for Vim
	Plug 'idanarye/vim-vebugger' " Debugger

	Plug 'vim-vdebug/vdebug' " Debugger

	function! DoRemote(arg)
		UpdateRemotePlugins
	endfunction

	Plug 'ervandew/supertab' " Tab everywhere

	Plug 'Shougo/neosnippet'
	Plug 'Shougo/neosnippet-snippets'
	Plug 'nemanjan00/snippets'

	" Efficiency
	Plug 'metakirby5/codi.vim' " Realtime interpreter
	Plug 'vimwiki/vimwiki' " Vim wiki
	Plug 'blindFS/vim-taskwarrior' " Wrapper around task, for easier usage
	Plug 'editorconfig/editorconfig-vim' " Standarzided coding style for all IDEs
	Plug 'kana/vim-arpeggio' " Chord typing
	Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim' " Auto gist
	Plug 'jamessan/vim-gnupg' " Transparent gpg file editing

	" Must be loaded at the end
	Plug 'ryanoasis/vim-devicons' " Icons for file formats
	Plug 'jkramer/vim-checkbox' " For toggling md checkboxes
call plug#end()

let g:hardtime_default_on = 1

let g:float_preview#docked = 1

" Display spaces and tabs
set list
set listchars=tab:\|\ ,space:␣

" Tab control
set noexpandtab " TABS!!!
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" UI/UX
autocmd BufNewFile *.html silent! 0r $VIMHOME/templates/html.tpl

" Use linux clipboard
set clipboard+=unnamedplus

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set smartindent

set mat=2 " how many tenths of a second to blink

set background=dark
colorscheme dracula
let g:airline_theme='dracula'

hi Normal guibg=NONE ctermbg=NONE
set noshowmode

let g:airline_powerline_fonts = 1

set laststatus=2 " show the satus line all the time

if has('conceal')
	set conceallevel=0 concealcursor=niv
	autocmd FileType json set conceallevel=0
endif

"autocmd FileType * nested :call tagbar#autoopen(0)

let g:keysound_py_version = 3
let g:keysound_theme = 'typewriter'

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Mappings
source $VIMHOME/keybindings.vim

" Autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" Docs
let g:dasht_filetype_docsets = {}

let g:dasht_filetype_docsets['javascript'] = ['NodeJS', 'JavaScript']

" Make/lint
source $VIMHOME/functions/myonbattery.vim

if MyOnBattery()
	call neomake#configure#automake('rw')
else
	call neomake#configure#automake('rnw', 1000)
endif

" Gist
let g:gist_open_browser_after_post = 1

