" Checks if I am using battery

function! MyOnBattery()
	return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

