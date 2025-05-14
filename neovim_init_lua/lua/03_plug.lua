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
require("lazy").setup(
	{
		-- ---------------------------------------------
		-- "folke/neodev.nvim",
		{
			"folke/lazydev.nvim",
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		"nvim-tree/nvim-web-devicons",
		"kyazdani42/nvim-tree.lua",
		-- "nvim-tree/nvim-tree.lua",
		"dstein64/vim-startuptime",
		-- ---------------------------------------------
		-- LSP (i pomoćni)
		-- ---------------------------------------------
		-- "neovim/nvim-lspconfig",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/nvim-cmp",
		-- "hrsh7th/cmp-nvim-lua", -- lazydev ga poništava?
		                           -- Da.
		"mfussenegger/nvim-lint",
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
			build  = ":TSUpdate",
			-- commit = "64d1696"
		},
		"nvim-treesitter/playground",
		-- ---------------------------------------------
		-- Git:
		-- ---------------------------------------------
		-- nvim v0.8.0
		{
			"kdheepak/lazygit.nvim",
			lazy = true,
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			-- optional for floating window border decoration
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			-- setting the keybinding for LazyGit with 'keys' is recommended in
			-- order to load the plugin when the command is run for the first time
			keys = {
				{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
			}
		},
		-- ---------------------------------------------
		-- Lualine:
		-- ---------------------------------------------
		"nvim-lualine/lualine.nvim",
		-- ---------------------------------------------
		-- Telescope:
		-- ---------------------------------------------
		-- "ibhagwan/fzf-lua",
		{
			'nvim-telescope/telescope.nvim',
			tag = '0.1.8',
			-- branch = 'feat/unwritten-buffer-previewer',
			-- branch = '0.1.x',
			-- branch = 'master',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make'
		},
		"nvim-telescope/telescope-ui-select.nvim",
		-- ---------------------------------------------
		-- Vim visual multi (multi cursor):
		-- ---------------------------------------------
		"mg979/vim-visual-multi",
		-- ---------------------------------------------
		-- Startify:
		-- ---------------------------------------------
		-- "mhinz/vim-startify",
		{
			"goolord/alpha-nvim",
			config = function()
				local alpha = require'alpha'
				local startify = require'alpha.themes.startify'
				startify.section.header.val = CowSay
				-- startify.section.header.val = {
				-- 	"                                                     ",
				-- 	-- "                                                     ",
				-- 	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				-- 	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				-- 	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				-- 	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				-- 	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				-- 	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				-- }
				startify.section.bottom_buttons.val = {
					startify.button( "q", "  Quit" , ":lua AlphaQuit()<cr>"),
				}
				alpha.setup(startify.config)
			end
		},
		-- ---------------------------------------------
		-- lf nvim:
		-- ---------------------------------------------
		"akinsho/toggleterm.nvim",
		"lmburns/lf.nvim",
		-- "ptzz/lf.vim",
		-- "voldikss/vim-floaterm",
		-- ---------------------------------------------
		-- Comment.nvim:
		-- ---------------------------------------------
		{
			"numToStr/Comment.nvim",
			config = function()
				require('Comment').setup({
					toggler = {
						line  = '<M-g>',
						block = '<M-c>',
					},
					opleader = {
						line  = '<M-g>',
						block = '<M-c>',
					}
				})
			end
		},
		-- ---------------------------------------------
		-- Color themes:
		-- ---------------------------------------------
		-- "drewtempelmeyer/palenight.vim",
		-- "JoosepAlviste/palenightfall.nvim",
		"catppuccin/nvim",
		"projekt0n/github-nvim-theme",
		-- "folke/tokyonight.nvim",
		-- "projekt0n/github-nvim-theme",
		-- "rmehri01/onenord.nvim",
		-- "olimorris/onedarkpro.nvim",
		-- "sainnhe/sonokai",
		-- "flazz/vim-colorschemes",
		-- "chriskempson/base16-vim",
		-- "sonph/onehalfi", { 'rtp': 'vim' },
		-- "gilgigilgil/anderson.vim"
		-- ---------------------------------------------
		-- Ostalo:
		-- ---------------------------------------------
		"brenoprata10/nvim-highlight-colors",
		-- "ap/vim-css-color",
		-- "norcalli/nvim-colorizer.lua",
		-- {
			-- "rrethy/vim-hexokinase",
			-- run = 'make hexokinase'
		-- },
		"windwp/nvim-autopairs",
		"RRethy/vim-illuminate",
		"mfussenegger/nvim-dap",
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"mfussenegger/nvim-dap",
				"nvim-neotest/nvim-nio"
			}
		},
		"theHamsta/nvim-dap-virtual-text",
		-- "jiangmiao/auto-pairs",
		-- "LunarWatcher/auto-pairs",
		-- "cohama/lexima.vim",
		-- "godlygeek/tabular",
		-- "stevearc/dressing.nvim",
		-- "liangxianzhe/floating-input.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				vim.notify = require('notify')
			end
		},
		"kevinhwang91/nvim-bqf",
		-- "nvimdev/indentmini.nvim",
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
		},
		-- "nikola-vukicevic/breadcrumbs-nvim",
		-- "nikola-vukicevic/util-input-window.nvim",
		-- ---------------------------------------------
	}, -- END OF Plugins
	-- -------------------------------------------------
	{  -- Lazy options:
		-- ---------------------------------------------
		-- UI:
		-- ---------------------------------------------
		ui = {
			border = "rounded",
			size = {
				width  = 0.5,
				height = 0.7
			}
		},
	} -- END OF Lazy options
) -- END OF require("lazy").setup()
-- -----------------------------------------------------------------------------

