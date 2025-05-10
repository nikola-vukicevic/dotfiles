-- -----------------------------------------------------------------------------
require('dapui').setup()
require('nvim-dap-virtual-text').setup({
	-- commented = true,
	-- virt_text_position = "eol", -- 'inline'/'eol' - izgleda da ne radi
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
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.getcwd() .. "/main" -- Ako se izvršna datoteka zove main,
		end,                                  -- DAP se pokreće automatski
		-- program = function()
		--   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		-- end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}
-- ------------------------------
dap.configurations.c = dap.configurations.cpp
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
dap.configurations.typescript = dap.configurations.javascript
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
-- require("dap")

local sign = vim.fn.sign_define

sign("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint",            { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
sign('DapStopped',             { text = "►", texthl = "DapStopped", linehl='DapStopped', numhl= 'DapStopped' })
-- sign('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

