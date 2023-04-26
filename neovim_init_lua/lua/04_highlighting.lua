-- -------------------------------------------------------------------------- --
local basicHL      = true
local cmpHL        = false
local treesitterHL = true
local LspHL        = true
local TelescopeHL  = true
-- -------------------------------------------------------------------------- --
local boja_01 = "#e0e0e0" -- osnovna
local boja_02 = "#cc99ff" -- komentari
local boja_03 = "#2e313e" -- pozadina float
--
-- #80a0f0
-- #f0ba80
-- #6f9283
-- #B48B60
-- #7FC29B
-- #94C9A9
local boja_111 = "#80a0f0"
local boja_112 = "#93ada2" -- niska
local boja_113 = "#F49FBC" -- brojevi
local boja_114 = "#F7DCC0" -- zagrade
local boja_115 = "#b0b0b0" -- punktuacija
local boja_116 = "#e2b380" -- operatori
local boja_117 = "#7399bf" -- include, define
local boja_118 = "#c0d0f7" -- builtin promenlji, atributi tagova i sl 
local boja_119 = "#6f9283" -- 
local boja_120 = "#B480F0" -- boolean
--
local boja_201 = "#eedd00" -- hint
-- local boja_202 = "#ee9900" -- warning
local boja_202 = "#F09050" -- warning
local boja_203 = "#ee4400" -- error
-- local boja_113 = "#e5ff99"
-- local boja_114 = "#ffcc99"
-- local boja_115 = "#ffff99"
-- local boja_116 = "#ffdfbf"
-- -------------------------------------------------------------------------- --
if basicHL == true then
	-- Let's make Vim great (again) - koja god tema je izabrana
	vim.cmd("hi Normal         ctermbg=NONE")
	vim.cmd("hi nonText        ctermbg=NONE")
	vim.cmd("hi Normal         guibg=NONE ctermbg=NONE")
	vim.cmd("hi NormalNC       guibg=NONE ctermbg=NONE")
	vim.cmd("hi CursorLine     ctermbg=none")
	vim.cmd("hi CursorLine     guibg=#333541")
	vim.cmd("hi CursorLineNr   cterm=bold guifg=#90a0b0")
	vim.cmd("hi VertSplit      guibg=NONE guifg=#444550")
	-- --------------------------------
	-- Fix za znakove ^^^^^ koji se
	-- pojave na statusnoj liniji
	-- neaktivnog prozora:
	if vim.g.barebones_CFG ~= true then
		vim.cmd("hi StatusLine     guibg=#2e2e31 guifg=#2e2e31")
		vim.cmd("hi StatusLineNC   guibg=NONE guifg=NONE")
	end
	-- -----
	vim.cmd("hi Search                 guibg=#339966 guifg=#e0e0e0")
	vim.cmd("hi Whitespace             gui=NONE guifg=#323d37")
	vim.cmd("hi SpecialKey             gui=NONE guifg=#323d37")
	vim.cmd("hi NonText                gui=NONE guifg=#323d37 cterm=bold")
	vim.cmd("hi Visual                 gui=NONE guibg=#444755")
	vim.cmd("hi Comment                gui=NONE guifg=#656a70")
	vim.cmd("hi DiagnosticUnnecessary  guifg=#775533")
	vim.cmd("hi StartifyFile           guifg=#ee5599")
	-- Float:
	vim.api.nvim_set_hl ( 0 , "NormalFloat" ,  { bg = None } )                 --"#2c303d",                } )
	-- vim.cmd("hi NormalFloat    guibg=boja_03")
	vim.cmd("hi FloatBorder    guifg=#cc8833")
	vim.cmd("hi FloatermBorder guibg=None guifg=#cc8833")
	-- Lazy border:
	vim.cmd("hi LazyNormal  guifg=#cccccc")
	-- LSP Saga border:
	-- vim.cmd("hi SagaBorder guifg=#cc8833")
end
-- -----------------------------------------------------------------------------
-- nvim-cmp
-- -----------------------------------------------------------------------------
if cmpHL == true then
	vim.cmd("hi CmpItemMenuDefault        guifg=#999999")
	vim.cmd("hi CmpItemKind               guifg=#77aaff")
	vim.cmd("hi CmpItemAbbrMatch          guibg=NONE guifg=#eedd77")
	vim.cmd("hi CmpItemKindSnippetDefault guibg=NONE guifg=#cc8833")
	vim.cmd("hi CmpItemKindTextDefault    guibg=NONE guifg=#dddddd")
	vim.cmd("hi CmpItemKindFolderDefault  guibg=NONE guifg=#cc3388")
	vim.cmd("hi CmpItemKindFileDefault    guibg=NONE guifg=#cc3388")
end
-- -----------------------------------------------------------------------------
-- Treesitter:
-- -----------------------------------------------------------------------------
if treesitterHL == true then
	-- Generički:
	vim.api.nvim_set_hl ( 0 , "Keyword" ,               { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "Number" ,                { fg = boja_113 } )
	vim.api.nvim_set_hl ( 0 , "String" ,                { fg = boja_112 } )
	vim.api.nvim_set_hl ( 0 , "Operator" ,              { fg = boja_116 } )
	--
	vim.api.nvim_set_hl ( 0 , "DiagnosticUnderlineHint" ,  { fg = boja_201, underline = true, bold = true } )
	vim.api.nvim_set_hl ( 0 , "DiagnosticUnderlineWarn" ,  { fg = boja_202, underline = true, bold = true } )
	vim.api.nvim_set_hl ( 0 , "DiagnosticUnderlineError" , { fg = boja_203, underline = true, bold = true } )
	--
	vim.api.nvim_set_hl ( 0 , "@variable" ,              { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@variable.builtin" ,      { fg = boja_118 } )
	vim.api.nvim_set_hl ( 0 , "@field" ,                 { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@constant" ,              { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@property" ,              { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@parameter" ,             { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@boolean" ,               { fg = boja_120 } )
	vim.api.nvim_set_hl ( 0 , "@keyword" ,               { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@keyword.function" ,      { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@keyword.operator" ,      { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@conditional" ,           { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@repeat" ,                { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@operator" ,              { fg = boja_116 } )
	vim.api.nvim_set_hl ( 0 , "@punctuation" ,           { fg = boja_114 } )
	vim.api.nvim_set_hl ( 0 , "@punctuation.bracket" ,   { fg = boja_114 } )
	vim.api.nvim_set_hl ( 0 , "@punctuation.delimiter" , { fg = boja_115 } )
	vim.api.nvim_set_hl ( 0 , "@punctuation" ,           { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@string" ,                { fg = boja_112 } )
	vim.api.nvim_set_hl ( 0 , "@function" ,              { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@function.call" ,         { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@function.builtin" ,      { fg = boja_118 } )
	vim.api.nvim_set_hl ( 0 , "@method.call" ,           { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@string.regex" ,          { fg = boja_01 } )
	-- CSS:
	vim.api.nvim_set_hl ( 0 , "@type.tag.css" ,          { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@property.id" ,           { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@property.class" ,        { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@property.css" ,          { fg = boja_01 } )
	-- HTML:   
	vim.api.nvim_set_hl ( 0 , "@tag.html" ,              { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@tag.delimiter.html" ,    { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@tag.attribute.html" ,    { fg = boja_118 } )
	-- PHP:
	vim.api.nvim_set_hl ( 0 , "@include.php" ,           { fg = boja_01 } )
	-- C/C++
	vim.api.nvim_set_hl ( 0 , "@include.c" ,             { fg = boja_117 } )
	vim.api.nvim_set_hl ( 0 , "@define.c" ,              { fg = boja_117 } )
	vim.api.nvim_set_hl ( 0 , "@storageClass.c" ,        { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@type.qualifier.c" ,      { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@type.builtin.c" ,        { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@keyword.return.c" ,      { fg = boja_111 } )
	vim.api.nvim_set_hl ( 0 , "@type.c" ,                { fg = boja_01 } )
end
-- -------------------------------------------------------------------------- --
-- LSP:
-- -------------------------------------------------------------------------- --
if LspHL == true then
	vim.api.nvim_set_hl ( 0 , "LspReferenceText" ,       { bg = "#f0a080", fg = "#000000"})
	vim.api.nvim_set_hl ( 0 , "LspReferenceRead" ,       { bg = "#a0f080", fg = "#000000"})
	vim.api.nvim_set_hl ( 0 , "LspReferenceWrite" ,      { bg = "#f08000", fg = "#000000"})
	vim.api.nvim_set_hl ( 0 , "@lsp.type.variable" ,     { fg = boja_01 })
	vim.api.nvim_set_hl ( 0 , "@lsp.type.property" ,     { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@lsp.type.parameter" ,    { fg = boja_01 } )
	vim.api.nvim_set_hl ( 0 , "@lsp.type.function" ,     { fg = boja_01 } )
	-- C/C++:
	vim.api.nvim_set_hl ( 0 , "@lsp.type.macro.c" ,      { fg = boja_118 } )
	-- PHP:
	vim.api.nvim_set_hl ( 0 , "@include.php" ,           { fg = boja_118 } )
	-- HTML:
	vim.api.nvim_set_hl ( 0 , "@text.uri.html" ,         { fg = boja_112, underline = true } )
	-- Lua:
	vim.api.nvim_set_hl ( 0 , "@lsp.mod.defaultLibrary.lua" ,   { fg = boja_118 } )
end
-- -------------------------------------------------------------------------- --
-- Telescope:
-- -------------------------------------------------------------------------- --
if TelescopeHL == true then
	vim.api.nvim_set_hl ( 0 , "TelescopeNormal" ,  { bg = None } )                 --"#2c303d",                } )
	vim.api.nvim_set_hl ( 0 , "TelescopeBorder" ,  { bg = None, fg = "#d0d0d0" } ) --"#2c303d", fg = "#d0d0d0" } )
end
-- -------------------------------------------------------------------------- --

