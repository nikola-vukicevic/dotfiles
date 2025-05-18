-- -----------------------------------------------------------------------------
local path_dap_pwa_node = "/home/korisnik/git/js-debug/src/dapDebugServer.js"
local path_dap_python   = "/home/korisnik/git/python_debugger/debugpy/bin/python"
local path_dap_lua      = "/home/korisnik/git/local-lua-debugger-vscode"
-- -----------------------------------------------------------------------------
require('nvim-dap-virtual-text').setup({
	-- commented = true,
	-- virt_text_position = "eol", -- 'inline'/'eol' - izgleda da ne radi
})
-- ------------------------------
local dap   = require('dap')
local dapui = require('dapui')
local util  = require('dap.utils')
-- -----------------------------------------------------------------------------
-- C/C++:
-- -----------------------------------------------------------------------------
dap.adapters.codelldb = {
	type = "executable",
	command = "codelldb",
}
-- ------------------------------
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
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}
-- ------------------------------
dap.configurations.cpp = dap.configurations.c
-- -----------------------------------------------------------------------------
-- Javascript/Typescript:
-- -----------------------------------------------------------------------------
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
-- ------------------------------
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
-- ------------------------------
dap.configurations.typescript = {
	{
		type = 'pwa-node',
		request = 'attach',
		name = 'Attach to Node app',
		address = 'localhost',
		-- port = 9229,
		protocol = "inspector",
		console = "integratedTerminal",
		-- processId = util.pick_process,
		cwd = '${workspaceFolder}',
		-- restart = true,
		outFiles = {
			"${workspaceFolder}/bin/*.(m|c|)js",
			"!**/node_modules/**"
		}
	},
}
-- -----------------------------------------------------------------------------
-- Python:
-- -----------------------------------------------------------------------------
dap.adapters.python = function(cb, config)
	if config.request == 'attach' then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or '127.0.0.1'
		cb({
			type = 'server',
			port = assert(port, '`connect.port` is required for a python `attach` configuration'),
			host = host,
			options = {
			source_filetype = 'python',
			},
		})
	else
		cb({
			type = 'executable',
			command = path_dap_python,
			args = { '-m', 'debugpy.adapter' },
			options = {
				source_filetype = 'python',
			},
		})
	end
end
-- ------------------------------
dap.configurations.python = {
	{
		type = 'python',
		request = 'launch',
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
				return cwd .. '/venv/bin/python'
			elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
				return cwd .. '/.venv/bin/python'
			else
				return '/usr/bin/python'
			end
		end
	},
}
-- -----------------------------------------------------------------------------
-- Lua:
-- -----------------------------------------------------------------------------
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
-- ------------------------------
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
-- -----------------------------------------------------------------------------
-- Fenseraj :)
-- -----------------------------------------------------------------------------
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
})
-- ------------------------------
vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
vim.fn.sign_define("DapLogPoint",            { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
vim.fn.sign_define('DapStopped',             { text = "►", texthl = "DapStopped", linehl='DapStoppedLinija', numhl= 'DapStopped' })
-- sign('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
-- -----------------------------------------------------------------------------

