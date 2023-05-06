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
     -- delay: delay in milliseconds
     delay = 40,
})
-- -------------------------------------------------------------------------- -
-- Plugin - Telescope:
-- -------------------------------------------------------------------------- -
require("telescope").load_extension("ui-select")
local telescope_actions = require('telescope.actions')
vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
--
-- This is your opts table
require("telescope").setup({
	extensions = {
		--
		["ui-select"] = {
			require("telescope.themes").get_dropdown {

			}
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
	pickers = {
		ignore_current_buffer = true,
		sort_mru              = true,
	},
	defaults = {
		-- borderchars    = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		layout_config  = {
			horizontal = {
				width         = 0.75,
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
				["<esc>"] = telescope_actions.close,
			},
		},
	}
})
-- -------------------------------------------------------------------------- -
-- Plugin - LF:
-- -------------------------------------------------------------------------- -
vim.g.lf_replace_netrw     = false
vim.g.lf_command_override  = 'lfrun'
vim.g.floaterm_title       = "─ [lf] "
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
vim.g.lf_width             = 0.6
vim.g.lf_height            = 0.7
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
require('dressing').setup({
	input = {
		win_options = {
			winblend = 0,
			wrap     = true,
		}
	}
})
-- -----------------------------------------------------------------------------
-- require('colorizer').setup()
-- -----------------------------------------------------------------------------
-- vim.g.Hexonicase_highlighters = "sign_column"
vim.g.Hexonicase_highlighters = "backgroundfull"
-- -----------------------------------------------------------------------------

