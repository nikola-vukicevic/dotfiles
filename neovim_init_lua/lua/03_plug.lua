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
		"folke/neodev.nvim",
		"nvim-tree/nvim-web-devicons",
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
			build  = ":TSUpdate",
			-- commit = "64d1696"
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
			'nvim-telescope/telescope.nvim', tag = '0.1.4',
			-- or                              , branch = '0.1.1',
			dependencies = { { 'nvim-lua/plenary.nvim' } }
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
	   --              -- "                                                     ",
				--     "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				--     "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				--     "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				--     "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				--     "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				--     "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				--     -- "                                                     ",
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
				require('Comment').setup()
			end
		},
		-- ---------------------------------------------
		-- Color themes:
		-- ---------------------------------------------
		"drewtempelmeyer/palenight.vim",
		"JoosepAlviste/palenightfall.nvim",
		"catppuccin/nvim",
		"folke/tokyonight.nvim",
		-- "sainnhe/sonokai",
		-- "flazz/vim-colorschemes",
		-- "chriskempson/base16-vim",
		-- "sonph/onehalfi", { 'rtp': 'vim' },
		-- "gilgigilgil/anderson.vim"
		-- ---------------------------------------------
		-- Ostalo:
		-- ---------------------------------------------
		-- "ap/vim-css-color",
		-- "norcalli/nvim-colorizer.lua",
		{
			-- "rrethy/vim-hexokinase",
			-- run = 'make hexokinase'
		},
		"windwp/nvim-autopairs",
		"RRethy/vim-illuminate",
		"mfussenegger/nvim-dap",
		-- "jiangmiao/auto-pairs",
		-- "LunarWatcher/auto-pairs",
		-- "cohama/lexima.vim",
		-- "godlygeek/tabular",
		"stevearc/dressing.nvim",
		"kevinhwang91/nvim-bqf",
		-- "nikola-vukicevic/breadcrumbs-nvim",
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

