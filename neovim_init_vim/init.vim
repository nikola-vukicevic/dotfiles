" ---------------------------------------------------------------------------- "
let mapleader="\<Space>"
let mapleader="\<Space>"
set mouse=a
" autocmd BufEnter * setlocal formatoptions=crqn2l1j
let barebones  = 0
" let g:prvi_dir = getcwd()
" ---------------------------------------------------------------------------- "
source ~/.config/nvim/01_map.vim
source ~/.config/nvim/02_funkcije.vim
" ---------------------------------------------------------------------------- "
if !barebones
	source ~/.config/nvim/03_plug.vim
endif
" ---------------------------------------------------------------------------- "
" netwr
" ---------------------------------------------------------------------------- "
" malo da ulepšamo i Vim-ov default file manager

let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_browse_split = 4
let g:netrw_altv         = 1
let g:netrw_winsize      = 20
" ---------------------------------------------------------------------------- "
set encoding=utf-8
set hidden
" setlocal formatoptions-=cro
set clipboard=unnamedplus
set ttimeout
" set ttimeoutlen=10
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
" set completeopt=menu
set completeopt=menu,menuone,noselect
set cursorline
set nowrap
set linebreak
set breakindent
set list
set backspace=indent,eol,start
set splitbelow
set splitright
set ignorecase
set smartcase

if barebones
	set statusline=\ File:\ %F\ %m\ Buffer:\ %n%=%p%%\ Line:\ %l\ of\ %L\ %y\
endif

if !barebones	
	" colorscheme Tomorrow-Night-Eighties
	" colorscheme tokyonight
	" colorscheme onehalfdark
	" colorscheme palenightfall
	colorscheme palenight
endif

syntax on
filetype on
filetype plugin on
set wildmenu
" -------------------------------------------------------- "
" Automatsko (ili bolje rečeno poluatomatsko) učitavanje
" sadržaja otvorenog dokumenta, kada neki drugi program
" sačuva dati dokument sa novim sadržajem

" set autoread
" au CursorHold * checktime
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime
set updatetime=100
" -------------------------------------------------------- "
" opcija list (malo čudan naziv) menja - u prikazu
" (ne bukvalno), whitespace znakove specijalnim znakovima
" (ispod je definisano koji se tačno znaci koriste)
" ◦ • ⋅ ‣  ↲ ⁞ ▸ → ~ ⟩ ⟨
set listchars=space:.,multispace:◦⋅⋅⋅,eol:↲,tab:⁞-,trail:~,extends:⟩,precedes:⟨
set fillchars+=vert:∣
" ---- guicolor fix -------------------------------------- "
" set background=dark
" set t_Co=256
if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
" -------------------------------------------------------- "
" Let's make Vim great (again) - koja god tema je izabrana
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
hi SpecialKey   guifg=#323d37
hi NonText      guifg=#323d37 cterm=bold
hi Visual       guibg=#444755
hi Comment      guifg=#656a70
" -------------------- "
" Za Tree-sitter:
" -------------------- "
" hi @variable    guifg=#eeffaa
" -------------------- "
hi FloatermBorder guibg=#00000000 guifg=#cc8833
" ---------------------------------------------------------------------------- "
" 'Auto-save'
" ---------------------------------------------------------------------------- "
autocmd BufWritePost *.imd :w !python /home/korisnik/git/python/markdown/idiosync_parser.py
" ---------------------------------------------------------------------------- "
lua require ('podesavanja')

