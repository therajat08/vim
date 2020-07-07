" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"***********************************************************************
"below is  my own vimrc
"***********************************************************************

" adding cmds for different settings for different file types
"To enable file type detection"
	filetype  on
	filetype plugin on
	 augroup Java_C_Settings
		"the command below execute the script for the specific filetype md 
		 autocmd FileType markdown source  /usr/share/vim/settings/md-settings.vim

		"the command below execute the script for the specific filetype Java
		"autocmd FileType java source /path-for-Java-settings/Java-settings.vim
	 augroup END

""autocmd vimenter * NERDTree
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

				" toggle search 
				nnoremap <F3> :set hlsearch!<CR>
		"}}}

"disabling error bells
"{{{
                set noerrorbells visualbell t_vb=
                autocmd GUIEnter * set visualbell t_vb=
"}}}

"improving backspace functionality
		"{{{
                "set backspace=indent,eol,start
		"}}}

"showing line numbers
		"{{{
                set number
		"}}}

" colors {{{
		syntax enable
		"auto detecting using vim background detection
		" set termguicolors
		" if has('gui_running')
		" 	set background=light
		" else
		" 	set background=dark
		" endif
		"}}}
		"
		"below lines change color scheme depending on daytime
		 if strftime("%H") < 12
				 set background=light
		" 	colorscheme desert
		 else
		" 	colorscheme delek
				 set background=dark
		 endif
		

		"for gruvbox theme plug
		autocmd vimenter * colorscheme gruvbox

    
		"tabSpace{{{
                 :set tabstop=4    
                 " :set expandtab     
                 :set shiftwidth=4  
                 :set autoindent    
                 :set smartindent   
                 :set cindent             
		"}}}

"MOVEMENT

		" move vertically by visual line{{{
		nnoremap j gj
		nnoremap k gk
		"}}}
		" move to beginning/end of line{{{
		" nnoremap B ^
		" nnoremap E $
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
		" set foldenable          " enable folding
		" set foldlevelstart=10   " open most folds by default
		" space open/closes folds
		" nnoremap <space> za
		"set foldmethod=indent   " fold based on indent level

" turn hybrid line numbers on
		:set number relativenumber
		:set nu rnu
		

"code to make insert go green 

		" first, enable status line always
		set laststatus=2

		" now set it up to change the status line based on mode
		" if version >= 700
		"   au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Red
		"   au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
		" endif
"code end

:hi CursorLine guifg=red guibg=blue

" adding ctrlp which is used for fuzzy searching

		set runtimepath^=~/.vim/bundle/ctrlp.vim

" snippet
"call plug#begin to call plug#end is for vim-plug manager
" source used for this : https://2sang.github.io/journal/vim-snippets-management.html
"

"adding lines for youcompleteme c family support after making a function in
"ycm source: https://unixnme.blogspot.com/2017/03/how-to-install-youcompleteme-vim-plugin.html

		let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'

"do not delte above line if you wanna keep using youcomplete me

"adding to disable default gray color of indentLine
	let g:indentLine_setColors = 0

" changing cursor shape in diffenent modes
		if has("autocmd")
		  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
		  au InsertEnter,InsertChange *
			\ if v:insertmode == 'i' | 
			\   silent execute '!echo -ne "\e[5 q"' | redraw! |
			\ elseif v:insertmode == 'r' |
			\   silent execute '!echo -ne "\e[3 q"' | redraw! |
			\ endif
		  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
		endif
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
		let g:UltiSnipsExpandTrigger="<S-z>"
		let g:UltiSnipsJumpForwardTrigger="<c-b>"
		let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
		let g:UltiSnipsEditSplit="vertical"

" adding configuration to ignore some files while using ctrlp for fuzzy search
		set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.mkv,*.mp4,*.png,*.jpeg,*.gif,*.out,*.deb,*.pdf     " MacOSX/Linux

" Prevent cursor from moving back one character on insert mode exit
		:inoremap <silent> <Esc> <Esc>`^
" to run cpp file from vim only
nnoremap <C-c> :!clear; g++ -o  %:r.out % -std=c++11<Enter>
nnoremap <C-x> :!./%:r.out<Enter>
" for running compiled program in split window
nnoremap <C-z> :vert term ./%:r.out<Enter>

"nnoremap <c-r> :!g++ -o %:r.out %<enter><enter>
"nnoremap <c-m> :!./%:r.out<enter>
"
"
"adding lines to get out of braces quickly
inoremap <C-e> <C-o>A

"adding line to open file in new tab with nerdtree
	let NERDTreeMapOpenInTab='<ENTER>'

" to navigate between tabs use mouse to open file in adjacent tab; enter for
" newtab
	nnoremap <C-Left> :tabprevious<CR>                                                                            
	nnoremap <C-Right> :tabnext<CR>

" adding code for tabline with airline
	let g:airline#extensions#tabline#enabled = 1
	
" needed for vim-devicons
	set encoding=UTF-8

" adding lines to configure powerline
set  rtp+=/home/rajat/.local/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256	

" change below line to switch between airline and powerline
	let g:airline_disable_statusline = 1

call plug#begin('~/.vim/plugged')

		Plug 'SirVer/ultisnips'
		Plug 'honza/vim-snippets'
	
		"below function is needed for ycm
		function! BuildYCM(info)
		  " info is a dictionary with 3 fields
		  " - name:   name of the plugin
		  " - status: 'installed', 'updated', or 'unchanged'
		  " - force:  set on PlugInstall! or PlugUpdate!
		  if a:info.status == 'installed' || a:info.force
			!./install.py
		  endif
		endfunction

		Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

		Plug 'jiangmiao/auto-pairs' " for bracket auto completion

		Plug 'Yggdroot/indentLine' " for indentation colored guide

		Plug 'tyru/caw.vim' "plugin for commenting

		Plug 'nathanaelkane/vim-indent-guides' "plugin for color indent

		Plug 'morhetz/gruvbox'

		Plug 'vitalk/vim-simple-todo'

		Plug 'vim-airline/vim-airline'

		Plug 'majutsushi/tagbar'
		
		Plug 'Nopik/vim-nerdtree-direnter' "to prevent new tabsopening while trversing directory in nerdtree


		" adding plugins for writing purpose {{{
			Plug 'reedes/vim-pencil' " for wrapping and other things 
		" }}}
		
		Plug 'mhinz/vim-startify' "for a welcome screen

		Plug 'ryanoasis/vim-devicons' " adding plugin to display icons for diff filetypes
		"Always load the vim-devicons as the very last one.
		
call plug#end()
