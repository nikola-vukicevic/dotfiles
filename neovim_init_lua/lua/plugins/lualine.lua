-- -----------------------------------------------------------------------------
function format_bufer_number()
	return string.format("[%d]", vim.api.nvim_buf_get_number(0))
end
-- -----------------------------------------------------------------------------
function format_modified()
	if vim.bo.modified then
		return "[+]"
	else
		return ""
	end
end
-- -----------------------------------------------------------------------------
function format_unmodified()
	if not vim.bo.modified then
		return "[ ]"
	else
		return ""
	end
end
-- -----------------------------------------------------------------------------
function format_read_only()
	if vim.bo.readonly then
		return "[RO]"
	else
		return ""
	end
end
-- -----------------------------------------------------------------------------
function format_separator()
	return ""
end
-- -----------------------------------------------------------------------------
function priprema_malo_v(d1, d2)
	if d1 == d2 then
		return string.format("[%s]", d1)
	else
		return string.format("[v:%s, c:%s]", d1, d2)
	end
end
-- -----------------------------------------------------------------------------
function ocitavanje_prvog_znaka_malo_v(k1, k2)
	if k1 < k2 then
		return vim.fn.getline("v"):sub(k1, k1) -- !!!!!! da li može kraće?! !!!!!!!!!!!!!
	else
		return vim.fn.getline("v"):sub(k2, k2) -- !!!!!! da li može kraće?! !!!!!!!!!!!!!
	end
end
-- -----------------------------------------------------------------------------
function ocitavanje_korekcije_malo_v(c1)
	-- print(c1)
	if c1 == "\t" then
		return vim.opt.tabstop:get() - 1
	else
		return 0
	end
end
-- -----------------------------------------------------------------------------
function format_malo_v()
	local k1_c      = vim.fn.col("v")
	local k2_c      = vim.fn.col(".")
	local k1_v      = vim.fn.virtcol("v")
	local k2_v      = vim.fn.virtcol(".")
	local c1        = ocitavanje_prvog_znaka_malo_v(k1_c, k2_c)
	local korekcija = ocitavanje_korekcije_malo_v(c1)
	local x1        = 0
	local x2        = 0

	if k1_v < k2_v then
		x1 = k1_v
		x2 = k2_v
	else
		x1 = k2_v
		x2 = k1_v
	end

	local d_v  = math.abs(x2 - x1) + korekcija + 1
	local d_c  = math.abs(k2_c - k1_c) + 1

	-- print(string.format("[[ c1: %d, c2: %d, d_c: %d ][ v1: %d, v2: %d, d_v: %d ]]", k1_c, k2_c, d_c, k1_v, k2_v, d_v))
	return priprema_malo_v(d_v, d_c)
end
-- -----------------------------------------------------------------------------
function format_veliko_v(r)
	return string.format("[r:%s]", r)
end
-- -----------------------------------------------------------------------------
function provera_prostiranja_vselect()
	local k1 = vim.fn.getpos("v")
	local k2 = vim.fn.getpos(".")

	return math.abs(k2[2] - k1[2]) + 1
end
-- -----------------------------------------------------------------------------
function format_v_select()
	local tip = provera_prostiranja_vselect()

	if vim.fn.mode() == "v" then
		vim.opt.showcmd = false
		if tip < 2 then
			return format_malo_v()
		else
			return format_veliko_v(tip)
		end
	end

	if vim.fn.mode() == "V" then
		vim.opt.showcmd = false
		return format_veliko_v(tip)
	end

	vim.opt.showcmd = true
	return ""
end
-- -----------------------------------------------------------------------------
function format_rezultati_pretrage()
end
-- -----------------------------------------------------------------------------
function format_cmdshow()
	return vim.fn.hostname()
end
-- -----------------------------------------------------------------------------
require('lualine').setup {
	options = {
		-- theme = '00_tema_1',
		theme = 'onedark',
		-- section_separators = { left = '', right = '' }
	},
	sections = {
		lualine_b = { 'branch', 'diff' },
		lualine_c = {
			{ '%S',                padding = { left = 1, right = 1 }, component_separators = { left = "", right = "" }, color = { fg = "#ee4455" } },
			{ format_bufer_number, padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#556677" } },
			-- { format_unmodified,   padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#556677" } },
			{ format_modified,     padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#ee8855" } },
			{ format_read_only,    padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#5588ee" } },
			{ format_separator,    padding = { left = 1, right = 1 }, component_separators = { left = "", right = "" }, color = { fg = "#aaaaaa" } },
			{ 'searchcount',       padding = { left = 0, right = 1 }, component_separators = { left = "", right = "" }, color = { fg = "#aaaaff" } },
			-- { format_cmdshow,      padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" }, color = { fg = "#ee4455" } },
			-- { 'selectioncount',    padding = { left = 0, right = 1 }, component_separators = { left = "", right = "" }, color = { fg = "#ffffaa" } },
			{ format_v_select,     padding = { left = 0, right = 1 }, component_separators = { left = "", right = "" }, color = { fg = "#ffffaa" } },
			{ '%f',                padding = { left = 0, right = 0 }, component_separators = { left = "", right = "" } },
			{ format_separator,    padding = { left = 1, right = 1 }, component_separators = { left = "", right = "" }, color = { fg = "#aaaaaa" } },
			{ 'aerial' },
			-- {
				-- aerial je 'novi tagbar'
			-- 	function()
			-- 		local p = vim.fn['tagbar#currenttag']('%s', '')
			-- 		return p
			-- 	end,
			-- 	color = { fg = "#aabbdd" }, padding = { left = 0 , right = 0 }
			-- },
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
-- -----------------------------------------------------------------------------

