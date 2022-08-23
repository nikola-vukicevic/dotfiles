" ---------------------------------------------------------------------------- "
function DupliranjeLinijeNaDole()
	let kolona = col('.')
	normal yyp
	call cursor(line('.'), kolona)
endfunction
" ---------------------------------------------------------------------------- "
function DupliranjeLinijeNaGore()
	let kolona = col('.')
	normal yyP
	call cursor(line('.'), kolona)
endfunction
" ---------------------------------------------------------------------------- "
function PomeranjeLinijeNaDole()
	let kolona = col('.')
	let red    = line('.')
	if red < line('$')
		:m .+1<cr>
		call cursor(line('.'), kolona)
	endif
endfunction
" ---------------------------------------------------------------------------- "
function PomeranjeLinijeNaGore()
	let kolona = col('.')
	let red    = line('.')
	if red > 1
		:m .-2<cr>
		call cursor(line('.'), kolona)
	endif
endfunction
" ---------------------------------------------------------------------------- "

