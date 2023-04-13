-- -----------------------------------------------------------------------------
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- -----------------------------------------------------------------------------
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- client.server_capabilities.semanticTokensProvider = nil
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
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
local izborC      = 2 -- 1: Clang,        2: CCLS
local izborPHP    = 2 -- 1: intelephense, 2: PHP actor
local izborPython = 1 -- 1: Jedi,         2: Pyright:
-- ---------------------------------------------------------
-- C/C++
-- ---------------------------------------------------------
if izborC == 1 then
	-- ------------
	require('lspconfig')['clangd'].setup {
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
	require('lspconfig')['ccls'].setup {
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
require('lspconfig')['cssls'].setup {
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
require('lspconfig')['html'].setup {
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
require('lspconfig')['tsserver'].setup {
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
require('lspconfig')['lua_ls'].setup {
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
if izborPHP == 1 then
	require('lspconfig')['intelephense'].setup {
		capabilities = capabilities,
		on_attach    = on_attach,
		flags        = lsp_flags,
		root_dir     = function() return vim.loop.cwd() end
	}
end
-- -------------------------------------
if izborPHP == 2 then
	require('lspconfig')['phpactor'].setup {
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
if izborPython == 1 then
	-- -----------------
	require('lspconfig')['jedi_language_server'].setup {
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
	require('lspconfig')['pyright'].setup {
		on_attach = on_attach,
		flags     = lsp_flags,
	}
	-- -----------------
end
-- ---------------------------------------------------------
-- Rust:
-- ---------------------------------------------------------
require('lspconfig')['rust_analyzer'].setup {
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
--------------------------------------------------------------------------------
