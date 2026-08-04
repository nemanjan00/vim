" Important vars
let $VIMHOME = $HOME."/.config/nvim"

" Should be defaults
source $VIMHOME/essentials/index.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')
	" UI
	Plug 'kizza/actionmenu.nvim'
	Plug 'lewis6991/gitsigns.nvim' " Git changes in gutter
	Plug 'tpope/vim-fugitive' " Git helper
	Plug 'rhysd/committia.vim'
	Plug 'tpope/vim-repeat' " Better repeat for key mappings
	Plug 'junegunn/vim-peekaboo' " Show content of registers
	Plug 'nvim-lualine/lualine.nvim' " Status line
	Plug 'nvim-tree/nvim-web-devicons' " Icons for lualine
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

	Plug 'github/copilot.vim'

	Plug 'metakirby5/codi.vim' " Realtime runtime

	" Colorschemes
	Plug 'dracula/vim' " Dracula

	" File managment and search
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim' " Fuzzy find
	Plug 'brooth/far.vim' " Find and replace

	" Lint and syntax
	Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'main', 'do': ':TSUpdate'}

	Plug 'jwalton512/vim-blade'

	"Plug 'huggingface/llm.nvim'
	"Plug 'github/copilot.vim'

	"Plug 'hrsh7th/nvim-cmp'
	"Plug 'hrsh7th/cmp-nvim-lsp'
	"Plug 'Jacob411/Ollama-Copilot'

	Plug 'nvim-lua/plenary.nvim'
	Plug 'CopilotC-Nvim/CopilotChat.nvim'

	Plug 'smerrill/vcl-vim-plugin'
	Plug 'tpope/vim-dotenv'
	Plug 'robbles/logstash.vim'
	Plug 'pearofducks/ansible-vim'
	Plug 'Snape3058/vim-smali', { 'for': 'smali' } " Syntax highlighting for smali
	Plug 'elubow/cql-vim'
	Plug 'zsiciarz/caddy.vim'
	Plug 'sirtaj/vim-openscad'

	Plug 'yaegassy/coc-jsdoc', {'do': 'yarn install --frozen-lockfile'}

	"Plug 'heavenshell/vim-jsdoc', {
		"\ 'for': ['javascript', 'javascript.jsx','typescript'],
		"\ 'do': 'make install'
	"\}

	Plug 'zimbatm/haproxy.vim'
	Plug 'plasticboy/vim-markdown', { 'for': ['markdown']} " kept for :TableFormat

	" Code generation and helpers
	Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown']} " TOC for README.md
	Plug 'scrooloose/nerdcommenter' " Better comments
	Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'xml', 'ejs', 'vue', 'mst'] } " Fast HTML
	Plug 'tpope/vim-surround' " For changing quotes/xml tags
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
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

" UI/UX
autocmd BufNewFile *.html silent! 0r $VIMHOME/templates/html.tpl
autocmd BufNewFile *.c silent! 0r $VIMHOME/templates/c.tpl

let g:rainbow_active=1

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

hi Comment guifg=#ABCDEF

hi Normal guibg=NONE ctermbg=NONE
set noshowmode

set laststatus=2 " show the satus line all the time

" Conceal

if has('conceal')
	set conceallevel=0
endif

"autocmd FileType * nested :call tagbar#autoopen(0)

" Mappings
source $VIMHOME/keybindings.vim

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

lua << EOF
require("CopilotChat").setup {
	-- See Configuration section for options
}

require("gitsigns").setup()

require("lualine").setup {
	options = {
		theme = "dracula",
	},
	sections = {
		lualine_b = {
			"branch",
			"diff",
			{ "diagnostics", sources = { "coc" } },
		},
		lualine_x = { "g:coc_status", "encoding", "fileformat", "filetype" },
	},
}

-- Treesitter (main branch): install parsers, enable highlighting
-- for any buffer that has a parser, fall back to regex syntax otherwise
require("nvim-treesitter").install {
	"bash", "c", "css", "dockerfile", "gitignore", "go", "html",
	"javascript", "json", "kotlin", "lua", "markdown",
	"markdown_inline", "nginx", "php", "python", "scss", "sql",
	"tsx", "typescript", "vim", "vimdoc", "vue", "yaml",
}

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
		if lang then
			pcall(vim.treesitter.start, args.buf, lang)
		end
	end,
})
EOF
