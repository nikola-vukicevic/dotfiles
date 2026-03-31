-- -----------------------------------------------------------------------------
local github_url_prefix = "https://github.com/"
-- -----------------------------------------------------------------------------
vim.pack.add({
	-- ---------------------------------------------
	github_url_prefix .. "folke/lazydev.nvim",
	-- "folke/neodev.nvim",
	github_url_prefix .. "nvim-tree/nvim-web-devicons",
	github_url_prefix .. "kyazdani42/nvim-tree.lua",
	-- "nvim-tree/nvim-tree.lua",
	github_url_prefix .. "dstein64/vim-startuptime",
	-- ---------------------------------------------
	-- LSP (i pomoćni):
	-- ---------------------------------------------
	-- "neovim/nvim-lspconfig",
	github_url_prefix .. "onsails/lspkind.nvim",
	github_url_prefix .. "hrsh7th/cmp-nvim-lsp",
	github_url_prefix .. "hrsh7th/cmp-buffer",
	github_url_prefix .. "hrsh7th/cmp-path",
	github_url_prefix .. "hrsh7th/cmp-cmdline",
	github_url_prefix .. "hrsh7th/cmp-calc",
	github_url_prefix .. "hrsh7th/nvim-cmp",
	-- github_url_prefix .. "hrsh7th/cmp-nvim-lsp-signature-help",
	-- github_url_prefix .. "hrsh7th/cmp-nvim-lua", -- lazydev ga poništava?
							                        -- Da.
	github_url_prefix .. "Fildo7525/pretty_hover",
		-- TODO (izgleda da je ok po defaultu)
		-- event = "LspAttach",
		-- opts = {}
	github_url_prefix .. "ray-x/lsp_signature.nvim",
	-- ---------------------------------------------
	-- Snipeti:
	-- ---------------------------------------------
	github_url_prefix .. "L3MON4D3/LuaSnip",
	github_url_prefix .. "saadparwaiz1/cmp_luasnip",
	github_url_prefix .. "rafamadriz/friendly-snippets",
	-- ---------------------------------------------
	-- Linter:
	-- ---------------------------------------------
	github_url_prefix .. "mfussenegger/nvim-lint",
	-- ---------------------------------------------
	-- Tree-sitter
	-- ---------------------------------------------
	-- {
	github_url_prefix .. "nvim-treesitter/nvim-treesitter",
		-- TODO (izgleda da je ok po defaultu)
		-- branch = "main",
		-- lazy   = false,
		-- build  = ":TSUpdate",
		-- commit = "64d1696"
	-- },
	-- {
	github_url_prefix .. "nvim-treesitter/nvim-treesitter-textobjects",
		-- TODO (izgleda da je ok po defaultu)
		-- branch = "main"
	-- },
	-- "nvim-treesitter/playground",
	-- ---------------------------------------------
	-- DAP:
	-- ---------------------------------------------
	github_url_prefix .. "mfussenegger/nvim-dap",
	github_url_prefix .. "nvim-neotest/nvim-nio",
	github_url_prefix .. "rcarriga/nvim-dap-ui",
	github_url_prefix .. "theHamsta/nvim-dap-virtual-text",
	-- ---------------------------------------------
	-- Git:
	-- ---------------------------------------------
	github_url_prefix .. "kdheepak/lazygit.nvim",
	-- 	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- 	-- order to load the plugin when the command is run for the first time
	-- 	keys = {
	-- 		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
	-- 	}
	-- ---------------------------------------------
	-- Lualine:
	-- ---------------------------------------------
	github_url_prefix .. "nvim-lualine/lualine.nvim",
	-- ---------------------------------------------
	-- Telescope:
	-- ---------------------------------------------
	github_url_prefix .. "nvim-lua/plenary.nvim",
	github_url_prefix .. "nvim-telescope/telescope-ui-select.nvim",
	github_url_prefix .. "nvim-telescope/telescope.nvim",
		-- version = "*",
		-- TODO (izgleda da je ok po defaultu)
		-- branch = 'master',
		-- branch = 'feat/unwritten-buffer-previewer',
		-- tag = "0.2.1",
		-- branch = '0.1.x',
	-- 	"folke/snacks.nvim",
	-- ---------------------------------------------
	-- Vim visual multi (multi cursor):
	-- ---------------------------------------------
	github_url_prefix .. "mg979/vim-visual-multi",
	-- ---------------------------------------------
	-- Startify:
	-- ---------------------------------------------
	-- "mhinz/vim-startify",
	github_url_prefix .. "goolord/alpha-nvim",
	-- ---------------------------------------------
	-- Session management:
	-- ---------------------------------------------
	-- Od 08.02.2026. - obavlja se preko DIY funkcija
	-- {
	-- 	"folke/persistence.nvim",
	-- 	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	-- 	opts = {
	-- 	-- add any custom options here
	-- 	}
	-- },
	-- ---------------------------------------------
	-- lf nvim:
	-- ---------------------------------------------
	github_url_prefix .. "akinsho/toggleterm.nvim",
		-- TODO (trebalo bi da je sve ok - proveriti još malo)
		-- version = "*",
		-- config  = true
	github_url_prefix .. "lmburns/lf.nvim",
	-- "ptzz/lf.vim",
	-- "voldikss/vim-floaterm",
	-- ---------------------------------------------
	-- Comment.nvim:
	-- ---------------------------------------------
	github_url_prefix .. "numToStr/Comment.nvim",
	-- ---------------------------------------------
	-- LSP symbols side window:
	-- ---------------------------------------------
	-- {
	-- 	"hedyhli/outline.nvim",
	-- 	config = function()
	-- 		require("outline").setup {
	-- 			outline_window = {
	-- 				width = 36,
	-- 				relative_width = false,
	-- 			},
	-- 			keymaps = {
	-- 				toggle_preview = "h",
	-- 			},
	-- 			symbols = {
	-- 				icons = {
	-- 					Function = { icon = "f", hl = "OutlineFunction" },
	-- 				}
	-- 			}
	-- 		}
	-- 	end,
	-- },
	-- ---------------------------------------------
	-- Color themes:
	-- ---------------------------------------------
	-- "drewtempelmeyer/palenight.vim",
	-- "JoosepAlviste/palenightfall.nvim",
	github_url_prefix .. "catppuccin/nvim",
	github_url_prefix .. "projekt0n/github-nvim-theme",
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
	github_url_prefix .. "brenoprata10/nvim-highlight-colors",
	-- "ap/vim-css-color",
	-- "norcalli/nvim-colorizer.lua",
	-- {
		-- "rrethy/vim-hexokinase",
		-- run = 'make hexokinase'
	-- },
	github_url_prefix .. "windwp/nvim-autopairs",
	github_url_prefix .. "RRethy/vim-illuminate",
	-- "jiangmiao/auto-pairs",
	-- "LunarWatcher/auto-pairs",
	-- "cohama/lexima.vim",
	-- "godlygeek/tabular",
	-- "stevearc/dressing.nvim",
	-- "liangxianzhe/floating-input.nvim",
	-- {
	github_url_prefix .. "rcarriga/nvim-notify",
	github_url_prefix .. "kevinhwang91/nvim-bqf",
	-- "nvimdev/indentmini.nvim",
	-- {
	github_url_prefix .. "lukas-reineke/indent-blankline.nvim",
		-- TODO (izgleda da je ok po defaultu)
		-- main = "ibl",
		-- ---@module "ibl"
		-- ---@type ibl.config
		-- opts = {},
	-- },
		-- "nikola-vukicevic/breadcrumbs-nvim",
		-- "nikola-vukicevic/util-input-window.nvim",
		-- ---------------------------------------------
}) -- END OF vim.pack.add
-- -----------------------------------------------------------------------------
local alpha = require"alpha"
local startify = require"alpha.themes.startify"
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
	-- startify.button( "s", "Select session" , ":lua SelectSession()<cr>"),
	startify.button( "r", "Restore last session (cwd)" , ":lua LoadSession('cwd')<cr>"),
	startify.button( "l", "Restore last session" , ":lua LoadSession('last')<cr>"),
	startify.button( "q", " Quit" , ":lua AlphaQuit()<cr>"),
}
alpha.setup(startify.config)
-- -----------------------------------------------------------------------------
require("lazydev").setup({
	opts = {
		library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			"nvim-dap-ui"
		},
	},
})
-- -----------------------------------------------------------------------------
require("Comment").setup({
	toggler = {
		line  = "<M-g>",
		block = "<M-c>",
	},
	opleader = {
		line  = "<M-g>",
		block = "<M-c>",
	}
})
-- -----------------------------------------------------------------------------
require("lsp_signature").setup({
	opts = {
		-- cfg options
		-- max_width = 20;
		max_width = function ()
			return 80
		end;
		hint_prefix = ">> ";
		hint_scheme = "LspSignatureHint";
		doc_lines = 0;
	},
})
-- -----------------------------------------------------------------------------
vim.notify = require("notify")
-- -----------------------------------------------------------------------------
vim.keymap.set("" , "<leader>lg" , "<cmd>LazyGit<cr>" , { desc = "LazyGit" , remap = false } )
-- -----------------------------------------------------------------------------

