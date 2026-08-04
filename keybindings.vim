" Shortcut settings
let maplocalleader = '.' 
let mapleader = ','

" Key maps
map <C-y> :%y+<cr> " Copy whole file

map <C-t> :%retab!<cr>
map <C-M-t> :set tabstop=2<cr> :%retab!<cr> :set tabstop=4<cr>

map <leader>ev :e! ~/.config/nvim/init.vim<cr> " edit ~/.vimrc " Edit vim config

map <leader>ft :TableFormat<cr> " Reformat markdown table

map <leader>ir :IstanbulUpdate .nyc_output/*.json<cr>

map <leader>sd <cmd>lua vim.lsp.buf.hover()<cr>

if has("nvim")
	" Exit terminal mode
	"tnoremap <Esc> <C-\><C-n>
endif

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

try
	" chord mappings
	call arpeggio#map('i', '', 0, 'jk', '<Esc>')
	call arpeggio#map('i', '', 0, 'wq', '<Esc>:wq<cr>')
	call arpeggio#map('i', '', 0, 'fn', 'function')
	call arpeggio#map('i', '', 0, 'rq', 'require')
	call arpeggio#map('i', '', 0, 'md', 'module.exports = () => {}<Esc>i')
	call arpeggio#map('i', '', 0, 'ct', 'const')
	call arpeggio#map('i', '', 0, 'lt', 'let')
	call arpeggio#map('in', '', 0, 'tb', '<Esc>:Vista<CR>')
endtry

" window splitting and moving
source $VIMHOME/functions/winmove.vim

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Completion (<Tab>/<CR>/<C-Space>) is configured in nvim-cmp, see init.vim

" Use `[c` and `]c` for navigate diagnostics
nnoremap <silent> [c <cmd>lua vim.diagnostic.jump({count = -1, float = true})<CR>
nnoremap <silent> ]c <cmd>lua vim.diagnostic.jump({count = 1, float = true})<CR>

" Remap keys for gotos
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

" Use K for show documentation in preview window
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

" Remap for rename current word
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" Remap for format
vnoremap <leader>f gq
nnoremap <leader>f <cmd>lua vim.lsp.buf.format({async = true})<CR>

" Code actions
vnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>ac <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>qf <cmd>lua vim.lsp.buf.code_action()<CR>

" Use `:Format` for format current buffer
command! -nargs=0 Format :lua vim.lsp.buf.format()

nmap <leader>tb :Vista<CR>

" Show all diagnostics
nnoremap <silent> <space>a	<cmd>lua vim.diagnostic.setqflist()<cr>
" Manage language servers
nnoremap <silent> <space>e	:Mason<cr>
" Find symbol of current document
nnoremap <silent> <space>o	<cmd>lua vim.lsp.buf.document_symbol()<cr>
" Search workspace symbols
nnoremap <silent> <space>s	<cmd>lua vim.lsp.buf.workspace_symbol()<cr>

" FZF
map <C-p> :Files<cr>
map <C-b> :b 
map <M-p> :Rg<cr>

" Gist
map <C-g> :Gist -p<cr>
map <C-M-g> :Gist<cr>

nnoremap <silent> <Leader>s <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>pi <Esc>:PlugInstall<CR>
nnoremap <leader>pu <Esc>:PlugUpdate<CR>
nnoremap <leader>jsd <Esc>:Neogen<CR>
nnoremap <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <leader>gtd <Esc>Vapdk<esc>:read !rg "TODO" -I \| cut -d":" -f2 \| awk '{print "* [ ] "$0}'<CR>o<esc>

" CamelCase navigation

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

imap <silent><script><expr> <S-Tab> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

