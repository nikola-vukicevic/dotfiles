-- -----------------------------------------------------------------------------
-- Highlighter:
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd('BufEnter', {
	pattern  = {
		"*.c", "*.cpp", "*.h", "*.hpp",
		"*.html", "*.css",
		"*.js", "*.ts", "*.mjs", "*.mts", "*.cjs", "*.cts",
		"*.lua",
		"*.py",
	},
	callback = function()
		vim.treesitter.start()
	end
})
-- -----------------------------------------------------------------------------
-- Select:
-- -----------------------------------------------------------------------------
vim.keymap.set({ "x", "o" }, "af", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "if", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "ac", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "ic", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "al", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "il", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "in", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@number.inner", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "ai", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "ii", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "ak", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@comment.outer", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "ik", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@comment.inner", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "aa", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@assignment.outer", "textobjects")
end)
--
vim.keymap.set({ "x", "o" }, "ia", function()
	require "nvim-treesitter-textobjects.select".select_textobject("@assignment.rhs", "textobjects")
end)
-- -----------------------------------------------------------------------------
-- Move:
-- -----------------------------------------------------------------------------
-- goto_next_start:
-- ----------------
vim.keymap.set({ "n", "x", "o" }, "gf", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gl", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gc", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gi", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gk", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@comment.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gn", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@number.inner", "textobjects")
end)
-- --------------------
-- goto_previous_start:
-- --------------------
vim.keymap.set({ "n", "x", "o" }, "gF", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gL", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gC", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gI", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gK", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@comment.outer", "textobjects")
end)
--
vim.keymap.set({ "n", "x", "o" }, "gN", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@number.inner", "textobjects")
end)
-- -----------------------------------------------------------------------------

