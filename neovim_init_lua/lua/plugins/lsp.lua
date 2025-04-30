-- -----------------------------------------------------------------------------
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- -----------------------------------------------------------------------------
require('lspconfig.ui.windows').default_options.border = 'single'
-- -----------------------------------------------------------------------------
local on_attach = function(client, bufnr)
	-- client.server_capabilities.semanticTokensProvider = nil
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
--------------------------------------------------------------------------------
local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 250,
}

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- deprecated
-- ---------------------------------------------------------
local autoStartLSP  = true
-- ---------------------------------------------------------
local izborC        = 1 -- 1: Clang,        2: CCLS
local izborPHP      = 1 -- 1: intelephense, 2: PHP actor
local izborPython   = 2 -- 1: Jedi,         2: Pyright:
-- ---------------------------------------------------------
local aktivanC      = true
local aktivanCSS    = true
local aktivanHTML   = true
local aktivanJS     = true
local aktivanLua    = true
local aktivanPHP    = true
local aktivanPython = true
local aktivanRust   = true
local aktivanZig    = true
-- ---------------------------------------------------------
local nazivServeraC
if izborC == 1 then
	nazivServeraC      = 'clangd'
else
	nazivServeraC      = 'ccls'
end
-- -----
local nazivServeraCSS  = 'cssls'
local nazivServeraHTML = 'html'
-- local nazivServeraJS   = 'tsserver' -- poruka 05.09.2024
local nazivServeraJS   = 'ts_ls'
local nazivServeraLua  = 'lua_ls'
-- -----
local nazivServeraPHP
if izborPHP == 1 then
	nazivServeraPHP    = 'intelephense'
else
	nazivServeraPHP    = 'phpactor'
end
-- -----
local nazivServeraPython
if izborPython == 1 then
	nazivServeraPython  = 'jedi_language_server'
else
	nazivServeraPython  = 'pyright'
end
-- -----
local nazivServeraRust  = 'rust_analyzer'
-- -----
local nazivServeraZig   = 'zls'
-- ---------------------------------------------------------
-- C/C++
-- ---------------------------------------------------------
local configC
-- -----
if izborC == 1 then
	-- ------------
	-- require('lspconfig')['clangd'].setup {
	configC = {
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--clang-tidy",
			"--background-index",
			"--suggest-missing-includes",
		},
		on_attach = on_attach,
		flags     = lsp_flags,
		root_dir = function() return vim.loop.cwd() end
	}
	-- ------------
end
-- -------------------------------------
if izborC == 2 then
	-- ------------
	-- require('lspconfig')['ccls'].setup {
	configC = {
		capabilities = capabilities,
		init_options = {
			compilationDatabaseDirectory = "build";
			index = {
				threads = 0;
			},
			clang = {
				excludeArgs = { "-frounding-math"} ;
			},
		},
		on_attach = on_attach,
		flags     = lsp_flags,
		root_dir  = function() return vim.loop.cwd() end
	}
	-- ------------
end
-- ---------------------------------------------------------
-- CSS:
-- ---------------------------------------------------------
-- require('lspconfig')['cssls'].setup {
local configCSS = {
	capabilities = capabilities,
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
	on_attach = on_attach,
	flags     = lsp_flags,
	root_dir  = function() return vim.loop.cwd() end
}
-- ---------------------------------------------------------
-- HTML:
-- ---------------------------------------------------------
-- require('lspconfig')['html'].setup {
local configHTML = {
	capabilities = capabilities,
	cmd = {
		"vscode-html-language-server",
		"--stdio"
	},
	filetypes = {
		"html",
	},
	on_attach = on_attach,
	flags     = lsp_flags,
	root_dir  = function() return vim.loop.cwd() end
}
-- ---------------------------------------------------------
-- Javascript:
-- ---------------------------------------------------------
-- require('lspconfig')['tsserver'].setup {
local configJS = {
	capabilities = capabilities,
	on_attach = on_attach,
	flags     = lsp_flags,
	cmd = {
		"typescript-language-server",
		"--stdio"
	},
	-- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
	root_dir = function() return vim.loop.cwd() end
}
-- ---------------------------------------------------------
-- Lua:
-- ---------------------------------------------------------
-- require('lspconfig')['lua_ls'].setup {
local configLua = {
	capabilities = capabilities,
	cmd          = {
		"/home/korisnik/git/lua-language-server/bin/lua-language-server"
	},
	on_attach    = on_attach,
	flags        = lsp_flags,
	settings     = {
    Lua = {
		runtime = {
			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			version = 'LuaJIT',
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = {'vim'},
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = vim.api.nvim_get_runtime_file("", true),
		},
		-- Do not send telemetry data containing a randomized but unique identifier
		telemetry = {
			enable = false,
		},
	},
  },
	root_dir = function() return vim.loop.cwd() end
}
-- ---------------------------------------------------------
-- PHP:
-- ---------------------------------------------------------
local configPHP
-- -----
if izborPHP == 1 then
	-- require('lspconfig')['intelephense'].setup {
	configPHP = {
		capabilities = capabilities,
		on_attach    = on_attach,
		flags        = lsp_flags,
		root_dir     = function() return vim.loop.cwd() end
	}
end
-- -------------------------------------
if izborPHP == 2 then
	-- require('lspconfig')['phpactor'].setup {
	configPHP = {
		capabilities = capabilities,
		on_attach = on_attach,
		flags     = lsp_flags,
		init_options = {
			["language_server_phpstan.enabled"] = false,
			["language_server_psalm.enabled"] = false,
		},
		root_dir = function() return vim.loop.cwd() end
	}
end
-- ---------------------------------------------------------
-- Python:
-- ---------------------------------------------------------
local configPython
-- -----
if izborPython == 1 then
	-- -----------------
	-- require('lspconfig')['jedi_language_server'].setup {
	configPython = {
		capabilities = capabilities,
		on_attach    = on_attach,
		flags        = lsp_flags,
		root_dir     = function() return vim.loop.cwd() end
	}
	-- -----------------
end
-- -------------------------------------
if izborPython == 2 then
	-- -----------------
	-- require('lspconfig')['pyright'].setup {
	configPython = {
		on_attach = on_attach,
		flags     = lsp_flags,
	}
	-- -----------------
end
-- ---------------------------------------------------------
-- Rust:
-- ---------------------------------------------------------
-- require('lspconfig')['rust_analyzer'].setup {
local configRust = {
	capabilities = capabilities,
	on_attach    = on_attach,
	flags        = lsp_flags,
	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {

		}
	},
	root_dir = function() return vim.loop.cwd() end
}
-- ---------------------------------------------------------
-- Zig:
-- ---------------------------------------------------------
-- require('lspconfig')['rust_analyzer'].setup {
local configZig = {
	capabilities = capabilities,
	on_attach    = on_attach,
	flags        = lsp_flags,
	-- Server-specific settings...
	settings = {
		cmd = {
			"zls"
		}
	},
	root_dir = function() return vim.loop.cwd() end
}
--------------------------------------------------------------------------------
local configServeri = {
	{ aktivanC,      nazivServeraC,      configC      },
	{ aktivanCSS,    nazivServeraCSS,    configCSS    },
	{ aktivanHTML,   nazivServeraHTML,   configHTML   },
	{ aktivanJS,     nazivServeraJS,     configJS     },
	{ aktivanLua,    nazivServeraLua,    configLua    },
	{ aktivanPHP,    nazivServeraPHP,    configPHP    },
	{ aktivanPython, nazivServeraPython, configPython },
	{ aktivanRust,   nazivServeraRust,   configRust   },
	{ aktivanZig,    nazivServeraZig,    configZig    },
}
--------------------------------------------------------------------------------
if autoStartLSP == true then
	for k, v in pairs(configServeri) do
		if v[1] == true then
			require('lspconfig')[v[2]].setup(v[3])
		end
	end
end
--------------------------------------------------------------------------------

