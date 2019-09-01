function! FZFWithDevIcons()
	let l:fzf_files_options = ' -m --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up --preview "bat --color always --style numbers {2..}"'

	function! s:files()
		let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
		return s:prepend_icon(l:files)
	endfunction

	function! s:prepend_icon(candidates)
		let result = []
		for candidate in a:candidates
			let filename = fnamemodify(candidate, ':p:t')
			let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
			call add(result, printf("%s %s", icon, candidate))
		endfor

		return result
	endfunction

	function! s:edit_file(items)
		let items = a:items
		let i = 1
		let ln = len(items)
		while i < ln
			let item = items[i]
			let parts = split(item, ' ')
			let file_path = get(parts, 1, '')
			let items[i] = file_path
			let i += 1
		endwhile
		call s:Sink(items)
	endfunction

	let opts = fzf#wrap({})
	let opts.source = <sid>files()
	let s:Sink = opts['sink*']
	let opts['sink*'] = function('s:edit_file')
	let opts.options .= l:fzf_files_options
	call fzf#run(opts)

endfunction
