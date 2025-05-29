-- -----------------------------------------------------------------------------
vim.opt.mouse         = "a"
vim.g.floaterm_opener = "edit"
vim.g.jezik           = "SR"
vim.g.spell_check     = false
vim.g.auto_lsp_float  = false
vim.g.diff_mode       = false
-- vim.g.lsp_progres     = 0
-- -----------------------------------------------------------------------------
if vim.fn.argv(0) == "barebones" then
	vim.g.barebones_CFG = true
else
	vim.g.barebones_CFG = false
end
-- -----------------------------------------------------------------------------
require('01_map')
require('02_funkcije')
require('pretty_hover_middleware')
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
vim.opt.showcmdloc  = "statusline"
vim.opt.clipboard   = "unnamedplus"
vim.opt.pumheight   = 20
-- vim.opt.ttimeout    = true
vim.opt.ttimeoutlen = 4
vim.opt.number      = true
vim.opt.showmode    = false
-- vim.opt.autoindent  = true
-- vim.opt.smartindent = true
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
	-- vim.cmd("colorscheme palenight")
	-- vim.cmd("colorscheme palenightfall")
	-- vim.cmd("colorscheme tokyonight-moon")
	-- vim.cmd("colorscheme tokyonight")
	vim.cmd("colorscheme catppuccin-macchiato")
	-- vim.cmd("colorscheme onedark")
	-- vim.cmd("colorscheme catppuccin-latte")
	-- vim.cmd("colorscheme catppuccin-frappe")
	-- vim.cmd("colorscheme catppuccin-mocha")
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
-- vim.opt.listchars = "space:.,multispace:◦⋅⋅⋅,eol:↲,tab:⁞-,trail:~,extends:⟩,precedes:⟨"
vim.opt.listchars = "space:.,multispace:◦⋅⋅⋅,eol:↲,tab:│-,trail:~,extends:⟩,precedes:⟨"
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

-- vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
-- 	command = "checktime"
-- })
--
-- vim.api.nvim_create_autocmd("FocusGained,BufEnter", {
-- 	command = "checktime"
-- })
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
-- close quickfix menu after selecting choice
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]]})
--
vim.opt.updatetime = 500
--
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = {
		"*.imd",
		"*.html",
		"*.txt",
	},
	callback = function()
		vim.cmd("set wrap")
		vim.cmd("set spelllang=sr")
		vim.cmd("set spell")
		vim.g.spell_check = true
	end
})
--
vim.api.nvim_create_autocmd("BufEnter", {
	pattern  = {
		"*.zig",
		"*.py"
	},
	callback = function ()
		require("ibl").setup({
			indent = {
				char = "┆";
			};
			scope = {
				include = {
					node_type = {
						python = {
							"if_statement",
							"while_statement",
							"for_statement",
							"list",
							"string_content",
							"interpolation"
						},
						zig = {
							"labeled_statement";
							"while_statement";
							"for_statement";
							"block";
							"block_expression";
							"function_declaration";
							"anonymous_struct_initializer";
						},
					}
				}
			}
		});
	end
})
-- -----------------------------------------------------------------------------
-- Save *.imd pokreće parsiranje članka:
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePost" , {
	pattern = "*.imd",
	command = ":w !node /home/korisnik/git/node/markdown/idiosync_parser.js"
	-- command = ":w !python /home/korisnik/git/python/markdown/idiosync_parser.py"
})
--
vim.api.nvim_create_autocmd("BufWritePost" , {
	pattern = "*.ts",
	command = ":w !tsc"
})
--
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern  = "*",
	callback = function()
		vim.g.insert_okidac = ""
	end
})
--
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern  = "*",
	callback = function()
		vim.g.last_edit_virtcol = vim.fn.virtcol(".")
	end
})
--
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	pattern = {"*"},
-- 	callback = function()
-- 		local cursor_pos = vim.fn.getpos(".")
-- 		vim.cmd [[%s/\s\+$//e]]
-- 		vim.cmd [[%s/\n\{2,}\%$/\r/e]]
-- 		vim.fn.setpos(".", cursor_pos)
-- 	end,
-- })
--
vim.api.nvim_create_autocmd({ "Cursormoved"	}, {
	pattern = {
		"*.c", "*.cpp", "*.h", "*.hpp",
		"*.html", "*.css",
		"*.js", "*.ts", "*.mjs", "*.mts", "*.cjs", "*.cts",
		"*.lua",
		"*.py",
		"*.rs",
		"*.zig"
	},
	callback = function()
		if vim.g.auto_lsp_float == true then
			vim.diagnostic.open_float({
				border = 'rounded',
				width  = 60
			})
		end
		if vim.g.auto_lsp_hover == true then
			LSPHover()
			-- vim.lsp.buf.hover({
			-- 	border = 'rounded',
			-- 	width  = 60
			-- })
		end
	end
})
-- -----------------------------------------------------------------------------
if vim.g.barebones_CFG ~= true then
	require ('plugins')
end
-- -----------------------------------------------------------------------------
vim.ui.input = function(opts, on_confirm)
	require('util-input-window').input(opts, on_confirm, {
		-- border = "single",
	})
end
-- -----------------------------------------------------------------------------
-- require('breadcrumbs')
-- require('prozor_proba')

