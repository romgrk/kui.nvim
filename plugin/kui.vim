if !has('nvim') || exists('g:loaded_kui')
	finish
endif

lua require('kui').setup()

let g:loaded_kui = 1
