-- -----------------------------------------------------------------------------
function DupliranjeLinijeNaDole()
	vim.cmd("normal yyp")
end
-- -----------------------------------------------------------------------------
function DupliranjeLinijeNaGore()
	vim.cmd("normal yyP")
	vim.cmd("normal kj")
end
-- -----------------------------------------------------------------------------
function PomeranjeLinijeNaDole()
	local r = vim.api.nvim_win_get_cursor(0)[1]
	if r < vim.api.nvim_buf_line_count(0) then
		vim.cmd(":m .+1<cr>")
	end
end
-- -----------------------------------------------------------------------------
function PomeranjeLinijeNaGore()
	local r = vim.api.nvim_win_get_cursor(0)[1]
	if r > 1 then
		vim.cmd(":m .-2<cr>")
	end
end
-- -----------------------------------------------------------------------------
function Uokviravanje()
	vim.cmd("normal wbi<code class='kod_u_tekstu'>")
	vim.cmd("normal ea</code>")
end
-- -----------------------------------------------------------------------------
function UokviravanjeVisual()
	print("Vižual je Meka i Medina!")
end
-- -----------------------------------------------------------------------------

