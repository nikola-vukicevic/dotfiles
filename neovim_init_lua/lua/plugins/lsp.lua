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
		"--cross-file-rename"
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
		"/home/korisnik/git/lua-language-server/bin/lua-language-server"
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
-- vim.lsp.config[""] = {
--
-- }
-- -----------------------------------------------------------------------------
-- vim.lsp.config[""] = {
--
-- }
-- -----------------------------------------------------------------------------
vim.lsp.enable({
	"clangd",
	"cssls",
	"html",
	"ts_ls",
	"lua_ls",
})
-- -----------------------------------------------------------------------------

