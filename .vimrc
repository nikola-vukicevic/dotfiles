set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'
	
	" ---------------------------------------------------------------------------- "
	" SuperTab                                                                     " 
	" ---------------------------------------------------------------------------- "

	Plugin 'ervandew/supertab'	

	" ---------------------------------------------------------------------------- "
	" YCM                                                                          " 
	" ---------------------------------------------------------------------------- "

	Plugin 'Valloric/YouCompleteMe'
	let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
	let g:ycm_always_populate_location_list = 1

	" ---------------------------------------------------------------------------- "
	" UltiSnips                                                                    " 
	" ---------------------------------------------------------------------------- "
	
	" Track the engine.

	Plugin 'SirVer/ultisnips'

	" Snippets are separated from the engine. Add this if you want them:

	Plugin 'honza/vim-snippets'


	" make YCM compatible with UltiSnips (using supertab)

	let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
	let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
	let g:SuperTabDefaultCompletionType    = '<C-n>'

	" better key bindings for UltiSnipsExpandTrigger
	
	let g:UltiSnipsExpandTrigger       = "<tab>"
	let g:UltiSnipsJumpForwardTrigger  = "<tab>"
	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
	
	" ---------------------------------------------------------------------------- "
	" Emmet                                                                        " 
	" ---------------------------------------------------------------------------- "
	
	Plugin 'mattn/emmet-vim'
	let g:user_emmet_leader_key='<F4>'

	Plugin 'pangloss/vim-javascript'
	
	" ---------------------------------------------------------------------------- "
	" Airline                                                                      " 
	" ---------------------------------------------------------------------------- "
	
	Plugin 'vim-airline/vim-airline'

	Plugin 'vim-airline/vim-airline-themes'
	
	let g:airline_left_sep  = ''
	let g:airline_right_sep = ''

	let g:airline_section_b = 'Ξ %n' 
	let g:airline_section_c = '%F %m %r' 
	let g:airline_section_z = 'Ξ %3l / %-3L : %-3c Ξ A:%04b H:%04B' 

	let	g:airline#extensions#wordcount#enabled = 0

	" ---------------------------------------------------------------------------- "
	" NERDTree & NERD Commenter                                                    "
	" ---------------------------------------------------------------------------- "
	
	Plugin 'scrooloose/nerdtree'
	Plugin 'scrooloose/nerdcommenter'	
		
	" Add spaces after comment delimiters by default
	let g:NERDSpaceDelims = 1

	" Use compact syntax for prettified multi-line comments
	let g:NERDCompactSexyComs = 1

	" Align line-wise comment delimiters flush left instead of following code indentation
	let g:NERDDefaultAlign = 'left'

	" Set a language to use its alternate delimiters by default
	let g:NERDAltDelims_java = 1

	" Add your own custom formats or override the defaults
	let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

	" Allow commenting and inverting empty lines (useful when commenting a region)
	let g:NERDCommentEmptyLines = 1

	" Enable trimming of trailing whitespace when uncommenting
	let g:NERDTrimTrailingWhitespace = 1	

	" ---------------------------------------------------------------------------- "
	" Tagbar                                                                       "
	" ---------------------------------------------------------------------------- "
	
	Plugin 'majutsushi/tagbar'
	
	" ---------------------------------------------------------------------------- "
	" Tabular                                                                      "
	" ---------------------------------------------------------------------------- "
	
	Plugin 'godlygeek/tabular'	
	
	" ---------------------------------------------------------------------------- "
	" Ostalo                                                                       "
	" ---------------------------------------------------------------------------- "
	
	Plugin 'flazz/vim-colorschemes'
	Plugin 'mhinz/vim-startify'
	Plugin 'tpope/vim-surround'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'aperezdc/vim-template'

call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set ttimeoutlen=20 
set number
set noshowmode
set autoindent
set smartindent
set cindent
set cinoptions+=g0
set tabstop=4
set softtabstop=4
set laststatus=2
set shiftwidth=4
set hlsearch
set incsearch
set completeopt=menu
set cursorline
set nowrap
set backspace=indent,eol,start
"set statusline=\ File:\ %F\ %m\ Buffer:\ %n%=%p%%\ Line:\ %l\ of\ %L\ %y\ 
"set background=dark
"set t_Co=256

colorscheme wombat256
let g:airline_theme="minimalist"
let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1	

syntax on
filetype on
filetype plugin on
set wildmenu
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

nnoremap <F2> : NERDTree<CR>
nnoremap <F3> : Startify<CR>
nnoremap <F8> :TagbarToggle<CR>
map <F9> :Tabularize /=<CR>

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi CursorLine ctermbg=none

