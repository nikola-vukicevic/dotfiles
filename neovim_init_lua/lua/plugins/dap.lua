-- -----------------------------------------------------------------------------
require('dapui').setup()
require('nvim-dap-virtual-text').setup({
	-- commented = true,
	-- virt_text_position = "eol", -- 'inline'/'eol' - izgleda da ne radi
})
require("lazydev").setup({
	library = { "nvim-dap-ui" },
})
-- ------------------------------
local dap = require('dap')
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
			"/home/korisnik/git/js-debug/src/dapDebugServer.js",
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
	},
}
-- ------------------------------
dap.configurations.typescript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		runtimeExecutable = "node",
		cwd = "${workspaceFolder}",
		protocol = "inspector",
		sourceMaps = true,
		outDir = "${workspaceFolder}/bin",
		-- skipFiles = {
		-- 	"${workspaceFolder}/node_modules/**/*.js",
		-- 	"<node_internals>/**",
		-- },
		-- outFiles = { "${workspaceFolder}/bin/**/*.js" },
	},
}
-- dap.configurations.typescript = dap.configurations.javascript
-- dap.configurations.typescript = {
-- 	{
-- 		type = "pwa-node",
-- 		request = "attach",
-- 		name = "Attach",
-- 		processId = require("dap.utils").pick_process,
-- 		cwd = "${workspaceFolder}",
-- 	},
-- }
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
			command = '/home/korisnik/git/python_debugger/debugpy/bin/python',
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
		"/home/korisnik/git/local-lua-debugger-vscode/extension/debugAdapter.js"
	},
	enrich_config = function(config, on_config)
		if not config["extensionPath"] then
			local c = vim.deepcopy(config)
			-- 💀 If this is missing or wrong you'll see
			-- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
			c.extensionPath = "/home/korisnik/git/local-lua-debugger-vscode"
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
vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
vim.fn.sign_define("DapLogPoint",            { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
vim.fn.sign_define('DapStopped',             { text = "►", texthl = "DapStopped", linehl='DapStopped', numhl= 'DapStopped' })
-- sign('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
-- -----------------------------------------------------------------------------

