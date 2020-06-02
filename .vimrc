echo "hello"
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
"execute pathogen#infect()
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"execute pathogen#infect()
"call pathogen#helptags()

"Below code is from github file
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
		""colorscheme solarized
		colorscheme badwolf
		syntax enable
		"auto detecting using vim background detection
		set termguicolors
		if has('gui_running')
			set background=light
		else
			set background=dark
		endif
		"}}}

"tabSpace{{{
		set tabstop=4
		set softtabstop=4
		"}}}

"MOVEMENT

		" move vertically by visual line{{{
		nnoremap j gj
		nnoremap k gk
		"}}}
		" move to beginning/end of line{{{
		nnoremap B ^
		nnoremap E $
		"}}}
		" $/^ doesn't do anything{{{
		nnoremap $ <nop>
		nnoremap ^ <nop>
		"}}}
		" highlight last inserted text{{{
		nnoremap gV `[v`]
		"}}}

"Leader Shortcuts
		let mapleader=","       " leader is comma

" jk is escape
		inoremap jk <esc>

" toggle gundo
"nnoremap <F5> :GundoToggle<CR>
"gundo wasnt runnin using undotree for now..... to use gundo do :source % in plugin folder of gundo cos i havent done that

"undotree
		nnoremap <leader>u :UndotreeToggle<CR>
		"to nat let working directory messed with undo directories{{{
		if has("persistent_undo")
			set undodir=~/.undodir/
			set undofile
		endif
		"}}}

"folding
		set foldenable          " enable folding
		set foldlevelstart=10   " open most folds by default
		" space open/closes folds
		nnoremap <space> za
		set foldmethod=indent   " fold based on indent level

" turn hybrid line numbers on
		:set number relativenumber
		:set nu rnu
