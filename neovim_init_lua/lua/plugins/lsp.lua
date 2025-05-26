-- -----------------------------------------------------------------------------
local path_lua_ls = "/home/korisnik/git/lua-language-server/bin/lua-language-server"
-- -----------------------------------------------------------------------------
local autoStartLSP  = true
--
local aktivanC      = true
local aktivanCss    = true
local aktivanHtml   = true
local aktivanTsJs   = true
local aktivanLua    = true
local aktivanPython = true
local aktivanPhp    = true
local aktivanGo     = true
local aktivanRust   = true
local aktivanZig    = true
--
local listaServera = { }
-- -----------------------------------------------------------------------------
-- C/C++:
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanC == true then
--
local nazivServeraC = "clangd"
-- local nazivServeraC = "ccls"
--
local configClang = {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"-j=2", -- # of async workers
		"--log=verbose",
		"-pretty",
		"--completion-style=detailed",
		"--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
		"--all-scopes-completion",
		--
		"--header-insertion-decorators",
		"--header-insertion=iwyu",
		"--pch-storage=memory",
		--
		-- "--suggest-missing-includes",
		-- "--cross-file-rename",
		-- "--clang-tidy-checks=*",
	},
	root_markers = {
		"compile_commands.json",
		"compile_flags.txt"
	},
	filetypes = {
		"c",
		"cpp"
	},
}
--
local configCcls = {
	init_options = {
		compilationDatabaseDirectory = "build";
		index = {
			threads = 0;
		};
		clang = {
			excludeArgs = { "-frounding-math"} ;
		};
	};
	cmd = {
		"ccls"
	};
	filetypes = {
		"c"
	};
	root_markers = {
		 "compile_commands.json",
		 ".ccls",
		 ".git"
	};
	workspace_required = true;
}
--
vim.lsp.config[nazivServeraC] = configClang
-- vim.lsp.config[nazivServeraC] = configCcls
--
table.insert(listaServera, nazivServeraC)
--
end
-- -----------------------------------------------------------------------------
-- CSS:
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanCss == true then
--
local nazivServeraCss = "cssls"
--
vim.lsp.config[nazivServeraCss] = {
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
--
table.insert(listaServera, nazivServeraCss)
--
end
-- -----------------------------------------------------------------------------
-- HTML:
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanHtml == true then
--
local nazivServeraHtml = "html"
--
vim.lsp.config[nazivServeraHtml] = {
	cmd = {
		"vscode-html-language-server",
		"--stdio"
	},
	filetypes = {
		"html",
	},
	root_markers = {
		".git",
		"package.json"
	},
	settings = { },
	init_options = {
		provideFormatter = true,
		embeddedLanguages = {
			css = true,
			javascript = true
		},
		-- configurationSection = {
		-- 	'html',
		-- 	'css',
		-- 	'javascript'
		-- },
		-- hover = {
		-- 	documentation = true,
		-- 	references = true
		-- }
	},
}
--
table.insert(listaServera, nazivServeraHtml)
--
end
-- -----------------------------------------------------------------------------
-- TypeScript/JavaScript:
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanTsJs == true then
--
local nazivServeraTsJs = "ts_ls"
--
vim.lsp.config[nazivServeraTsJs] = {
	cmd = {
		"typescript-language-server",
		"--stdio"
	},
	filetypes = {
		"javascript",
		"typescript",
	},
}
--
table.insert(listaServera, nazivServeraTsJs)
--
end
-- -----------------------------------------------------------------------------
-- Lua:
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanLua == true then
--
local nazivServeraLua = "lua_ls"
--
vim.lsp.config[nazivServeraLua] = {
	cmd          = {
		path_lua_ls
	},
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc"
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			}
		}
	}
}
--
table.insert(listaServera, nazivServeraLua)
--
end
-- -----------------------------------------------------------------------------
-- Python:
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanPython == true then
--
local nazivServeraPython = "pyright"
--
vim.lsp.config[nazivServeraPython] = {
	cmd = {
		"pyright-langserver",
		"--stdio"
	},
	filetypes = {
		"python"
	},
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
}
--
table.insert(listaServera, nazivServeraPython)
--
end
-- -----------------------------------------------------------------------------
-- PHP:
-- -----------------------------------------------------------------------------
-- Intelephense nema rename u besplatnoj verziji, a phpactor je
-- generalno 'ispran' po pitanju opcija. :(
if autoStartLSP == true and aktivanPhp == true then
--
local nazivServeraPhp = "intelephense"
--
vim.lsp.config[nazivServeraPhp] = {
	cmd = {
		"intelephense",
		"--stdio"
	},
	filetypes = {
		"php"
	},
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local cwd = assert(vim.uv.cwd())
		local root = vim.fs.root(fname, { "composer.json", ".git" })
		-- prefer cwd if root is a descendant
		on_dir(root and vim.fs.relpath(cwd, root) and cwd)
	end,
}
--
table.insert(listaServera, nazivServeraPhp)
--
end
-- -----------------------------------------------------------------------------
-- Go(lang):
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanGo == true then
--
local nazivServeraGo = "gopls"
--
vim.lsp.config[nazivServeraGo] = {
	cmd = {
		"/home/korisnik/git/gopath/bin/gopls"
	},
	filetypes = {
		"go",
		"gomod",
		"gowork",
		"gotmpl"
	}
}
--
table.insert(listaServera, nazivServeraGo)
--
end
-- -----------------------------------------------------------------------------
-- Rust:
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanRust == true then
--
local nazivServeraRust = "rust_analyzer"
--
vim.lsp.config[nazivServeraRust] = {
	cmd = {
		"rust-analyzer"
	},
	filetypes = {
		"rust"
	},
}
--
table.insert(listaServera, nazivServeraRust)
--
end
-- -----------------------------------------------------------------------------
-- Zig:
-- -----------------------------------------------------------------------------
if autoStartLSP == true and aktivanZig == true then
--
local nazivServeraZig = "zls"
--
vim.lsp.config[nazivServeraZig] = {
	cmd = {
		"zls"
	},
	filetypes = {
		"zig",
		"zir"
	},
	root_markers = {
		"zls.json",
		"build.zig",
		".git",
	},
	workspace_required = false
}
--
table.insert(listaServera, nazivServeraZig)
--
end
-- -----------------------------------------------------------------------------
vim.lsp.enable(listaServera)
-- -----------------------------------------------------------------------------

