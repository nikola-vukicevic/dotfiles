-- -------------------------------------------------------------------------- -
-- Moduli:
-- -------------------------------------------------------------------------- -
require("plugins/lualine")
require("plugins/nvimtree")
require("plugins/lsp")
require("plugins/dap")
require("plugins/luasnip")
require("plugins/cmp")
-- -------------------------------------------------------------------------- --
vim.g.rust_lsp_priprema = false
-- -------------------------------------------------------------------------- --
-- vim.api.nvim_create_autocmd("TextChangedI", {
-- 	pattern = "*",
-- 	command = "lua require('plugins/debounce').debounce()"
-- })
-- -------------------------------------------------------------------------- --
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		-- client.server_capabilities.semanticTokensProvider = nil
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local bufnr  = ev.buf
		if client.server_capabilities.documentSymbolProvider then
			vim.api.nvim_create_autocmd(
				{
					"InsertLeave",
					"BufEnter",
					"CursorHold"
				} , {
				command = "lua require('breadcrumbs').Load()",
				buffer  = bufnr,
			})
			--
			vim.api.nvim_create_autocmd("CursorMoved" , {
				command = "lua require('breadcrumbs').Update()",
				buffer  = bufnr,
			})
			--
			vim.api.nvim_create_autocmd("BufDelete" , {
				command = "lua require('breadcrumbs').Reset()",
				buffer  = bufnr,
			})
			--
			require("breadcrumbs").Load()
			--
		end
		--
		vim.g.lsp_progres = 0
		-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		-- vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	end
})
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		if ev.data.params.value.title == "cargo check" and ev.data.params.value.kind == "end" then
			vim.g.rust_lsp_priprema = true
		end

		if vim.g.rust_lsp_priprema == true and ev.data.params.token == "rustAnalyzer/cachePriming" and ev.data.params.value.kind == "end" then
			vim.notify(" LSP server pokrenut")
		end
	end
})
-- -----------------------------------------------------------------------------
--    
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN]  = "",
			[vim.diagnostic.severity.INFO]  = "",
			[vim.diagnostic.severity.HINT]  = "",
		},
		texthl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
		},
	},
	severity_sort = true,
	-- underline = true,
	-- virtual_text = {
		-- severity = {
		-- 	min = vim.diagnostic.severity.WARN,
		-- 	max = vim.diagnostic.severity.WARN,
		-- },
	-- }
})
-- -----------------------------------------------------------------------------
-- Plugin - Tree-sitter:
-- -------------------------------------------------------------------------- --
local treesitter = require("nvim-treesitter.configs")
--
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
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["in"] = "@number.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["ak"] = "@comment.outer",
				["ik"] = "@comment.inner",
				["aa"] = "@assignment.outer",
				["ia"] = "@assignment.rhs",
			}
		},
		move = {
			enable = true,
			goto_next_start = {
				["gf"] = "@function.outer",
				["gl"] = "@loop.outer",
				["gc"] = "@class.outer",
				["gi"] = "@conditional.outer",
				["gk"] = "@comment.outer",
				["gn"] = "@number.inner",
				-- ["ga"] = "@assignment.rhs",
			},
			goto_previous_start = {
				["gF"] = "@function.outer",
				["gL"] = "@loop.outer",
				["gC"] = "@class.outer",
				["gI"] = "@conditional.outer",
				["gK"] = "@comment.outer",
				["gN"] = "@number.inner",
				-- ["gA"] = "@assignment.rhs",
			}
		}
	}
}
-- -------------------------------------------------------------------------- -
-- Plugin - Illuminate:
-- -------------------------------------------------------------------------- -
require("illuminate").configure({
	-- providers = {
	-- 	'lsp',
	-- 	'treesitter',
	-- 	'regex',
	-- },
	-- delay: delay in milliseconds
	delay = 10,
})
-- -------------------------------------------------------------------------- -
-- Plugin - Telescope:
-- -------------------------------------------------------------------------- -
local telescope_actions       = require("telescope.actions")
local telescope_action_layout = require("telescope.actions.layout")

vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")

require("telescope").setup({
	defaults = {
		initial_mode  = "normal",
		prompt_prefix = " ",
		-- borderchars    = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		layout_config  = {
			horizontal = {
				width         = 0.76,
				height        = 0.88,
				preview_width = 0.46,
			},
		},
		mappings = {
			i = {
				["<M-p>"] = telescope_action_layout.toggle_preview,
				-- ["<esc>"] = telescope_actions.close,
				-- ["<F1"]   = telescope_actions.close,
			},
			n = {
				["<M-p>"] = telescope_action_layout.toggle_preview,
				["q"]     = telescope_actions.close,
				-- ["<esc>"] = telescope_actions.close,
			},
		},
	},
	pickers = {
		ignore_current_buffer = true,
		sort_mru              = true,

		live_grep = {
			-- prompt_prefix = " ",
			initial_mode = "insert",
			mappings = {
				i = {
					["<m-d>"] = telescope_actions.to_fuzzy_refine,
					-- ["<c-f>"] = actions.to_fuzzy_refine
				},
			}
		},

		-- find_files = {
		-- 	initial_mode = "insert",
		-- },

		buffers = {
			-- on_load = telescope_actions.send_to_qflist + telescope_actions.open_qflist,
			sort_mru = true,
			mappings = {
				n = {
					-- ["dd"] = telescope_actions.delete_buffer + telescope_actions.move_to_top,
					["<M-q>"] = telescope_actions.send_to_qflist + telescope_actions.open_qflist
					-- ["<c-f>"] = actions.to_fuzzy_refine
				},
			}
		}
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- prompt_prefix = " ",
				layout_strategy = "cursor",
				layout_config = {
					width  = 54,
					height = 9,
					-- TODO: funkcija koja prebrojava
					-- stavke u meniju
				}
			})
		},
		--
		-- ["fzf"] = {
		-- 	fuzzy                   = true,          -- false will only do exact matching
		-- 	override_generic_sorter = true,          -- override the generic sorter
		-- 	override_file_sorter    = true,          -- override the file sorter
		-- 	case_mode               = "smart_case",  -- or "ignore_case" or "respect_case"
		-- 	                                         -- the default case_mode is "smart_case"
		-- },
	},
})
--
require("telescope").load_extension("ui-select")
-- require('telescope').load_extension("fzf")
-- -------------------------------------------------------------------------- -
-- Better Quickfix (nvim-bqf)
-- -------------------------------------------------------------------------- -
require("bqf").setup({
	preview = {
		win_height  = 18,
		win_vheight = 12,
		winblend    = 0,
	}
})

-- -------------------------------------------------------------------------- -
-- Plugin - LF:
-- -------------------------------------------------------------------------- -
require("lf").setup({
	winblend = 0,
	width    = 102,
	height   = 25,
	border   = "rounded",
})
-- -----------------------------------------------------------------------------
local ft = require("Comment.ft")
ft.set("imd" , "!!%s")
-- -----------------------------------------------------------------------------
require("nvim-highlight-colors").setup({
	render                  = "virtual",
	enable_var_usage        = true,
	virtual_symbol_position = "eol",
})
-- -----------------------------------------------------------------------------
require("ibl").setup({
	-- indent = {
		-- char = "│"
	-- };
	scope = {
		include = {
			node_type = {
				-- python = {
				-- 	"if_statement",
				-- 	"while_statement",
				-- 	"for_statement",
				-- 	"list",
				-- 	"string_content",
				-- 	"interpolation"
				-- },
				css = {
					"rule_set",
				},
				lua = {
					"arguments",
					"while_statement",
					"if_statement",
					"table_constructor",
				},
				-- zig = {
				-- 	"labeled_statement";
				-- 	"while_statement";
				-- 	"for_statement";
				-- 	"block";
				-- 	"block_expression";
				-- 	"function_declaration";
				-- },
				["*"] = {
					"switch_statement",
					"array",
					"object",
					"enum_declaration",
					"class_declaration",
					"interface_declaration",
					"import_statement",
					"initializer_list",
					-- "access_specifier"
				}
			},
		}
	}
})
-- -----------------------------------------------------------------------------
-- Linter:
-- -----------------------------------------------------------------------------
require("lint").linters_by_ft = {
	html       = { "eslint_d" },
	css        = { "eslint_d" },
	typescript = { "eslint_d" },
	javascript = { "eslint_d" },
	python     = { "ruff" }
}
-- --------------------------
vim.api.nvim_create_autocmd({
		-- "BufWritePost",
		"InsertLeave",
		"TextChanged",
		"BufEnter"
	}, {
		callback = function()
			require("lint").try_lint()
			-- require("lint").try_lint("eslint_d")
		end,
})
-- -----------------------------------------------------------------------------

