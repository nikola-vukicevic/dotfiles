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
	-- "kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"dstein64/vim-startuptime",
	-- ---------------------------------------------
	-- LSP (i pomoćni)
	-- ---------------------------------------------
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind.nvim",
	"ray-x/lsp_signature.nvim",
	-- ---------------------------------------------
	-- Snipeti:
	-- ---------------------------------------------
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	-- ---------------------------------------------
	-- LSP Saga:
	-- ---------------------------------------------
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons"
			},
			--Please make sure you install markdown and markdown_inline parser
			{
				"nvim-treesitter/nvim-treesitter"
			}
		}
	},
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
	-- FZF:
	-- ---------------------------------------------
	"junegunn/fzf",
	"junegunn/fzf.vim",
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
	-- ---------------------------------------------
	-- Ostalo:
	-- ---------------------------------------------
	"ap/vim-css-color",
	"jiangmiao/auto-pairs",
	"RRethy/vim-illuminate",
	-- ---------------------------------------------
	}, { -- Options:
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
})
-- -----------------------------------------------------------------------------
-- LF:
vim.g.lf_replace_netrw    = false
vim.g.lf_command_override = 'lfrun'
vim.g.floaterm_title      = "[lf]"
vim.g.lf_width            = 0.6
vim.g.lf_height           = 0.7
-- Auto-pairs:
vim.g.AutoPairs           = { ['['] = ']' , ['{'] = '}' }
-- -----------------------------------------------------------------------------
local ft = require('Comment.ft')
ft.set("imd" , "!!%s")
-- -----------------------------------------------------------------------------

