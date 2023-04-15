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
-- Plugin - Aerial:
-- -------------------------------------------------------------------------- -
require('aerial').setup({
	backends = {
		-- "ale",
		"lsp",
		"treesitter",
		-- "markdown",
		-- "man"
	},
	show_guides        = true,
	filter_kind        = false,
	highlight_closest  = false,
	highlight_on_hover = true,
	manage_folds       = true,
})
-- -------------------------------------------------------------------------- -
-- Plugin - Telescope:
-- -------------------------------------------------------------------------- -
require('telescope').load_extension('aerial')
require("telescope").load_extension("ui-select")

-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- -------------------------------------------------------------------------- -
-- Plugin - LF:
-- -------------------------------------------------------------------------- -
vim.g.lf_replace_netrw    = false
vim.g.lf_command_override = 'lfrun'
vim.g.floaterm_title      = "[lf]"
vim.g.lf_width            = 0.6
vim.g.lf_height           = 0.7
-- Auto-pairs:
-- vim.g.AutoPairs           = { ['['] = ']' , ['{'] = '}' }
-- -----------------------------------------------------------------------------
local ft = require('Comment.ft')
ft.set("imd" , "!!%s")
-- -----------------------------------------------------------------------------
require("inc_rename").setup({
	input_buffer_type = "dressing",
})
-- -----------------------------------------------------------------------------
require('dressing').setup()
-- -----------------------------------------------------------------------------
-- require('colorizer').setup()
-- -----------------------------------------------------------------------------
-- vim.g.Hexonicase_highlighters = "sign_column"
-- vim.g.Hexonicase_highlighters = "backgroundfull"
-- -----------------------------------------------------------------------------
