------------------------------------------------------------
function format_bufer_number()
	return string.format("[%d]", vim.api.nvim_buf_get_number(0))
end
------------------------------------------------------------
function format_modified()
	if vim.bo.modified then
		return "[+]"
	else
		return ""
	end
end
------------------------------------------------------------
function format_unmodified()
	if not vim.bo.modified then
		return "[ ]"
	else
		return ""
	end
end
------------------------------------------------------------
function format_read_only()
	if vim.bo.readonly then
		return "[RO]"
	else
		return ""
	end
end
------------------------------------------------------------
function format_separator()
	return ""
end
------------------------------------------------------------
require('lualine').setup {
	options = {
		theme = '00_tema_1',
		-- theme = 'onedark',
	},
	sections = {
		lualine_b = { 'branch', 'diff' },
		lualine_c = {
			{ format_bufer_number, padding = { left = 1, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#556677" } },
			-- { format_unmodified,   padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#556677" } },
			{ format_modified,     padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#ee8855" } },
			{ format_read_only,    padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#5588ee" } },
			{ format_separator,    padding = { left = 1, right = 1 }, component_separators = { left = "", right = "" }, color = { fg = "#aaaaaa" } },
			{ '%f',                padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" } },
			{ format_separator,    padding = { left = 1, right = 1 }, component_separators = { left = "", right = "" }, color = { fg = "#aaaaaa" } },
			{
				function()
					local p = vim.fn['tagbar#currenttag']('%s', '')
					return p
				end,
				color = { fg = "#aabbdd" }, padding = { left = 0 , right = 0 }
			},
		},
		lualine_y = { 'diagnostics' },
		lualine_z = {
			{ '%3l:%2v (%2c)[%L] %3b/0x%3B', color = { gui = '' } }, 
			{ format_modified,               color = { fg  = '#dddddd' } } 
			-- { '%3l:%2v (%2c)[%L] ', color = { gui = '' } } ,
			-- { '%3b/0x%3B%m', color = { gui = '' } } 
		}		
	},
}
------------------------------------------------------------

