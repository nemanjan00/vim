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

map <leader>mu :MundoToggle<cr>

map <leader>sd :call CocAction('doHover')<cr>

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

" Coc and neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Use <C-l> to trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> to select text for visual text of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> to jump to forward placeholder, which is default
let g:coc_snippet_next = '<c-j>'
" Use <C-k> to jump to backward placeholder, which is default
let g:coc_snippet_prev = '<c-k>'

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" remap for complete to use tab and <cr>
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ CheckBackspace() ? "\<Tab>" :
	\ coc#refresh()

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~# '\s'
endfunction

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a	<Plug>(coc-codeaction-selected)
nmap <leader>a	<Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call	 CocAction('fold', <f-args>)

nmap <leader>tb :Vista<CR>

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a	:<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e	:<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c	:<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o	:<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s	:<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j	:<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k	:<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p	:<C-u>CocListResume<CR>

" FZF
source $VIMHOME/functions/fzf.vim
"map <C-p> :call FZFWithDevIcons()<cr>
map <C-p> :Files<cr>
map <C-b> :b 
map <M-p> :Rg<cr>

" Gist
map <C-g> :Gist -p<cr>
map <C-M-g> :Gist<cr>

" Action menu
source $VIMHOME/functions/actions.vim

nnoremap <silent> <Leader>s :call ActionMenuCodeActions()<CR>
nnoremap <leader>h <Esc>:call HardTimeToggle()<CR>
nnoremap <leader>td <Esc>:TODOToggle<CR>
nnoremap <leader>nt <Esc>:NERDTree<CR>
nnoremap <leader>pi <Esc>:PlugInstall<CR>
nnoremap <leader>pu <Esc>:PlugUpdate<CR>
nnoremap <leader>jsd <Esc>:JsDoc<CR>
nnoremap <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <leader>mp <Esc>:CocList marketplace<CR>
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

nmap <leader>ch <Esc>:Cheat<Space>

nnoremap <leader> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

nmap J :tabr<CR>
nmap K :tabl<CR>
nmap L :tabnew<CR>

