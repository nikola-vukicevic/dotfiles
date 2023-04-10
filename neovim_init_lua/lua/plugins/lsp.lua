-- -----------------------------------------------------------------------------
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- -----------------------------------------------------------------------------
local opts = {
	noremap = true,
	silent  = true
}
-- -----------------------------------------------------------------------------
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
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
-- C/C++
-- ---------------------------------------------------------
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
	root_dir = function() return vim.loop.cwd() end
}
-- -------------------------------------
-- require('lspconfig')['clangd'].setup {
-- 	capabilities = capabilities,
-- 	cmd = {
-- 		"clangd",
-- 		"--clang-tidy",
-- 		"--background-index",
-- 		"--suggest-missing-includes",
-- 	},
-- 	on_attach = on_attach,
-- 	flags     = lsp_flags,
-- 	root_dir = function() return vim.loop.cwd() end
-- }
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
	root_dir = function() return vim.loop.cwd() end
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
	root_dir = function() return vim.loop.cwd() end
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
-- require('lspconfig')['intelephense'].setup {
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	flags     = lsp_flags,
-- 	root_dir = function() return vim.loop.cwd() end
-- }
-- -------------------------------------
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
-- ---------------------------------------------------------
-- Python:
-- ---------------------------------------------------------
require('lspconfig')['jedi_language_server'].setup {
	capabilities = capabilities,
	on_attach    = on_attach,
	flags        = lsp_flags,
	root_dir     = function() return vim.loop.cwd() end
}
-- -------------------------------------
-- require('lspconfig')['pyright'].setup {
--     on_attach = on_attach,
--     flags     = lsp_flags,
-- }
-- ---------------------------------------------------------
-- Rust:
-- ---------------------------------------------------------
require('lspconfig')['rust_analyzer'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags     = lsp_flags,
	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {

		}
	},
	root_dir = function() return vim.loop.cwd() end
}
--------------------------------------------------------------------------------
-- local lsp_signature_conf = {
-- 	bind         = true,
-- 	handler_opts = {
-- 		border = "none",   -- double, rounded, single, shadow, none
-- 	},
-- 	padding      = ' ',
-- }

-- require "lsp_signature".setup(lsp_signature_conf)
--------------------------------------------------------------------------------
-- Setup language servers.
-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     -- vim.keymap.set('n', '<space>f', function()
--     --   vim.lsp.buf.format { async = true }
--     -- end, opts)
--   end,
-- })
