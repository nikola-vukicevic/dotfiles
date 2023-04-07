------------------------------------------------------------
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{
					key = "u", action = "dir_up"
				},
			},
		},
	},
	renderer = {
		group_empty            = false,
		highlight_git          = false,
		highlight_opened_files = "all",
	},
	filters = {
		dotfiles = false,
	},
	modified = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
      -- debounce_delay = 50,
    },
})

