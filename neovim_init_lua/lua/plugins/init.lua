-- -------------------------------------------------------------------------- -
-- Moduli:
-- -------------------------------------------------------------------------- -
require('plugins/lualine')
require('plugins/nvimtree')
require('plugins/lsp')
require('plugins/luasnip')
require('plugins/cmp')
-- -------------------------------------------------------------------------- --
vim.api.nvim_create_autocmd("TextChangedI", {
	pattern = "*",
	command = "lua require('plugins/debounce').debounce()"
})
-- -------------------------------------------------------------------------- --
-- Plugin - Tree-sitter:
-- -------------------------------------------------------------------------- --
local treesitter = require('nvim-treesitter.configs')
--
treesitter.setup {
	ensure_installed = {  },
	sync_install   = false,
	auto_install   = true,
	ignore_install = { },
	highlight      = {
		enable  = true,
		disable = {
			-- "c" ,
			-- "html" ,
			-- "css" ,
			-- "javascript" ,
			-- "lua" ,
			-- "php" ,
			-- "rust"
		},
    additional_vim_regex_highlighting = false,
  },
}
-- -------------------------------------------------------------------------- -
-- Plugin - Illuminate:
-- -------------------------------------------------------------------------- -
require('illuminate').configure({
	-- providers = {
	-- 	'lsp',
	-- 	'treesitter',
	-- 	'regex',
	-- },
     -- delay: delay in milliseconds
     delay = 10,
})
-- -------------------------------------------------------------------------- -
-- Plugin - Telescope:
-- -------------------------------------------------------------------------- -
local telescope_actions = require('telescope.actions')
vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
--
require("telescope").setup({
	defaults = {
		initial_mode = "normal",
		-- borderchars    = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		layout_config  = {
			horizontal = {
				width         = 0.70,
				height        = 0.85,
				preview_width = 0.52,
			},
		},
		mappings = {
			i = {
				-- ["<esc>"] = telescope_actions.close,
				-- ["<F1"]   = telescope_actions.close,
			},
			n = {
				["q"] = telescope_actions.close,
				-- ["<esc>"] = telescope_actions.close,
			},
		},
	},
	pickers = {
		ignore_current_buffer = true,
		sort_mru              = true,

		live_grep = {
			initial_mode = 'insert'
		},

		buffers = {
			sort_mru = true
		}
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				layout_strategy = "cursor",
				layout_config = {
					width  = 54,
					height = 9,
					-- TODO: funkcija koja prebrojava
					-- stavke u meniju
				}
			})
		},
		--
		['fzf'] = {
			fuzzy                   = true,          -- false will only do exact matching
			override_generic_sorter = true,          -- override the generic sorter
			override_file_sorter    = true,          -- override the file sorter
			case_mode               = "smart_case",  -- or "ignore_case" or "respect_case"
		                                             -- the default case_mode is "smart_case"
		},
	},
})
--
require("telescope").load_extension("ui-select")
-- -------------------------------------------------------------------------- -
-- Plugin - LF:
-- -------------------------------------------------------------------------- -
require('lf').setup({
	winblend = 0,
	width    = 102,
	height   = 25,
	border   = "rounded",
})
-- vim.g.lf_replace_netrw     = false
-- vim.g.lf_command_override  = 'lfrun'
-- vim.g.floaterm_title       = "─ [lf] "
-- vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
-- vim.g.lf_width             = 0.6
-- vim.g.lf_height            = 0.7
-- Auto-pairs:
-- vim.g.AutoPairs           = { ['['] = ']' , ['{'] = '}' }
-- -----------------------------------------------------------------------------
local ft = require('Comment.ft')
ft.set("imd" , "!!%s")
-- -----------------------------------------------------------------------------
-- require("inc_rename").setup({
-- 	input_buffer_type = "dressing",
-- })
-- -----------------------------------------------------------------------------
-- require('dressing').setup({
-- 	input = {
-- 		win_options = {
-- 			winblend = 0,
-- 			wrap     = true,
-- 		}
-- 	}
-- })
-- -----------------------------------------------------------------------------
require('nvim-highlight-colors').setup({
	render                  = 'virtual',
	enable_var_usage        = true,
	virtual_symbol_position = 'eol',
})
-- -----------------------------------------------------------------------------
require('dapui').setup()
-- -----------------------------------------------------------------------------
require("ibl").setup({
	scope = {
		include = {
			node_type = {
				python = {
					"while_statement",
				},
				css = {
					"rule_set",
				},
				["*"] = {
					"switch_statement",
					"array",
					"object",
					"enum_declaration",
					"class_declaration",
					"interface_declaration",
					"import_statement",
					"initializer_list",
				}
			},
		}
	}
})

