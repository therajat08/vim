"searching
"{{{
		set incsearch "search as characters are entered
		set hlsearch "highlight matches

		"turning off search highlight
				nnoremap <leader><space> :nohlsearch<CR>
"}}}

"disabling error bells
"{{{
		set noerrorbells visualbell t_vb=
		autocmd GUIEnter * set visualbell t_vb=
"}}}

"Welcome message
"{{{
		echo "Hello Rajat!"
"}}}

"improving backspace functionality
"{{{
		set backspace=indent,eol,start	
"}}}

"showing line numbers
"{{{
		set number
"}}}

" colors {{{
"colorscheme badwolf
"set termguicolors
"}}}

"tabSpace{{{
set tabstop=4
set softtabstop=4
"}}}
