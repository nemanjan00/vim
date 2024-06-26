" Important vars
let $VIMHOME = $HOME."/.config/nvim"

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
	Plug 'mhinz/vim-signify' " Git changes in gutter
	Plug 'tpope/vim-fugitive' " Git helper
	Plug 'rhysd/committia.vim'
	Plug 'tpope/vim-repeat' " Better repeat for key mappings
	Plug 'junegunn/vim-peekaboo' " Show content of registers
	Plug 'vim-airline/vim-airline' " Status line
	Plug 'jeffkreeftmeijer/vim-numbertoggle' " Switch normal and relative numbers when go to INSERT/NORMAL mode
	Plug 'ap/vim-css-color' " Color display inside Vim
	Plug 'urbainvaes/vim-remembrall' " Give a peek at key bindings
	Plug 'ntpeters/vim-better-whitespace'
	"Plug 'luochen1990/rainbow' " Rainbow Parentheses
	Plug 'airblade/vim-rooter' " Project root finder
	Plug 'google/vim-searchindex' " Search result indexes
	Plug 'bkad/camelcasemotion' " Make Vim understand camelcase
	Plug 'liuchengxu/vista.vim'
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'junegunn/gv.vim'
	Plug 'retorillo/istanbul.vim'
	Plug 'RRethy/vim-illuminate'

	"Plug 'github/copilot.vim'

	Plug 'metakirby5/codi.vim' " Realtime runtime

	" Colorschemes
	Plug 'dracula/vim' " Dracula

	" File managment and search
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim' " Fuzzy find
	Plug 'brooth/far.vim' " Find and replace

	" Lint and syntax
	Plug 'benekastah/neomake' " Linter and automake
	"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	Plug 'jwalton512/vim-blade'

	Plug 'neoclide/jsonc.vim'
	Plug 'smerrill/vcl-vim-plugin'
	Plug 'tpope/vim-dotenv'
	Plug 'robbles/logstash.vim'
	Plug 'pearofducks/ansible-vim'
	Plug 'leafgarland/typescript-vim'
	Plug 'posva/vim-vue', { 'for': 'vue' }
	Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
	Plug 'terminalnode/sway-vim-syntax'
	Plug 'Snape3058/vim-smali', { 'for': 'smali' } " Syntax highlighting for smali
	Plug 'StanAngeloff/php.vim', { 'for': 'php' } " PHP syntax
	Plug 'udalov/kotlin-vim'
	Plug 'elubow/cql-vim'
	Plug 'zsiciarz/caddy.vim'
	Plug 'sirtaj/vim-openscad'

	Plug 'yaegassy/coc-jsdoc', {'do': 'yarn install --frozen-lockfile'}

	"Plug 'heavenshell/vim-jsdoc', {
		"\ 'for': ['javascript', 'javascript.jsx','typescript'],
		"\ 'do': 'make install'
	"\}

	Plug 'gisphm/vim-gitignore'
	Plug 'chr4/nginx.vim'
	Plug 'pangloss/vim-javascript', { 'for': [ 'js' ] }
	Plug 'zimbatm/haproxy.vim'
	Plug 'plasticboy/vim-markdown', { 'for': ['markdown']}

	Plug 'Shougo/neosnippet.vim'
	Plug 'nemanjan00/snippets'
	Plug 'Shougo/neosnippet-snippets'

	" Code generation and helpers
	Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown']} " TOC for README.md
	Plug 'scrooloose/nerdcommenter' " Better comments
	Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'ejs', 'vue', 'mst'] } " Fast HTML
	Plug 'tpope/vim-surround' " For changing quotes/xml tags
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
	Plug 'dense-analysis/ale'
	Plug 'alvan/vim-closetag'

	" Efficiency
	Plug 'editorconfig/editorconfig-vim' " Standarzided coding style for all IDEs
	Plug 'kana/vim-arpeggio' " Chord typing
	Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim' " Auto gist
	Plug 'jamessan/vim-gnupg' " Transparent gpg file editing

	" Golang
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" Must be loaded at the end
	Plug 'ryanoasis/vim-devicons' " Icons for file formats
	Plug 'jkramer/vim-checkbox' " For toggling md checkboxes
call plug#end()

" Display spaces and tabs
set list
set listchars=tab:\|\ ,space:␣,eol:↲

let g:ale_disable_lsp = 1
" Use different highlighting to point out problems
let g:ale_set_highlights = 1

" Use the sign column (far left) to point out problems
let g:ale_set_signs = 1

" Symbols to use if g:ale_set_signs is enabled
let g:ale_sign_error = ' X'
let g:ale_sign_warning = ' !'

" Tab control
set noexpandtab " TABS!!!
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" Persistent undo
set undofile
set undodir=~/.vim/undo

if exists('&colorcolumn')
	set colorcolumn=80
endif

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" UI/UX
autocmd BufNewFile *.html silent! 0r $VIMHOME/templates/html.tpl
autocmd BufNewFile *.c silent! 0r $VIMHOME/templates/c.tpl

let g:rainbow_active=1

let g:vue_disable_pre_processors=1

" Use linux clipboard
set clipboard+=unnamedplus

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set smartindent

set mat=2 " how many tenths of a second to blink

" Theming

"set termguicolors

set background=dark

"colorscheme PaperColor
colorscheme dracula
let g:airline_theme='dracula'

hi Comment guifg=#ABCDEF

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
	set conceallevel=0
endif

"autocmd FileType * nested :call tagbar#autoopen(0)

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Mappings
source $VIMHOME/keybindings.vim

" Make/lint
source $VIMHOME/functions/myonbattery.vim

let g:neomake_java_enabled_makers = []

try
	if MyOnBattery()
		call neomake#configure#automake('rw')
	else
		call neomake#configure#automake('rnw', 1000)
	endif
endtry

" Gist
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

highlight NonText ctermfg=8 guifg=gray

source $VIMHOME/functions/sourceifexists.vim
call SourceIfExists($VIMHOME.'/secrets.vim')

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'

" Set the filetype based on the file's extension, but only if
" 'filetype' has not already been set
au BufRead,BufNewFile *.ksy setfiletype yaml
