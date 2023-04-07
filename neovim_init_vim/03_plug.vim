" ---------------------------------------------------------------------------- "
" Automatsko instaliranje - I deo (pripremni)
" ---------------------------------------------------------------------------- "
" -izvršni deo skripte je ispod liste plugin-ova
" -preko promenljive auto_plug može se uključiti/isključiti
"  automatsko instaliranje pluginova
" -adresa: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let auto_plug      = 1
let nema_pluginova = 0

if auto_plug && empty(glob('$XDG_DATA_HOME/nvim/site/autoload/plug.vim'))
	silent !sh -c 'curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	let nema_pluginova = 1
endif
" ---------------------------------------------------------------------------- "
call plug#begin()
	Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'dstein64/vim-startuptime'
	" ------------------------------------------------------- "
	" LSP (i pomoćni)
	" ------------------------------------------------------- "  
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'onsails/lspkind.nvim'
	" Plug 'hrsh7th/vim-vsnip'
	" Plug 'hrsh7th/cmp-vsnip'
	" Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'rafamadriz/friendly-snippets'
	" -----
	Plug 'ray-x/lsp_signature.nvim'
	Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
	" -----
	" Treesitter
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'nvim-treesitter/playground'
	" ------------------------------------------------------- "
	" Lua line
	" ------------------------------------------------------- "
	Plug 'nvim-lualine/lualine.nvim'
	" Plug 'kyazdani42/nvim-web-devicons'
	" ------------------------------------------------------- "
	" Vim Visual Multi (multi cursor)
	" ------------------------------------------------------- "  
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	" ------------------------------------------------------- "
	" Startify
	" ------------------------------------------------------- "
	Plug 'mhinz/vim-startify'
	" ------------------------------------------------------- "
	" lf vim
	" ------------------------------------------------------- "
	Plug 'ptzz/lf.vim'
	Plug 'voldikss/vim-floaterm'
	let g:lf_replace_netrw = 1
	" let g:lf_command_override = 'lfrun'
	let g:floaterm_title   = "[lf]"
	let g:lf_width         = 0.6
	let g:lf_height        = 0.7
	" ------------------------------------------------------- "
	" NERD Commenter
	" ------------------------------------------------------- "
	Plug 'preservim/nerdcommenter'	
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
	" Plug 'ervandew/supertab'
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
	" Plug 'TaDaa/vimade'
	" let g:vimade = {}
	" let g:vimade.fadelevel = 0.6
	" ------------------------------------------------------- "
	" Unapredjena sintaksa
	" ------------------------------------------------------- "
	" Plug 'jelera/vim-javascript-syntax'
	" Plug 'lepture/vim-css'
	" ------------------------------------------------------- "
	" Mini-map
	" ------------------------------------------------------- "
	" Plug 'wfxr/minimap.vim'
	" ------------------------------------------------------- "
	" Ostalo
	" ------------------------------------------------------- "
	Plug 'tpope/vim-surround'
	Plug 'aperezdc/vim-template'
	Plug 'RRethy/vim-illuminate'
	Plug 'ap/vim-css-color'
	" Plug 'ryanoasis/vim-devicons'
	Plug 'flazz/vim-colorschemes'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'chriskempson/base16-vim'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'drewtempelmeyer/palenight.vim'
	Plug 'JoosepAlviste/palenightfall.nvim'
	Plug 'rebelot/kanagawa.nvim'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'gilgigilgil/anderson.vim'
	" ------------------------------------------------------- "
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

