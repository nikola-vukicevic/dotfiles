set nocompatible
filetype off
let mapleader="\<Space>"

"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

set runtimepath+=~/.vim/bundle/Vundle.vim

call plug#begin()

	" ------------------------------------------------------- "
	" Conquer of Completion
	" ------------------------------------------------------- "  

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" ------------------------------------------------------- "
	" Vim Visual Multi (multi cursor)
	" ------------------------------------------------------- "  

	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	" ------------------------------------------------------- "
	" Airline
	" ------------------------------------------------------- "

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	let g:airline_left_sep  = ''
	let g:airline_right_sep = ''

	let g:airline_section_b = 'Ξ %n' 
	let g:airline_section_c = '%F %m %r' 
	let g:airline_section_z = 'Ξ %3l / %-3L : %-3c Ξ A:%04b H:%04B' 

	let	g:airline#extensions#wordcount#enabled = 0

	" ------------------------------------------------------- "
	" NERDTree & NERD Commenter
	" ------------------------------------------------------- "

	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'	

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

	" ------------------------------------------------------- "
	" Auto pairs
	" ------------------------------------------------------- "

	Plug 'jiangmiao/auto-pairs'
	" let g:AutoPairs = { '(':')' , '[':']' , '{':'}' , "'":"'" , '"':'"' , "`":"`" , '```':'`````', '"""':'"""""' , "'''":"'''''" }
	let g:AutoPairs = { '[':']' , '{':'}' }

	" ------------------------------------------------------- "
	" SuperTab
	" ------------------------------------------------------- "

	Plug 'ervandew/supertab'	

	" ------------------------------------------------------- "
	" Tagbar
	" ------------------------------------------------------- "

	Plug 'majutsushi/tagbar'

	" ------------------------------------------------------- "
	" Tabular
	" ------------------------------------------------------- "

	Plug 'godlygeek/tabular'	
	
	" ------------------------------------------------------- "
	" vimade
	" ------------------------------------------------------- "

	Plug 'TaDaa/vimade'

	let g:vimade = {}
	let g:vimade.fadelevel = 0.6

	" ------------------------------------------------------- "
	" Unapredjena sintaksa
	" ------------------------------------------------------- "

	"Plug 'jelera/vim-javascript-syntax'
	"Plug 'lepture/vim-css'

	" ------------------------------------------------------- "
	" Startify
	" ------------------------------------------------------- "

	Plug 'mhinz/vim-startify'

	" ------------------------------------------------------- "
	" Ostalo
	" ------------------------------------------------------- "

	Plug 'flazz/vim-colorschemes'
	Plug 'tpope/vim-surround'
	Plug 'aperezdc/vim-template'
	Plug 'ap/vim-css-color'
	Plug 'ryanoasis/vim-devicons'

	" Plug 'chriskempson/base16-vim'
	" Plug 'sonph/onehalf', { 'rtp': 'vim' }
	" Plug 'chriskempson/base16-vim'
	" Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()
filetype plugin indent on    " required

" ---------------------------------------------------------------------------- "
" netwr
" ---------------------------------------------------------------------------- "

let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_browse_split = 4
let g:netrw_altv         = 1
let g:netrw_winsize      = 20

" ---------------------------------------------------------------------------- "

set encoding=utf-8
set ttimeout
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
set linebreak
set breakindent
set list
set backspace=indent,eol,start

" set statusline=\ File:\ %F\ %m\ Buffer:\ %n%=%p%%\ Line:\ %l\ of\ %L\ %y\
" set background=dark
" set t_Co=256

" colorscheme tender
" colorscheme Tomorrow-Night
colorscheme Tomorrow-Night-Eighties 
" colorscheme gruvbox
" colorscheme molokai
" colorscheme solarized
" colorscheme slate
" colorscheme Monokai
" colorscheme OceanicNext
" colorscheme atom
" colorscheme solarized8_dark
" colorscheme smyck
" colorscheme onehalfdark

" let g:airline_theme="minimalist"
" let g:airline_theme="tomorrow"
" let g:airline_theme="bubblegum"

let g:airline_theme="molokai"
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
  
" -------------------------------------------------------- "
 
" set autoread
" au CursorHold * checktime
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime
set updatetime=500

" -------------------------------------------------------- "

" ◦ • ⋅ ‣  ↲ ⁞ ▸ → ~ ⟩ ⟨
set listchars=space:.,multispace:◦⋅⋅⋅,eol:↲,tab:⁞-,trail:~,extends:⟩,precedes:⟨
set fillchars+=vert:∣

" ---- guicolor fix -------------------------------------- "

if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" -------------------------------------------------------- "
  
hi Normal       ctermbg=NONE
hi nonText      ctermbg=NONE
hi Normal       guibg=NONE ctermbg=NONE
" hi CursorLine ctermbg=none
hi CursorLine   guibg=#333541
hi CursorLineNr cterm=bold guifg=#90a0b0
hi VertSplit    guibg=NONE
hi StatusLine   ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi StatusLineNC ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi StatusLine   guifg=#2e2e31
hi StatusLineNC guifg=#2e2e31
hi Search       guibg=#339966 guifg=#e0e0e0
hi SpecialKey   guifg=#35475a
hi NonText      guifg=#35403a cterm=bold
hi Visual       guibg=#444755
hi Comment      guifg=#656a70

" -------------------------------------------------------- "

nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F3> :Startify<cr>
map      <F5> :Tabularize /
nnoremap <F8> :TagbarToggle<cr>

" -------------------------------------------------------- "

map <F9>      :set number!<cr>
map <F10>     :set relativenumber!<cr>
map <leader>y :set wrap!<cr>
map <F11>     :VimadeToggle<cr>
map <F12>     :qa<cr>

" ----- "

noremap  <esc><esc> :noh<cr>
noremap  <leader><backspace>  :%s//gc<left><left><left>
vnoremap <leader><backspace>  :s//gc<left><left><left>
noremap  <leader>`            :set list!<cr>

" ----- "
 
noremap <S-f> <C-d>
noremap <S-b> <C-u>
noremap <S-j> :m .+1<cr>
noremap <S-k> :m .-2<cr>
noremap <S-h> yyp
noremap <S-l> yyP
noremap <leader>h 0
noremap <leader>l $
noremap <leader>m M
noremap <leader>j L
noremap <leader>k H

" ----- "

noremap <leader>v :vsp<cr>
noremap <leader>w <C-w>

" ----- "

noremap <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <expr> k (v:count == 0 ? 'gk' : 'k')

map <Esc>[1;5A <C-Up>
map <Esc>[1;5B <C-Down>
map <Esc>[1;5D <C-Left>
map <Esc>[1;5C <C-Right>

map <Esc>[1;2D <S-Left>
map <Esc>[1;2C <S-Right>
map <Esc>[1;2D <S-Left>
map <Esc>[1;2C <S-Right>

