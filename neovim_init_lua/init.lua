-- -----------------------------------------------------------------------------
vim.opt.mouse       = "a"
-- " autocmd BufEnter * setlocal formatoptions=crqn2l1j
vim.g.barebones_CFG = false
-- " let g:prvi_dir = getcwd() -- Ovo je kanda bio pokušaj da "odobrovoljim" LSP
-- " ---------------------------------------------------------------------------
require('01_map')
require('02_funkcije')
-- -----------------------------------------------------------------------------
if vim.g.barebones_CFG ~= true then
	require('03_plug')
end
-- -----------------------------------------------------------------------------
-- netwr
-- -----------------------------------------------------------------------------
-- malo da ulepšamo i Vim-ov default file manager
vim.g.netrw_banner       = 0
vim.g.netrw_liststyle    = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv         = 1
vim.g.netrw_winsize      = 20
-- -----------------------------------------------------------------------------
vim.opt.encoding    = "utf-8"
vim.opt.hidden      = true
-- " setlocal formatoptions-=cro
vim.opt.clipboard   = "unnamedplus"
vim.opt.ttimeout    = true
-- " set ttimeoutlen=10
vim.opt.number      = true
-- vim.opt.noshowmode = true -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
vim.opt.autoindent  = true
vim.opt.smartindent = true
vim.opt.cindent     = true
-- vim.opt.cinoptions += "g0"
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.laststatus  = 2
vim.opt.shiftwidth  = 4
vim.opt.hlsearch    = true
vim.opt.incsearch   = true
-- " set completeopt=menu
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cursorline  = true
vim.opt.wrap        = false
vim.opt.linebreak   = true
vim.opt.breakindent = true
vim.opt.list        = true
vim.opt.backspace   = "indent,eol,start"
vim.opt.splitbelow  = true
vim.opt.splitright  = true
vim.opt.ignorecase  = true
vim.opt.smartcase   = true
-- -----
if vim.g.barebones_CFG == true then
	vim.o.statusline = " %f | %l,%c | %p%%"
	-- vim.opt.statusline = "%F %m %n%=%p%% %l %L %y"
end
-- -----
if vim.g.barebones_CFG ~= true then
	-- vim.cmd("colorscheme Tomorrow-Night-Eighties")
	-- vim.cmd("colorscheme tokyonight")
	-- vim.cmd("colorscheme onehalfdark")
	vim.cmd("colorscheme palenight")
	-- vim.cmd("colorscheme palenightfall")
end
-- -----
vim.opt.syntax   = "on"
vim.opt.filetype = "on"
vim.opt.filetype.plugin = "on" -- ?????????????????????????????
vim.opt.wildmenu = true
-- ---------------------------------------------------------
-- opcija list (malo čudan naziv) menja - u prikazu
-- (ne bukvalno), whitespace znakove specijalnim znakovima
-- (ispod je definisano koji se tačno znaci koriste)
-- ◦ • ⋅ ‣  ↲ ⁞ ▸ → ~ ⟩ ⟨
vim.opt.listchars = "space:.,multispace:◦⋅⋅⋅,eol:↲,tab:⁞-,trail:~,extends:⟩,precedes:⟨"
vim.opt.fillchars:append("vert:∣")             -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- " ---- guicolor fix -------------------------------------
-- " set background=dark
-- " set t_Co=256
-- if exists('+termguicolors')
--     let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
--     let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
		vim.opt.termguicolors = true
-- endif
-- ---------------------------------------------------------
-- Let's make Vim great (again) - koja god tema je izabrana
vim.cmd ("hi Normal        ctermbg=NONE")
vim.cmd ("hi nonText       ctermbg=NONE")
vim.cmd ("hi Normal        guibg=NONE ctermbg=NONE")
-- vim.cmd("hi CursorLine ctermbg=none")
vim.cmd("hi CursorLine     guibg=#333541")
vim.cmd("hi CursorLineNr   cterm=bold guifg=#90a0b0")
vim.cmd("hi VertSplit      guibg=NONE")
vim.cmd("hi StatusLine     ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE")
vim.cmd("hi StatusLineNC   ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE")
vim.cmd("hi StatusLine     guifg=#2e2e31")
vim.cmd("hi StatusLineNC   guifg=#2e2e31")
vim.cmd("hi Search         guibg=#339966 guifg=#e0e0e0")
vim.cmd("hi SpecialKey     guifg=#323d37")
vim.cmd("hi NonText        guifg=#323d37 cterm=bold")
vim.cmd("hi Visual         guibg=#444755")
vim.cmd("hi Comment        guifg=#656a70")
vim.cmd("hi FloatermBorder guibg=#00000000 guifg=#cc8833")
-- --------------------------------------------------------- 
-- Automatsko (ili bolje rečeno poluatomatsko) učitavanje
-- sadržaja otvorenog dokumenta, kada neki drugi program
-- sačuva dati dokument sa novim sadržajem

-- " set autoread
-- " au CursorHold * checktime
-- au CursorHold,CursorHoldI * checktime
-- au FocusGained,BufEnter * checktime

vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
	command = "checktime"
})
--
vim.api.nvim_create_autocmd("FocusGained,BufEnter", {
	command = "checktime"
})
--
vim.opt.updatetime = 100
-- -----------------------------------------------------------------------------
-- Save *.imd pokreće parsiranje članka:
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePost" , {
	pattern = "*.imd",
	command = ":w !python /home/korisnik/git/python/markdown/idiosync_parser.py"
})
-- -----------------------------------------------------------------------------
if vim.g.barebones_CFG ~= true then
	require ('podesavanja')
end
-- -----------------------------------------------------------------------------

