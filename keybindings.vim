" Shortcut settings
let maplocalleader = '.' 
let mapleader = ','

" Key maps
map <C-y> :%y+<cr>

map <C-t> :%retab!<cr>
map <C-M-t> :set tabstop=2<cr> :%retab!<cr> :set tabstop=4<cr>

map <leader>ev :e! ~/.config/nvim/init.vim<cr> " edit ~/.vimrc

map <leader>ft :TableFormat<cr> " Reformat markdown table

if has("nvim")
	" Exit terminal mode
	tnoremap <Esc> <C-\><C-n>
endif

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

call arpeggio#map('i', '', 0, 'jk', '<Esc>')
call arpeggio#map('i', '', 0, 'wq', '<Esc>:wq<cr>')
call arpeggio#map('i', '', 0, 'fn', 'function')
call arpeggio#map('i', '', 0, 'rq', 'require')
call arpeggio#map('i', '', 0, 'md', 'module.exports = () => {}<Esc>i')
call arpeggio#map('i', '', 0, 'ct', 'const')

source $VIMHOME/functions/winmove.vim

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Neosnippet

" Use <C-l> to trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> to select text for visual text of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> to jump to forward placeholder, which is default
let g:coc_snippet_next = '<c-j>'
" Use <C-k> to jump to backward placeholder, which is default
let g:coc_snippet_prev = '<c-k>'

" FZF

map <C-p> :FZF<cr>
map <M-a> :Ag<cr>

" Gist

map <C-g> :Gist -p<cr>
map <C-M-g> :Gist<cr>

