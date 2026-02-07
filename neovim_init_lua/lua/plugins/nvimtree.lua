------------------------------------------------------------
-- Highlights:
------------------------------------------------------------
vim.cmd("hi NvimTreeOpenedFile   gui=underline guifg=#ff4455")
vim.cmd("hi NvimTreeModifiedFile guifg=#ff8833")
------------------------------------------------------------
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
		-- mappings = {
		-- 	list = {
		-- 		{
		-- 			key = "u", action = "dir_up"
		-- 		},
		-- 	},
		-- },
	},
	git = {
		enable = true,
	},
	renderer = {
		group_empty            = false,
		highlight_git          = true,
		highlight_opened_files = "all",
		icons = {
			git_placement      = "after",
			modified_placement = "after",
			glyphs = {
				modified = "[+]",
				git = {
					staged   = "[s]",
					unstaged = "[u]",
				},
			},
		},
	},
	update_focused_file = {
		enable = true,
	},
	filters = {
		dotfiles = false,
	},
	modified = {
		enable            = true,
		show_on_dirs      = true,
		show_on_open_dirs = true,
		-- debounce_delay = 50,
	},
})

