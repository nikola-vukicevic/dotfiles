-- -----------------------------------------------------------------------------
local autoStartDap  = true
--
local aktivanC      = true
local aktivanTsJs   = true
local aktivanLua    = true
local aktivanPython = true
local aktivanPhp    = true
local aktivanGo     = true
local aktivanRust   = true
local aktivanZig    = true
--
local dap
local dapui
local util
--
local path_dap_pwa_node
local path_dap_lua
local path_dap_python
local path_dap_php
local path_dap_go_1
local path_dap_go_2
-- -----------------------------------------------------------------------------
if autoStartDap == true then
--
path_dap_pwa_node = "/home/korisnik/git/js-debug/src/dapDebugServer.js"
path_dap_lua      = "/home/korisnik/git/local-lua-debugger-vscode"
path_dap_python   = "/home/korisnik/git/python_debugger/debugpy/bin/python"
path_dap_php      = ""
path_dap_go_1     = "/home/korisnik/git/gopath/vscode-go/extension/dist/debugAdapter.js"
path_dap_go_2     = "/home/korisnik/git/gopath/bin/dlv"
-- -----------------------------------------------------------------------------
require("nvim-dap-virtual-text").setup({
	-- commented = true,
	-- virt_text_position = "eol", -- 'inline'/'eol' - izgleda da ne radi
})
-- ------------------------------
dap   = require("dap")
dapui = require("dapui")
util  = require("dap.utils")
--
end
-- -----------------------------------------------------------------------------
-- C/C++:
-- -----------------------------------------------------------------------------
if autoStartDap == true and aktivanC == true then
--
dap.adapters.codelldb = {
	type = "executable",
	command = "codelldb",
}
--
dap.configurations.c = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/main_debug" -- Ako se izvršna datoteka
			                                        -- zove main_debug, DAP
		end,                                        -- se pokreće automatski
		-- program = function()
		--   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		-- end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
-- ------------------------------
dap.configurations.cpp = dap.configurations.c
--
end
-- -----------------------------------------------------------------------------
-- Javascript/Typescript:
-- -----------------------------------------------------------------------------
if autoStartDap == true and aktivanTsJs == true then
--
dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = {
			-- "--inspect",
			path_dap_pwa_node,
			"${port}"
		},
	}
}
--
dap.configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
		-- outDir = "${workspaceFolder}/bin",
		outFiles = {
			"${workspaceFolder}/bin/*.(m|c|)js",
			"!**/node_modules/**"
		}

	},
}
--
dap.configurations.typescript = {
	{
		type = "pwa-node",
		request = "attach",
		name = "Attach to Node app",
		address = "localhost",
		-- port = 9229,
		protocol = "inspector",
		console = "integratedTerminal",
		-- processId = util.pick_process,
		cwd = "${workspaceFolder}",
		-- restart = true,
		outFiles = {
			"${workspaceFolder}/bin/*.(m|c|)js",
			"!**/node_modules/**"
		}
	},
}
--
end
-- -----------------------------------------------------------------------------
-- Lua:
-- -----------------------------------------------------------------------------
if autoStartDap == true and aktivanLua == true then
--
dap.adapters["local-lua"] = {
	type = "executable",
	command = "node",
	args = {
		path_dap_lua .. "/extension/debugAdapter.js"
	},
	enrich_config = function(config, on_config)
		if not config["extensionPath"] then
			local c = vim.deepcopy(config)
			c.extensionPath = path_dap_lua
			on_config(c)
		else
			on_config(config)
		end
	end,
}
--
dap.configurations.lua = {
	{
		name = "Current file (local-lua-dbg, lua)",
		type = "local-lua",
		repl_lang = "lua",
		request = "launch",
		cwd = "${workspaceFolder}",
		program = {
			lua = "luajit",
			file = "${file}",
		},
		args = {},
	},
}
--
end
-- -----------------------------------------------------------------------------
-- Python:
-- -----------------------------------------------------------------------------
if autoStartDap == true and aktivanPython == true then
--
dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
			source_filetype = "python",
			},
		})
	else
		cb({
			type = "executable",
			command = path_dap_python,
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python",
			},
		})
	end
end
--
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end
	},
}
--
end
-- -----------------------------------------------------------------------------
-- PHP:
-- -----------------------------------------------------------------------------
if autoStartDap == true and aktivanPhp == true then
--
dap.adapters["php"] = {
	type = "executable",
	command = "node",
	args = {
		path_dap_php
	}
}
--
dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = 9003
	}
}
--
end
-- -----------------------------------------------------------------------------
-- Go(lang):
-- -----------------------------------------------------------------------------
if autoStartDap == true and aktivanGo == true then
--	
dap.adapters["go"] = {
	type = "executable",
	name = "go",
	command = "node",
	args = {
		-- os.getenv("HOME") .. "/dev/golang/vscode-go/extension/dist/debugAdapter.js"
		path_dap_go_1
	}
}
--	
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		showLog = false,
		program = "${file}",
		dlvToolPath = vim.fn.exepath(path_dap_go_2)
		-- divToolPath = vim.fn.exepath("dlv")
	}
}
--	
end
-- -----------------------------------------------------------------------------
-- Rust:
-- -----------------------------------------------------------------------------
if autoStartDap == true and aktivanRust == true then
--
dap.adapters["lldb_rust"] = {
	type = "executable",
	command = "codelldb",
	name = "lldb"
}
--
dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb_rust",
		request = "launch",
		program = "${workspaceFolder}/target/debug/_debug",
		-- program = function()
		-- 	return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		-- end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = { },
	}
}
--
end
-- -----------------------------------------------------------------------------
-- Zig:
-- -----------------------------------------------------------------------------
if autoStartDap == true and aktivanZig == true then
--
dap.adapters["lldb_zig"] = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = {
			"--port",
			"${port}"
		},
	},
}
--
dap.configurations.zig = {
	{
		name = "Launch",
		type = "lldb_zig", -- "codelldb",
		request = "launch",
		program = "${workspaceFolder}/_debug",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = { },
	},
}
--
end
-- -----------------------------------------------------------------------------
-- Fenseraj :)
-- -----------------------------------------------------------------------------
if autoStartDap == true then
--
dapui.setup({
	icons = {
		expanded = "▾",
		collapsed = "▸",
		current_frame = "●"
	},
	controls = {
		icons = {
			pause = "⏸",
			play = "▶",
			step_into = "⏎",
			step_over = ">", -- "⏭",
			step_out = "<",  -- "⏮",
			step_back = "b",
			run_last = "⏭",  -- "▶▶",
			terminate = "⏹",
			disconnect = "⏏",
		},
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.45
				}, {
					id = "watches",
					size = 0.55
				}
			},
			position = "left",
			size = 32
		},
		{
			elements = {
				{
					id = "repl",
					size = 0.5
				}, {
					id = "console",
					size = 0.5
				}
			},
			position = "bottom",
			size = 12
		},
		{
			elements = {
				{
					id = "breakpoints",
					size = 0.5
				}, {
					id = "stacks",
					size = 0.5
				}
			},
			position = "right",
			size = 32
		},
	},
})  -- dapui.setup()
-- ------------------------------
vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
vim.fn.sign_define("DapLogPoint",            { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped",             { text = "►", texthl = "DapStopped", linehl="DapStoppedLinija", numhl= "DapStopped" })
-- sign("DapStopped", { text="", texthl="DapStopped", linehl="DapStopped", numhl= "DapStopped" })
--
end -- if autoStartDap
-- -----------------------------------------------------------------------------

