-- -------------------------------------------------------------------------- --
local mainHL       = true
local basicHL      = mainHL and true
local cmpHL        = mainHL and true
local treesitterHL = mainHL and true
local LspHL        = mainHL and true
local TelescopeHL  = mainHL and true
-- -------------------------------------------------------------------------- --
local bold = true
-- -------------------------------------------------------------------------- --
vim.cmd("hi BreadcrumbsNormal gui=None guibg=#2c323c guifg=Blue")
vim.cmd("hi BreadcrumbsColor  gui=None guibg=#2c323c guifg=Red")
-- -------------------------------------------------------------------------- --
local boja_01 = "#e7e7e7" -- osnovna
local boja_02 = "#d4d4d4" -- osnovna (pozivi funkcija)
local boja_03 = "#d0d3d4" -- osnovna (konstante)
local boja_04 = "#a0a0a0" -- promenljive, parametri funkcija
local boja_05 = "#e0e0e0" -- property
-- local boja_04 = "#cc99ff" -- komentari
-- local boja_05 = "#2e313e" -- pozadina float
--
-- #80a0f0
-- #f0ba80
-- #6f9283
-- #B48B60
-- #7FC29B
-- #94C9A9
-- #93ada2
-- #f49fbc
-- #c6a0f6
-- brojevi (80d8f0, 80cde2, 80c2d4, 80b7c6, 80acb8)
local boja_111 = "#80a0f0"
local boja_112 = "#a5bbb2" -- niska
local boja_113 = "#80b7c6" -- brojevi
local boja_114 = "#e2c680" -- operatori
local boja_115 = "#b0b0b0" -- punktuacija
local boja_116 = "#f7e8c0" -- zagrade
local boja_117 = "#7399bf" -- include, define
local boja_118 = "#c0d0f7" -- builtin promenljive, atributi tagova i sl
local boja_119 = "#ee55aa" -- builtin 2
-- local boja_119 = "#6f9283" --
-- local boja_120 = "#b480f0" -- boolean
local boja_120 = "#8450c0" -- boolean
local boja_121 = "#aabbdd" -- type
local boja_122 = "#c6a0f6" -- return
--
local boja_201 = "#eedd00" -- hint
-- local boja_202 = "#ee9900" -- warning
local boja_202 = "#f09050" -- warning
local boja_203 = "#e04030" -- error
-- local boja_113 = "#e5ff99"
-- local boja_114 = "#ffcc99"
-- local boja_115 = "#ffff99"
-- local boja_116 = "#ffdfbf"
--
local boja_breadcrumbs_bg = "#2c323c"
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
	vim.cmd("hi WinSeparator   guibg=NONE guifg=#404040")
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
	vim.cmd("hi DiagnosticUnnecessary  guifg=#665550") -- 66554
	vim.cmd("hi StartifyFile           guifg=#ee5599")
	vim.cmd("hi IlluminatedWordText    guibg=#334444 guifg=#ffeedd")
	-- Float:
	vim.api.nvim_set_hl ( 0 , "NormalFloat" ,  { bg = None } )                 --"#2c303d",                } )
	vim.api.nvim_set_hl ( 0 , "FloatBorder" ,  { bg = None, fg='#cc8833' } )   --"#2c303d",                } )
	-- vim.cmd("hi NormalFloat    guibg=boja_03")
	-- vim.cmd("hi FloatBorder    guifg=#cc8833")
	vim.cmd("hi FloatermBorder guibg=None guifg=#cc8833")
	-- Mini notify:
	vim.api.nvim_set_hl(0, "NotifyBackground", { bg = boja_202 } )
	-- Lazy border:
	vim.cmd("hi LazyNormal  guifg=#cccccc")
	-- LSP Saga border:
	-- vim.cmd("hi SagaBorder guifg=#cc8833")
	-- NvimTree:
	vim.api.nvim_set_hl(0, "NvimTreeNormal",       {  } )
	vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {  } )
	-- Spell checker:
	vim.api.nvim_set_hl(0, "SpellBad", { fg = "#ff3355", underline = true, bold = true } )
	-- Better Quick Fix:
	vim.api.nvim_set_hl(0, "BqfPreviewFloat", { bg = '#292b39' } )
	vim.api.nvim_set_hl(0, "BqfPreviewBorder", { bg = '#292b39' } )
	vim.api.nvim_set_hl(0, "BqfPreviewTitle", { bg = '#292b39' } )
	-- Scope highlighting(indent-blankline):
	vim.api.nvim_set_hl(0, "IblScope", { fg = '#505050' } )
	-- Scope highlighting(indentmini):
	-- vim.api.nvim_set_hl(0, "IndentLine",        { fg = '#323d37' } )
	-- vim.api.nvim_set_hl(0, "IndentLineCurrent", { fg = '#505050' } )
end
-- -----------------------------------------------------------------------------
-- nvim-cmp
-- -----------------------------------------------------------------------------
vim.api.nvim_set_hl ( 0 , "CMPGhostText" ,  { fg = "#808284" , bold = bold } )
--
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
	vim.api.nvim_set_hl ( 0 , "Keyword" ,       { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "Number" ,        { fg = boja_113 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "String" ,        { fg = boja_112 , bold = false } )
	vim.api.nvim_set_hl ( 0 , "Operator" ,      { fg = boja_116 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "Type" ,          { fg = boja_121 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@type.builtin" , { fg = boja_121 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "Include" ,       { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "PreProc" ,       { fg = boja_111 , bold = bold  } )
	--
	vim.api.nvim_set_hl ( 0 , "DiagnosticUnderlineHint" ,   { fg = boja_201, underline = true, bold = true } )
	vim.api.nvim_set_hl ( 0 , "DiagnosticUnderlineWarn" ,   { fg = boja_202, underline = true, bold = true } )
	vim.api.nvim_set_hl ( 0 , "DiagnosticUnderlineError" ,  { fg = boja_203, underline = true, bold = true } )
	--
	vim.api.nvim_set_hl ( 0 , "@variable" ,               { fg = boja_01  , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@variable.builtin" ,       { fg = boja_118 , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@field" ,                  { fg = boja_01  , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@constant" ,               { fg = boja_03  , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@property" ,               { fg = boja_01  , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@parameter" ,              { fg = boja_01  , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@boolean" ,                { fg = boja_120 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@keyword" ,                { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@keyword.function" ,       { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@keyword.operator" ,       { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@keyword.return" ,         { fg = boja_122 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@keyword.repeat" ,         { fg = boja_121 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@keyword.conditional" ,    { fg = boja_121 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@conditional" ,            { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@repeat" ,                 { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@operator" ,               { fg = boja_116 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@punctuation" ,            { fg = boja_114 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@punctuation.bracket" ,    { fg = boja_114 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@punctuation.delimiter" ,  { fg = boja_115 , bold = bold  } )
	-- vim.api.nvim_set_hl ( 0 , "@punctuation" ,           { fg = boja_01  , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@string" ,                 { fg = boja_112 , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@function" ,               { fg = boja_01  , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@function.call" ,          { fg = boja_02  , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@function.builtin" ,       { fg = boja_118 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@method.call" ,            { fg = boja_02  , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@string.regex" ,           { fg = boja_02  , bold = bold  } )
	-- CSS:
	vim.api.nvim_set_hl ( 0 , "@type.tag.css" ,           { fg = boja_01 , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@property.id" ,            { fg = boja_02 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@property.class" ,         { fg = boja_02 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@property.css" ,           { fg = boja_01 , bold = false } )
	-- HTML:
	vim.api.nvim_set_hl ( 0 , "@tag.html" ,               { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@tag.delimiter.html" ,     { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@tag.attribute.html" ,     { fg = boja_118 , bold = bold  } )
	-- PHP:
	vim.api.nvim_set_hl ( 0 , "@include.php" ,            { fg = boja_02  , bold = bold  } )
	-- C/C++
	vim.api.nvim_set_hl ( 0 , "@include.c" ,              { fg = boja_117 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@define.c" ,               { fg = boja_117 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@storageClass.c" ,         { fg = boja_01  , bold = false } )
	vim.api.nvim_set_hl ( 0 , "@type.qualifier.c" ,       { fg = boja_01  , bold = false } )
	-- vim.api.nvim_set_hl ( 0 , "@constant.builtin.c" ,    { fg = boja_119 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@type.builtin.c" ,         { fg = boja_111 , bold = bold  } )
	-- vim.api.nvim_set_hl ( 0 , "@keyword.return.c" ,       { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@type.c" ,                 { fg = boja_02  , bold = bold  } )
end
-- -------------------------------------------------------------------------- --
-- LSP:
-- -------------------------------------------------------------------------- --
if LspHL == true then
	vim.api.nvim_set_hl ( 0 , "LspReferenceText" ,     { bg = "#f0a080", fg = "#000000" } )
	vim.api.nvim_set_hl ( 0 , "LspReferenceRead" ,     { bg = "#a0f080", fg = "#000000" } )
	vim.api.nvim_set_hl ( 0 , "LspReferenceWrite" ,    { bg = "#f08000", fg = "#000000" } )
	vim.api.nvim_set_hl ( 0 , "@lsp.type.variable" ,   { fg = boja_04 ,  bold = bold  } ) -- boja_01
	vim.api.nvim_set_hl ( 0 , "@lsp.type.parameter" ,  { fg = boja_04 ,  bold = bold  } ) -- boja_01
	vim.api.nvim_set_hl ( 0 , "@lsp.type.property" ,   { fg = boja_05 ,  bold = false } ) -- boja_02
	vim.api.nvim_set_hl ( 0 , "@lsp.type.function" ,   { fg = boja_01 ,  bold = false } )
	vim.api.nvim_set_hl ( 0 , "@constant.builtin" ,    { fg = boja_119 , bold = true } )
	-- C/C++:
	vim.api.nvim_set_hl ( 0 , "@lsp.type.macro.c" ,    { fg = boja_03  , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@storageclass.cpp" ,    { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@type.cpp" ,            { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@type.builtin.cpp" ,    { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@type.qualifier.cpp" ,  { fg = boja_111 , bold = bold  } )
	vim.api.nvim_set_hl ( 0 , "@type.qualifier.c" ,    { fg = boja_111 , bold = bold  } )
	-- PHP:
	vim.api.nvim_set_hl ( 0 , "@include.php" ,         { fg = boja_118 , bold = false } )
	-- HTML:
	vim.api.nvim_set_hl ( 0 , "@text.uri.html" ,       { fg = boja_112, underline = bold } )
	-- Lua:
	vim.api.nvim_set_hl ( 0 , "@lsp.mod.defaultLibrary.lua" ,  { fg = boja_118 , bold = bold  } )
	-- vim.api.nvim_set_hl ( 0 , "@keyword.return.lua" ,          { fg = boja_120 , bold = bold  } )
end
-- -------------------------------------------------------------------------- --
-- Telescope:
-- -------------------------------------------------------------------------- --
if TelescopeHL == true then
	vim.api.nvim_set_hl ( 0 , "TelescopeNormal" ,         { } )                 --"#2c303d",                } )
	vim.api.nvim_set_hl ( 0 , "TelescopeBorder" ,         {  fg = "#909090" } ) --"#2c303d", fg = "#d0d0d0" } )
	-- vim.api.nvim_set_hl ( 0 , "TelescopeBorder" ,         {  fg = "#b0b0b0" } ) --"#2c303d", fg = "#d0d0d0" } )
	vim.api.nvim_set_hl ( 0 , "TelescopePromptCounter" ,  {  fg = "#f09080" } ) --"#2c303d", fg = "#d0d0d0" } )
end
-- -------------------------------------------------------------------------- --
-- Breadcrumbs plugin:
-- -------------------------------------------------------------------------- --
vim.api.nvim_set_hl ( 0 , "BreadcrumbsNormal" ,         { bg = boja_breadcrumbs_bg , fg = "#b0b0b0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsSeparator" ,      { bg = boja_breadcrumbs_bg , fg = "#7a7470" } )
-- vim.api.nvim_set_hl ( 0 , "BreadcrumbsSeparator" ,     { bg = boja_breadcrumbs_bg , fg = "#f7dcc0" } )
--
vim.api.nvim_set_hl ( 0 , "BreadcrumbsDefaultIcon" ,    { bg = boja_breadcrumbs_bg , fg = "#7fc29b" } )
--
vim.api.nvim_set_hl ( 0 , "BreadcrumbsFile" ,           { bg = boja_breadcrumbs_bg , fg = "#7fc29b" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsModule" ,         { bg = boja_breadcrumbs_bg , fg = "#7fc29b" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsNamespace" ,      { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsPackage" ,        { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsClass" ,          { bg = boja_breadcrumbs_bg , fg = "#f0a080" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsMethod" ,         { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsProperty" ,       { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsField" ,          { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsConstructor" ,    { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsEnum" ,           { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsInterface" ,      { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsFunction" ,       { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsVariable" ,       { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsConstant" ,       { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsString" ,         { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsNumber" ,         { bg = boja_breadcrumbs_bg , fg = "#f49fbc" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsBoolean" ,        { bg = boja_breadcrumbs_bg , fg = "#b480f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsArray" ,          { bg = boja_breadcrumbs_bg , fg = "#c0d0f7" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsObject" ,         { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsKey" ,            { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsNull" ,           { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsEnumMember" ,     { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsStruct" ,         { bg = boja_breadcrumbs_bg , fg = "#f49fbc" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsEvent" ,          { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsOperator" ,       { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsTypeParameter" ,  { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
vim.api.nvim_set_hl ( 0 , "BreadcrumbsMacro" ,          { bg = boja_breadcrumbs_bg , fg = "#80a0f0" } )
-- -------------------------------------------------------------------------- --

