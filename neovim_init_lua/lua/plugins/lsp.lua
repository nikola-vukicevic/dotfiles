-- -----------------------------------------------------------------------------
local path_lua_ls = "/home/korisnik/git/lua-language-server/bin/lua-language-server"
-- -----------------------------------------------------------------------------
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
			require('breadcrumbs').Load()
			--
		end
		--
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	end
})
-- -----------------------------------------------------------------------------
vim.lsp.config["clangd"] = {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--log=verbose",
		"--suggest-missing-includes",
		"--cross-file-rename",
		--
		"-j=12",
		"--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
		-- "--clang-tidy-checks=*",
		"--all-scopes-completion",
		"--completion-style=detailed",
		"--header-insertion-decorators",
		"--header-insertion=iwyu",
		"--pch-storage=memory",
	},
	root_markers = {
		'compile_commands.json',
		'compile_flags.txt'
	},
	filetypes = { 'c', 'cpp' },
}
-- -----------------------------------------------------------------------------
vim.lsp.config["cssls"] = {
	cmd = {
		"vscode-css-language-server",
		"--stdio"
	},
	filetypes = {
		"css"
	},
	settings = {
		css = {
			validate = true,
		}
	},
}
-- -----------------------------------------------------------------------------
vim.lsp.config["html"] = {
	cmd = {
		"vscode-html-language-server",
		"--stdio"
	},
	filetypes = {
		"html",
	},
}
-- -----------------------------------------------------------------------------
vim.lsp.config["ts_ls"] = {
	cmd = {
		"typescript-language-server",
		"--stdio"
	},
	filetypes = {
		"javascript",
		"typescript",
	},
}
-- -----------------------------------------------------------------------------
vim.lsp.config["lua_ls"] = {
	cmd          = {
		path_lua_ls
	},
	filetypes = { 'lua' },
	root_markers = { '.luarc.json', '.luarc.jsonc' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	}
}
-- -----------------------------------------------------------------------------
vim.lsp.config["pyright"] = {
	cmd = { 'pyright-langserver', '--stdio' },
	filetypes = { 'python' },
	root_markers = {
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'pyrightconfig.json',
		'.git',
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = 'openFilesOnly',
			},
		},
	},
}
-- -----------------------------------------------------------------------------
-- Intelephense nema rename u besplatnoj verziji, a phpactor je
-- generalno 'ispran' po pitanju opcija. :(
-- vim.lsp.config["intelephense"] = {
-- 	cmd = {
-- 		'intelephense',
-- 		'--stdio'
-- 	},
-- 	filetypes = {
-- 		'php'
-- 	},
-- 	root_dir = function(bufnr, on_dir)
-- 		local fname = vim.api.nvim_buf_get_name(bufnr)
-- 		local cwd = assert(vim.uv.cwd())
-- 		local root = vim.fs.root(fname, { 'composer.json', '.git' })
-- 		-- prefer cwd if root is a descendant
-- 		on_dir(root and vim.fs.relpath(cwd, root) and cwd)
-- 	end,
-- }
-- -----------------------------------------------------------------------------
vim.lsp.enable({
	"clangd",
	"cssls",
	"html",
	"ts_ls",
	"lua_ls",
	"pyright",
	-- "intelephense",
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

