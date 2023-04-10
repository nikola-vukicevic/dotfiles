-- -------------------------------------------------------------------------- -
require('plugins/lualine')
require('plugins/treesitter')
require('plugins/nvimtree')
require('plugins/lsp')
require('plugins/luasnip')
require('plugins/cmp')
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
require('telescope').load_extension('aerial')
-- -------------------------------------------------------------------------- -

