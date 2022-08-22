set nocompatible
filetype off
let mapleader="\<Space>"
set mouse=a

"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let nema_pluginova = 0
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let nema_plaginova = 1
endif

set viminfo+=n~/.vim/viminfo
" set tags+=$HOME/.local/bin/ctags/
set tags=tags,../tags
" set runtimepath+=~/.vim/bundle/Vundle.vim

call plug#begin()

	" ------------------------------------------------------- "
	" Conquer of Completion
	" ------------------------------------------------------- "  

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
	nmap <leader>r <Plug>(coc-rename)
	
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

	Plug 'preservim/nerdtree' |
	     \ Plug 'Xuyuanp/nerdtree-git-plugin' |
	     \ Plug 'ryanoasis/vim-devicons'

	Plug 'preservim/nerdcommenter'	

	let g:NERDTreeGitStatusUseNerdFonts = 1
	let g:NERDTreeGitStatusShowIgnored = 1
	let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
	let g:NERDTreeGitStatusShowClean = 1

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
	" FZF
	" ------------------------------------------------------- "
	
	Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
	Plug 'junegunn/fzf.vim'
	
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
	" Mini-map
	" ------------------------------------------------------- "

	Plug 'wfxr/minimap.vim'

	" ------------------------------------------------------- "
	" Ostalo
	" ------------------------------------------------------- "

	Plug 'flazz/vim-colorschemes'
	Plug 'tpope/vim-surround'
	Plug 'aperezdc/vim-template'
	Plug 'ap/vim-css-color'
	" Plug 'ryanoasis/vim-devicons'

	" Plug 'chriskempson/base16-vim'
	" Plug 'sonph/onehalf', { 'rtp': 'vim' }
	" Plug 'chriskempson/base16-vim'
	" Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()
filetype plugin indent on    " required

if nema_pluginova == 1
	silent! PlugInstall
	q
endif

" ---------------------------------------------------------------------------- "
" netwr
" ---------------------------------------------------------------------------- "
" malo da ulepšamo Vim-ov default file manager

let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_browse_split = 4
let g:netrw_altv         = 1
let g:netrw_winsize      = 20

" ---------------------------------------------------------------------------- "

set encoding=utf-8
set ttimeout
set ttimeoutlen=10
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
" Automatsko (ili bolje rečeno poluatomatsko) učitavanje
" sadržaja otvorenog dokumenta, kada neki drugi program
" sačuva dati dokument sa novim sadržajem

" set autoread
" au CursorHold * checktime
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime
set updatetime=500

" -------------------------------------------------------- "
" opcija list (malo čudan naziv) menja - u prikazu
" (ne bukvalno), whitespace znakove specijalnim znakovima
" (ispod je definisano koji se tačno znaci koriste)
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
" Let's make Vim great / koja god tema je izabrana

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

" -------------------------------------------------------- "

nnoremap <F2>         :NERDTreeToggle<cr>
nnoremap <F3>         :Startify<cr>
nnoremap <leader><F3> :Tags<cr>
nnoremap <F4>         :Buffers<cr>
nnoremap <leader><F4> :Files<cr>

map      <F6> :Tabularize /
nnoremap <F7> :w !pypy /home/korisnik/git/python/idiosync_parser.py<cr>
nnoremap <F8> :TagbarToggle<cr>

" map <leader>= :Tabularize /=<cr>
map <leader>= ! node /home/korisnik/git/node/css_tab.js<cr>
" -------------------------------------------------------- "

map <F9>      :set number!<cr>
map <F10>     :set relativenumber!<cr>
map <leader>y :set wrap!<cr>
map <F11>     :VimadeToggle<cr>
map <F12>     :qa<cr>

" ----- "
" uklanjanje oznake sa poslednjeg pretraživanog stringa
noremap  <esc><esc> :noh<cr>
" search za Normal mode
noremap  <leader><backspace> :%s//gc<left><left><left>
" search za Visual mode
vnoremap <leader><backspace> :s//gc<left><left><left>
" toggle za prikaz whitespace-ova preko specijalnih znakova
noremap  <leader>`           :set list!<cr>

" ----- "
" premotavanje pola stranice na dole
noremap <S-f> <C-d>
" premotavanje pola stranice na gore
noremap <S-b> <C-u>
" premeštanje reda jedno mesto na dole
noremap <S-j> :m .+1<cr>
" premeštanje reda jedno mesto na gore
noremap <S-k> :m .-2<cr>
" dupliciranje reda na dole (kursor prelazi u donji red)
noremap <S-h> yyp
" dupliciranje reda na gore (kursor ostaje u istom redu)
noremap <S-l> yyP
" horizontalni skok na početak reda
noremap <leader>h 0
" horizontalni skok na kraj reda
noremap <leader>l $
" vertikalni skok na sredinu ekrana
noremap <leader>m M
" vertikalni skok na dno ekrana
noremap <leader>j L
" vertikalni skok na vrh ekrana
noremap <leader>k H

" ----- "
" Malo olakšanja za rad sa splitovanom
" radnom površinom
noremap <leader>v :vsp<cr>
noremap <leader>w <C-w>

" ----- "
" Tabove zapravo ne koristim često, ali,
" neka bude ovako
"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <expr><silent> <leader>t &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>"

" ----- "
" -kada je uključena opcija 'wrap', po defaultu <j> i <k>
" prebacuju kursor na sledeći/prethodni red koji u prikazu
" može biti zapravo nekoliko mesta ispod/iznad
" -preko mapiranja, podešeno je da <j> i <k> pomeraju
"  kursor jedno mesto dole/gore u prikazu

noremap <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <expr> k (v:count == 0 ? 'gk' : 'k')

" bez donjih mapiranja, multicursor plugin ne radi

map <Esc>[1;5A <C-Up>
map <Esc>[1;5B <C-Down>
map <Esc>[1;5D <C-Left>
map <Esc>[1;5C <C-Right>

map <Esc>[1;2D <S-Left>
map <Esc>[1;2C <S-Right>
map <Esc>[1;2D <S-Left>
map <Esc>[1;2C <S-Right>

" --------------------------------------------------------------------------- "
" 'Auto-save'
" --------------------------------------------------------------------------- "

" autocmd BufWritePost *.imd :w !python /home/korisnik/git/python/idiosync_parser.py
autocmd BufWritePost *.imd :w !node /home/korisnik/git/node/idiosync_parser.js











if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

