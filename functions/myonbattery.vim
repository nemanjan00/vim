" Checks if I am using battery

function! MyOnBattery()
	if filereadable("/sys/class/power_supply/AC/online")
		return readfile('/sys/class/power_supply/AC/online') == ['0']
	endif

	return 0
endfunction

