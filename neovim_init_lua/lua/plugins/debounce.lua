-- -----------------------------------------------------------------------------
-- debounce.lua
-- izvor: https://github.com/hrsh7th/nvim-cmp/issues/598
-- -----------------------------------------------------------------------------
local M = {}
-- -----------------------------------------------------------------------------
local cmp            = require("cmp")
local timer          = vim.loop.new_timer()
local DEBOUNCE_DELAY = 500
-- -----------------------------------------------------------------------------
function M.debounce()
	timer:stop()
	timer:start(
		DEBOUNCE_DELAY,
		0,
		vim.schedule_wrap(function()
			-- Izgleda da radi, ali - da li
			-- je "complete" prava opcija?!
			-- cmp.complete( { reason = cmp.ContextReason.complete } )
			cmp.complete( { reason = cmp.ContextReason.Auto } )
		end
	)
)
end
-- -----------------------------------------------------------------------------
return M
-- -----------------------------------------------------------------------------

