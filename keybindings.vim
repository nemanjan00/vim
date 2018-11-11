" Key maps

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

call arpeggio#map('i', '', 0, 'jk', '<Esc>')
call arpeggio#map('i', '', 0, 'wq', '<Esc>:wq<cr>')
call arpeggio#map('i', '', 0, 'fn', 'function')
call arpeggio#map('i', '', 0, 'rq', 'require')
call arpeggio#map('i', '', 0, 'md', 'module.exports = function(){}')

source $VIMHOME/functions/winmove.vim

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Neosnippet
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

" FZF

map <C-p> :FZF<cr>
map <M-a> :Ag<cr>

" Gist

map <C-g> :Gist -p<cr>
map <C-M-g> :Gist<cr>

