-- -----------------------------------------------------------------------------
vim.opt.mouse         = "a"
vim.g.floaterm_opener = "edit"
vim.g.spell_check     = false
-- " let g:prvi_dir = getcwd() -- Ovo je kanda bio pokušaj da "odobrovoljim" LSP
-- -----------------------------------------------------------------------------
if vim.fn.argv(0) == "barebones" then
	vim.g.barebones_CFG = true
else
	vim.g.barebones_CFG = false
end
-- -----------------------------------------------------------------------------
require('01_map')
require('02_funkcije')
-- -----------------------------------------------------------------------------
if vim.g.barebones_CFG ~= true then
	require('03_plug')
end
-- -----------------------------------------------------------------------------
-- netwr
-- -----------------------------------------------------------------------------
-- Nije zgoreg malo ulepšati i
-- Vim-ov default file manager. :)
vim.g.netrw_banner       = 0
vim.g.netrw_liststyle    = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv         = 1
vim.g.netrw_winsize      = 20
-- -----------------------------------------------------------------------------
vim.opt.encoding    = "utf-8"
vim.opt.hidden      = true
vim.opt.clipboard   = "unnamedplus"
vim.opt.pumheight   = 20
vim.opt.ttimeout    = true
vim.opt.ttimeoutlen = 10
vim.opt.number      = true
vim.opt.showmode    = false
vim.opt.autoindent  = true
vim.opt.smartindent = true
vim.opt.cindent     = true
vim.opt.cinoptions:append("go")
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
vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")
-- -----
if vim.g.barebones_CFG ~= true then
	vim.opt.shortmess =  {
		S = true,
	    -- c = true, -- Do not show completion messages in command line
	    -- F = true, -- Do not show file info when editing a file, in the command line
	    -- W = true, -- Do not show "written" in command line when writing
	    -- I = true, -- Do not show intro message when starting Vim
	}
end
-- -----
if vim.g.barebones_CFG == true then
	vim.opt.statusline = "%F %m [%n]%=%3l:%2v (%2c)[%L] %3b/0x%3B %y %m"
end
-- -----
if vim.g.barebones_CFG ~= true then
	-- vim.cmd("colorscheme Tomorrow-Night-Eighties")
	-- vim.cmd("colorscheme tokyonight-moon")
	-- vim.cmd("colorscheme onehalfdark")
	-- vim.cmd("colorscheme nightfox")
	vim.cmd("colorscheme catppuccin-macchiato")
	-- vim.cmd("colorscheme catppuccin-frappe")
	-- vim.cmd("colorscheme catppuccin-mocha")
	-- vim.cmd("colorscheme kanagawa")
	-- vim.cmd("colorscheme palenight")
	-- vim.cmd("colorscheme palenightfall")
end
-- -----
require('04_highlighting') -- Obavezno POSLE izbora teme!
-- -----
vim.opt.syntax          = "on"
vim.opt.filetype        = "on"
vim.opt.filetype.plugin = "on"
vim.opt.wildmenu        = true
-- ---------------------------------------------------------
-- opcija list (malo čudan naziv) menja - u prikazu
-- (ne bukvalno), whitespace znakove specijalnim znakovima
-- (ispod je definisano koji se tačno znaci koriste)
-- ◦ • ⋅ ‣  ↲ ⁞ ▸ → ~ ⟩ ⟨
vim.opt.listchars = "space:.,multispace:◦⋅⋅⋅,eol:↲,tab:⁞-,trail:~,extends:⟩,precedes:⟨"
vim.opt.fillchars:append("vert:╵")             -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
vim.opt.fillchars:append("stl: ")
vim.opt.fillchars:append("stlnc: ")
-- " ---- guicolor fix -------------------------------------
-- " set background=dark
-- " set t_Co=256
-- if exists('+termguicolors')
--     let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
--     let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
-- endif
-- ---------------------------------------------------------
vim.opt.termguicolors = true
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
vim.api.nvim_create_autocmd("BufEnter" , {
	pattern = "*",
	command = "lua OpcijeZaFormatiranje()"
})
--
vim.api.nvim_create_autocmd("BufEnter" , {
	pattern = "*",
	command = "setlocal formatoptions=crqn2l1j"
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
	require ('plugins')
end
-- -----------------------------------------------------------------------------

