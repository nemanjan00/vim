function! SkipLineFoldExpr(lnum)
	let nextline = trim(getline(a:lnum + 1))
	let curline = trim(getline(a:lnum))

	" fold begins at {$ or one line before }$
	if curline[0:4] == '.line' || (curline == '' && nextline[0:4] == '.line')
		return 1
	endif

	" fold ends one line after {$ or at }$
	if curline[0:4] != '.line'
		return 0
	endif

	return 0
endfunction

function! SkipLineFoldText()
	" fold text matches non-empty line
	return ''
endfunction

" customize how fold is defined
set foldexpr=SkipLineFoldExpr(v:lnum)

" customize how fold looks like
set foldtext=SkipLineFoldText()

" use 'foldexpr'
set foldmethod=expr

set foldenable
set foldclose=all
set foldopen=all
set foldlevel=0

set fillchars=fold:\ 

highlight clear Folded
