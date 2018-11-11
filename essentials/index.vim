" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
	let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
	let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

set nocompatible " No need for Vi specific commands

" Terminal settings

set t_Co=256

