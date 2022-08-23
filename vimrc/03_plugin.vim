" ---------------------------------------------------------------------------- "
" Automatsko instaliranje - I deo (pripremni)
" ---------------------------------------------------------------------------- "
" -izvršni deo skripte je ispod liste plugin-ova
" -preko promenljive auto_plug može se uključiti/isključiti
"  automatsko instaliranje pluginova
" -adresa: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let auto_plug      = 1
let nema_pluginova = 0

if auto_plug && empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let nema_pluginova = 1
endif
" ---------------------------------------------------------------------------- "
call plug#begin()
	Plug 'dstein64/vim-startuptime'
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
" ---------------------------------------------------------------------------- "
" Automatsko instaliranje - II deo (izvršni)
" ---------------------------------------------------------------------------- "
if nema_pluginova
	silent! PlugInstall
	q
endif
" ---------------------------------------------------------------------------- "

