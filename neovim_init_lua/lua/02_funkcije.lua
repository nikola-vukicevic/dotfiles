-- -----------------------------------------------------------------------------
-- print("[" .. k1[2] .. ", " .. k1[3] .. "]")
-- -----------------------------------------------------------------------------
function SpelovanjeToggle()
	if vim.g.spell_check == false then
		vim.g.spell_check = true
		vim.cmd("set spell!")
		vim.cmd("set spelllang=sr_RS")
		vim.cmd("set syntax=OFF")
		print("Spell checker uključen")
	else
		vim.g.spell_check = false
		vim.cmd("set spell!")
		vim.cmd("set syntax=ON")
		print("Spell checker isključen")
	end
end
-- -----------------------------------------------------------------------------
function OpcijeZaFormatiranje()
	-- vim.opt.formatoptions:remove("c")
	-- vim.opt.formatoptions:remove("r")
	-- vim.opt.formatoptions:remove("o")
	vim.cmd("setlocal formatoptions=crqn2l1j")
end
-- -----------------------------------------------------------------------------
function DupliranjeLinijeNaDole()
	local k1 = vim.fn.getcursorcharpos(".")
	vim.cmd("normal yyp")
	local k2 = vim.fn.getcursorcharpos(".")
	vim.fn.setcursorcharpos(k2[2], k1[3])
end
-- -----------------------------------------------------------------------------
function DupliranjeLinijeNaGore()
	local k1 = vim.fn.getcursorcharpos(".")
	vim.cmd("normal yyP")
	local k2 = vim.fn.getcursorcharpos(".")
	vim.fn.setcursorcharpos(k2[2], k1[3])
end
-- -----------------------------------------------------------------------------
function PomeranjeLinijeNaDole()
	local r = vim.fn.getcursorcharpos(".")[2]
	if r < vim.api.nvim_buf_line_count(0) then
		vim.cmd(":m .+1<cr>")
	end
end
-- -----------------------------------------------------------------------------
function PomeranjeLinijeNaGore()
	local r = vim.fn.getcursorcharpos(".")[2]
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
function IspisKoordinata(koord)
	print( "[" .. koord.r1 .. "|" .. koord.k1 .. "|" .. koord.r2 .. "|" .. koord.k2 .. "]" )
end
-- -----------------------------------------------------------------------------
function CitanjeKoordinataSelekcije()
	local pocetak = vim.fn.getcharpos("'<")
	local kraj    = vim.fn.getcharpos("'>")
	return {
		r1 = pocetak[2] ,
		k1 = pocetak[3] ,
		r2 = kraj[2] ,
		k2 = kraj[3] ,
	}
end
-- -----------------------------------------------------------------------------
function UokviravanjeVisual(s1, s2)
	local koord     = CitanjeKoordinataSelekcije()
	IspisKoordinata(koord)
	local linije    = vim.api.nvim_buf_get_text(0, koord.r1 - 1, koord.k1 - 1, koord.r2 - 1, koord.k2, {})
	linije[1]       = s1 .. linije[1]
	linije[#linije] = linije[#linije] .. s2
	vim.api.nvim_buf_set_text(0, koord.r1 - 1, koord.k1 - 1, koord.r2 - 1, koord. k2, linije)
end
-- -----------------------------------------------------------------------------
function UokviravanjeVisualSelekcija(indeks)
	local parovi = {
		{ "<code class='kod_u_tekstu'>" , "</code>" },
		{ "&lt;"                        , "&gt;"    },
		{ "<em>"                        , "</em>"   },
	}

	UokviravanjeVisual(parovi[indeks][1] , parovi[indeks][2])
end
-- -----------------------------------------------------------------------------
function SelekcijaDaLiJeSingl(koord)
	return koord.r1 == koord.r2 and koord.k1 == koord.k2
end
-- -----------------------------------------------------------------------------
function ObradaMenija(ulaz)
	local parovi = {
		["c1"] = 1,
		["c2"] = 2,
		["em"] = 3,
	}
	
	local v = parovi[ulaz]

	if v == nil then
		print(" [GREŠKA: Nepostojeći indeks!]")
		return
	end

	local koord = CitanjeKoordinataSelekcije()

	if SelekcijaDaLiJeSingl(koord) then
		vim.cmd("normal viw")
	end
	local koord = CitanjeKoordinataSelekcije()
	IspisKoordinata(koord)
	
	UokviravanjeVisualSelekcija(v)
end
-- -----------------------------------------------------------------------------
function ProbaMenija()
	-- vim.ui.menu( { "Meni ....", "i tebi ....", "i drugima ...." } , { prompt = "Choooose .... your destiny!" },  ObradaMenija )
	vim.ui.input( { prompt = "Tag: " } , ObradaMenija )
end
-- -----------------------------------------------------------------------------
