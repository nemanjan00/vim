" Important vars
let $VIMHOME = $HOME."/.vim"

"let g:ale_completion_enabled = 1

" Should be defaults
source $VIMHOME/essentials/index.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')
	" Dependencies
	Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Async program runner for Vim

	" UI
	Plug 'kizza/actionmenu.nvim'
	Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
	Plug 'mhinz/vim-signify' " Git changes in gutter
	Plug 'tpope/vim-fugitive' " Git helper
	Plug 'rhysd/committia.vim'
	Plug 'tpope/vim-repeat' " Better repeat for key mappings
	Plug 'Dimercel/todo-vim'
	"Plug 'godlygeek/tabular'
	Plug 'junegunn/vim-peekaboo' " Show content of registers
	Plug 'vim-airline/vim-airline' " Status line
	Plug 'jeffkreeftmeijer/vim-numbertoggle' " Switch normal and relative numbers when go to INSERT/NORMAL mode
	Plug 'ap/vim-css-color' " Color display inside Vim
	Plug 'urbainvaes/vim-remembrall' " Give a peek at key bindings
	Plug 'majutsushi/tagbar' " Show map of te file
	"Plug 'takac/vim-hardtime' " Helper for learning vim coding by disabling hjkl
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'luochen1990/rainbow' " Rainbow Parentheses
	Plug 'tpope/vim-speeddating' " Date increment/decrement
	Plug 'airblade/vim-rooter' " Project root finder
	Plug 'google/vim-searchindex' " Search result indexes
	Plug 'bkad/camelcasemotion' " Make Vim understand camelcase
	Plug 'stevearc/vim-arduino' " Support for Arduino
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'liuchengxu/vista.vim'

	" Colorschemes
	Plug 'dracula/vim' " Dracula
	Plug 'chriskempson/base16-vim'
	Plug 'kjssad/quantum.vim' " Quantum theme
	Plug 'skywind3000/vim-keysound' " Typewriter sound

	" File managment and search
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim' " Fuzzy find

	Plug 'brooth/far.vim' " Find and replace

	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Lint and syntax
	Plug 'benekastah/neomake' " Linter and automake
	Plug 'sheerun/vim-polyglot'
	Plug 'leafgarland/typescript-vim'
	Plug 'posva/vim-vue'
	Plug 'mustache/vim-mustache-handlebars'
	Plug 'amadeus/vim-mjml'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'kelwin/vim-smali', { 'for': 'smali' } " Syntax highlighting for smali
	Plug 'StanAngeloff/php.vim', { 'for': 'php' } " PHP syntax
	Plug 'udalov/kotlin-vim'
	Plug 'heavenshell/vim-jsdoc'
	Plug 'gisphm/vim-gitignore'

	" Code generation and helpers
	Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown']} " TOC for README.md
	Plug 'plasticboy/vim-markdown'

	Plug 'scrooloose/nerdcommenter' " Better comments

	Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'ejs', 'vue', 'mst'] } " Fast HTML
	Plug 'tpope/vim-surround' " For changing quotes/xml tags

	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}, 'for':['javascript', 'css', 'html', 'php', 'vue']}

	Plug 'hsanson/vim-android'
	Plug 'dense-analysis/ale'

	Plug 'sunaku/vim-dasht' " dasht integration for VIM (for offline docs)
	Plug 'dbeniamine/cheat.sh-vim' " cht.sh in VIM

	Plug 'idanarye/vim-vebugger' " Debugger
	Plug 'vim-vdebug/vdebug' " Debugger

	" Autocomplete
	"Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
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
	Plug 'rhysd/vim-grammarous'

	" Must be loaded at the end
	Plug 'ryanoasis/vim-devicons' " Icons for file formats
	Plug 'jkramer/vim-checkbox' " For toggling md checkboxes
call plug#end()

" Make Vim disable hjkl, arrows, etc
let g:hardtime_default_on = 1

let g:UltiSnipsSnipMateDirectories = ["Ultisnips"]

" Display spaces and tabs
set list
set listchars=tab:\|\ ,space:␣,eol:↲

" Tab control
set noexpandtab " TABS!!!
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

"if exists('&colorcolumn')
	"set colorcolumn=80
"endif

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" UI/UX
autocmd BufNewFile *.html silent! 0r $VIMHOME/templates/html.tpl
autocmd BufNewFile *.c silent! 0r $VIMHOME/templates/c.tpl

let g:rainbow_active = 1

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

" Theming

set background=dark
"set termguicolors

function! HasColorscheme(name) abort
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

"if HasColorscheme('quantum')
	"colorscheme quantum
"endif

colorscheme dracula

let g:airline_theme='dracula'

" airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

hi Normal guibg=NONE ctermbg=NONE
set noshowmode

let g:airline_powerline_fonts = 1

set laststatus=2 " show the satus line all the time

" Conceal

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

" Docs
let g:dasht_filetype_docsets = {}

let g:dasht_filetype_docsets['javascript'] = ['NodeJS', 'JavaScript']

" Make/lint
source $VIMHOME/functions/myonbattery.vim

g:neomake_java_enabled_makers = []

try
	if MyOnBattery()
		call neomake#configure#automake('rw')
	else
		call neomake#configure#automake('rnw', 1000)
	endif
endtry

" Gist
let g:gist_open_browser_after_post = 1

highlight NonText ctermfg=8 guifg=gray


" Android

call airline#parts#define_function(
\ 'gradle-running',
\ 'lightline#gradle#running'
\)

call airline#parts#define_function(
\ 'gradle-errors',
\ 'lightline#gradle#errors'
\)

call airline#parts#define_function(
\ 'gradle-warnings',
\ 'lightline#gradle#warnings'
\)

call airline#parts#define_function(
\ 'gradle-project',
\ 'lightline#gradle#project'
\)

let g:airline_section_x= airline#section#create_right([
\ 'filetype',
\ 'gradle-running',
\ 'gradle-errors',
\ 'gradle-warnings'
\])

let g:gradle_glyph_building = ''
let g:gradle_glyph_warning = ''
let g:gradle_glyph_error = ''
let g:gradle_glyph_android = ''
let g:gradle_glyph_gradle = ''

let g:gradle_loclist_show=1
let g:gradle_async=0

let g:ale_linters = {
\ 'xml': ['android'],
\ 'groovy': ['android'],
\ 'java': ['android', 'javalsp'],
\ 'kotlin': ['android', 'ktlint', 'languageserver']
\ }

let g:ale_java_javalsp_executable='/home/nemanjan00/java-language-server/dist/lang_server_linux.sh'

let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
\ 'java': ['ale'],
\})

