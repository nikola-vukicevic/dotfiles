-- -------------------------------------------------------------------------- --
local basicHL      = true
local treesitterHL = false
local lspHL        = false
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
if basicHL == true then
	-- Let's make Vim great (again) - koja god tema je izabrana
	vim.cmd("hi Normal         ctermbg=NONE")
	vim.cmd("hi nonText        ctermbg=NONE")
	vim.cmd("hi Normal         guibg=NONE ctermbg=NONE")
	vim.cmd("hi CursorLine     ctermbg=none")
	vim.cmd("hi CursorLine     guibg=#333541")
	vim.cmd("hi CursorLineNr   cterm=bold guifg=#90a0b0")
	vim.cmd("hi VertSplit      guibg=NONE guifg=#20272a")
	-- --------------------------------
	-- Fix za znakove ^^^^^ koji se
	-- pojave na statusnoj liniji
	-- neaktivnog prozora:
	if vim.g.barebones_CFG ~= true then
		vim.cmd("hi StatusLine     guibg=#2e2e31 guifg=#2e2e31")
		vim.cmd("hi StatusLineNC   guibg=NONE guifg=NONE")
	end
	-- -----
	vim.cmd("hi CmpItemMenuDefault        guifg=#999999")
	vim.cmd("hi CmpItemKind               guifg=#77aaff")
	vim.cmd("hi CmpItemAbbrMatch          guibg=NONE guifg=#eedd77")
	vim.cmd("hi CmpItemKindSnippetDefault guibg=NONE guifg=#cc8833")
	vim.cmd("hi CmpItemKindTextDefault    guibg=NONE guifg=#dddddd")
	vim.cmd("hi CmpItemKindFolderDefault  guibg=NONE guifg=#cc3388")
	vim.cmd("hi CmpItemKindFileDefault    guibg=NONE guifg=#cc3388")
	-- -----
	vim.cmd("hi Search                 guibg=#339966 guifg=#e0e0e0")
	vim.cmd("hi SpecialKey             guifg=#323d37")
	vim.cmd("hi NonText                guifg=#323d37 cterm=bold")
	vim.cmd("hi Visual                 guibg=#444755")
	vim.cmd("hi Comment                guifg=#656a70")
	vim.cmd("hi DiagnosticUnnecessary  guifg=#775533")
	vim.cmd("hi StartifyFile           guifg=#ee5599")
	-- lf border:
	vim.cmd("hi FloatermBorder guibg=#00000000 guifg=#cc8833")
	-- Lazy border:
	vim.cmd("hi LazyNormal  guifg=#cccccc")
	vim.cmd("hi FloatBorder guifg=#cc8833")
	-- LSP Saga border:
	-- vim.cmd("hi SagaBorder guifg=#cc8833")
end
-- -----------------------------------------------------------------------------
-- Tree-sitter:
-- -----------------------------------------------------------------------------
if treesitterHL == true then
	vim.api.nvim_set_hl ( 0 , "@variable" ,              { fg = boja_00 })
	vim.api.nvim_set_hl ( 0 , "@variable.builtin" ,      { fg = boja_02 } )
	vim.api.nvim_set_hl ( 0 , "@field" ,                 { fg = boja_08 } )
	vim.api.nvim_set_hl ( 0 , "@constant" ,              { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@property" ,              { fg = boja_08 } )
	vim.api.nvim_set_hl ( 0 , "@parameter" ,             { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@boolean" ,               { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@keyword" ,               { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@keyword.function" ,      { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@conditional" ,           { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@repeat" ,                { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@operator" ,              { fg = boja_06 } )
	vim.api.nvim_set_hl ( 0 , "@punctuation" ,           { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@punctuation.bracket" ,   { fg = boja_05 } )
	vim.api.nvim_set_hl ( 0 , "@punctuation.delimiter" , { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@punctuation" ,           { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@string" ,                { fg = boja_04 } )
	vim.api.nvim_set_hl ( 0 , "@function" ,              { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@function.call" ,         { fg = boja_09 } )
	vim.api.nvim_set_hl ( 0 , "@function.builtin" ,      { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@method.call" ,           { fg = boja_05 } )
	vim.api.nvim_set_hl ( 0 , "@string.regex" ,          { fg = boja_03 } )
	-- CSS:
	vim.api.nvim_set_hl ( 0 , "@type.tag.css" ,          { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@property.id" ,           { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@property.class" ,        { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@property.css" ,          { fg = boja_00 } )
	-- HTML:   
	vim.api.nvim_set_hl ( 0 , "@tag.html" ,              { fg = boja_08 } )
	vim.api.nvim_set_hl ( 0 , "@tag.delimiter.html" ,    { fg = boja_08 } )
	vim.api.nvim_set_hl ( 0 , "@tag.attribute.html" ,    { fg = boja_09 } )
	-- PHP:
	vim.api.nvim_set_hl ( 0 , "@include.php" ,           { fg = boja_00 } )
	-- C/C++
	vim.api.nvim_set_hl ( 0 , "@include.c" ,             { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@define.c" ,              { fg = boja_05 } )
	vim.api.nvim_set_hl ( 0 , "@storageClass.c" ,        { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@type.qualifier.c" ,      { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@type.builtin.c" ,        { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@type.c" ,                { fg = boja_01 } )
end
-- -------------------------------------------------------------------------- --
-- LSP:
-- -------------------------------------------------------------------------- --
if lspHL == true then
	vim.api.nvim_set_hl ( 0 , "@lsp.type.variable" ,     { fg = boja_00 })
	vim.api.nvim_set_hl ( 0 , "@lsp.type.property" ,     { fg = boja_08 } )
	vim.api.nvim_set_hl ( 0 , "@lsp.type.parameter" ,    { fg = boja_00 } )
	vim.api.nvim_set_hl ( 0 , "@lsp.type.function" ,     { fg = boja_00 } )
end
-- -------------------------------------------------------------------------- --

