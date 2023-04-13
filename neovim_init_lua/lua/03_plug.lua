-- -----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
-- -----------------------------------------------------------------------------
vim.opt.rtp:prepend(lazypath)
-- -----------------------------------------------------------------------------
require("lazy").setup({
	-- ---------------------------------------------
	"folke/neodev.nvim",
	"nvim-tree/nvim-web-devicons",
	"stevearc/aerial.nvim",
	"kyazdani42/nvim-tree.lua",
	"dstein64/vim-startuptime",
	-- ---------------------------------------------
	-- LSP (i pomoćni)
	-- ---------------------------------------------
	"neovim/nvim-lspconfig",
	"onsails/lspkind.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-calc",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/nvim-cmp",
	-- "hrsh7th/cmp-nvim-lua",
	-- ---------------------------------------------
	-- Snipeti:
	-- ---------------------------------------------
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	-- ---------------------------------------------
	-- Tree-sitter
	-- ---------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	"nvim-treesitter/playground",
	-- ---------------------------------------------
	-- Lualine:
	-- ---------------------------------------------
	"nvim-lualine/lualine.nvim",
	-- ---------------------------------------------
	-- Telescope:
	-- ---------------------------------------------
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                              , branch = '0.1.1',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
	-- ---------------------------------------------
	-- Vim visual multi (multi cursor):
	-- ---------------------------------------------
	"mg979/vim-visual-multi",
	-- ---------------------------------------------
	-- Startify:
	-- ---------------------------------------------
	"mhinz/vim-startify",
	-- ---------------------------------------------
	-- lf vim:
	-- ---------------------------------------------
	"ptzz/lf.vim",
	"voldikss/vim-floaterm",
	-- ---------------------------------------------
	-- Comment.nvim:
	-- ---------------------------------------------
	{
		"numToStr/Comment.nvim",
		config = function()
			require('Comment').setup()
		end
	},
	-- ---------------------------------------------
	-- Color themes:
	-- ---------------------------------------------
	"drewtempelmeyer/palenight.vim",
	"JoosepAlviste/palenightfall.nvim",
	"folke/tokyonight.nvim",
	"rebelot/kanagawa.nvim",
	"catppuccin/nvim",
	"flazz/vim-colorschemes",
	-- "chriskempson/base16-vim",
	-- "sonph/onehalfi", { 'rtp': 'vim' },
	-- "gilgigilgil/anderson.vim"
	-- ---------------------------------------------
	-- Ostalo:
	-- ---------------------------------------------
	"ap/vim-css-color",
	-- "jiangmiao/auto-pairs",
	-- "LunarWatcher/auto-pairs",
	"windwp/nvim-autopairs",
	-- "cohama/lexima.vim",
	"RRethy/vim-illuminate",
	-- "godlygeek/tabular",
	"nvim-telescope/telescope-ui-select.nvim",
	"smjonas/inc-rename.nvim",
	"stevearc/dressing.nvim",
	-- ---------------------------------------------
	}, { -- Lazy options:
	-- ---------------------------------------------
	-- UI:
	-- ---------------------------------------------
	ui = {
		border = "single",
		size = {
			width  = 0.5,
			height = 0.7
		}
	},	
	-- ---------------------------------------------
})  -- require("lazy").setup()
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------

