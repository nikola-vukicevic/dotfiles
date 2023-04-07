-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

local opts = {
	noremap = true,
	silent  = true
}

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

require('lspconfig')['clangd'].setup {
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
	},
	on_attach = on_attach,
	flags     = lsp_flags,
	root_dir = function() return vim.loop.cwd() end
}

-- require('lspconfig')['pyright'].setup {
--     on_attach = on_attach,
--     flags     = lsp_flags,
-- }

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

require('lspconfig')['jedi_language_server'].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags     = lsp_flags,
	root_dir = function() return vim.loop.cwd() end
}

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

-- require('lspconfig')['intelephense'].setup {
	-- capabilities = capabilities,
	-- on_attach = on_attach,
	-- flags     = lsp_flags,
	-- root_dir = function() return vim.loop.cwd() end
-- }
--
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

require('lspconfig')['rust_analyzer'].setup{
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
local lsp_signature_conf = {
	bind         = true,
	handler_opts = {
		border = "none",   -- double, rounded, single, shadow, none
	},
	padding      = ' ',
}

require "lsp_signature".setup(lsp_signature_conf)
--------------------------------------------------------------------------------

