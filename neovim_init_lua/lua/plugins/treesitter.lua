-- -------------------------------------------------------------------------- --
local treesitter = require('nvim-treesitter.configs')
-- -------------------------------------------------------------------------- --
local boja_00 = "#ffffff"
local boja_01 = "#cc99ff" -- ljubicasta 1
local boja_02 = "#99ccff" -- plava 1
local boja_03 = "#99ff99" -- zelena 1
local boja_04 = "#e5ff99" -- ccff99" -- zelena 2
local boja_05 = "#ffcc99" -- narandžasta 1
local boja_06 = "#ffff99" -- žuta 1
local boja_07 = "#ffdfbf" -- narandžasta 2
local boja_08 = "#7399bf" -- plava 2
local boja_09 = "#bfdfff" -- plava 3
-- -------------------------------------------------------------------------- --
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
-- -------------------------------------------------------------------------- --
vim.cmd ("hi @variable              guifg=" .. boja_00)
vim.cmd ("hi @variable.builtin      guifg=" .. boja_02)
vim.cmd ("hi @field                 guifg=" .. boja_08)
vim.cmd ("hi @constant              guifg=" .. boja_00)
vim.cmd ("hi @property              guifg=" .. boja_08)
vim.cmd ("hi @parameter             guifg=" .. boja_00)
vim.cmd ("hi @boolean               guifg=" .. boja_00)
vim.cmd ("hi @keyword               guifg=" .. boja_01)
vim.cmd ("hi @keyword.function      guifg=" .. boja_01)
vim.cmd ("hi @conditional           guifg=" .. boja_01)
vim.cmd ("hi @repeat                guifg=" .. boja_01)
vim.cmd ("hi @operator              guifg=" .. boja_06)
vim.cmd ("hi @punctuation           guifg=" .. boja_00)
vim.cmd ("hi @punctuation.bracket   guifg=" .. boja_05)
vim.cmd ("hi @punctuation.delimiter guifg=" .. boja_00)
vim.cmd ("hi @punctuation           guifg=" .. boja_00)
vim.cmd ("hi @string                guifg=" .. boja_04)
vim.cmd ("hi @function              guifg=" .. boja_00)
vim.cmd ("hi @function.call         guifg=" .. boja_09)
vim.cmd ("hi @function.builtin      guifg=" .. boja_00)
vim.cmd ("hi @method.call           guifg=" .. boja_05)
vim.cmd ("hi @string.regex          guifg=" .. boja_03)
-- CSS:
vim.cmd ("hi @type.tag.css          guifg=" .. boja_00)
vim.cmd ("hi @property.id           guifg=" .. boja_00)
vim.cmd ("hi @property.class        guifg=" .. boja_00)
vim.cmd ("hi @property.css          guifg=" .. boja_00)
-- HTML:
vim.cmd ("hi @tag.html              guifg=" .. boja_08) 
vim.cmd ("hi @tag.delimiter.html    guifg=" .. boja_08) 
vim.cmd ("hi @tag.attribute.html    guifg=" .. boja_09) 
-- PHP:
vim.cmd ("hi @include.php           guifg=" .. boja_00)
-- C/C++
vim.cmd ("hi @include.c             guifg=" .. boja_01)
vim.cmd ("hi @define.c              guifg=" .. boja_05)
vim.cmd ("hi @storageClass.c        guifg=" .. boja_01)
vim.cmd ("hi @type.qualifier.c      guifg=" .. boja_01)
vim.cmd ("hi @type.builtin.c        guifg=" .. boja_01)
vim.cmd ("hi @type.c                guifg=" .. boja_01)
-- -------------------------------------------------------------------------- --

