-- -----------------------------------------------------------------------------
-- print("[" .. k1[2] .. ", " .. k1[3] .. "]")
-- -----------------------------------------------------------------------------
function SpelovanjeToggle()
	if vim.g.spell_check == false then
		vim.g.spell_check = true
		vim.cmd("set spell!")
		vim.cmd("set spelllang=sr_RS")
		vim.cmd("set syntax=OFF")
		vim.notify("Spell checker uključen")
	else
		vim.g.spell_check = false
		vim.cmd("set spell!")
		vim.cmd("set syntax=ON")
		vim.notify("Spell checker isključen")
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
-- UokviravanjeSelekcije:
-- -----------------------------------------------------------------------------
function DaLiJeASCII(c)
	-- print("ASCII provera: '" .. c .. "'")
	return string.byte(c) <= 127
end
-- -----------------------------------------------------------------------------
function DaLiJeGranicnikZaProsirivanje(c)
	if c == " " then return true end
	if c == "<" then return true end
	if c == ">" then return true end
	if c == "#" then return true end
	if c == "." then return true end
	if c == "," then return true end
	if c == ":" then return true end
	if c == ";" then return true end
	if c == "(" then return true end
	if c == ")" then return true end
	--
	if c == "\t" then return true end
	if c == "\"" then return true end

	return false
end
-- -----------------------------------------------------------------------------
function ProsirivanjeSelekcijeUlevo(s, k)
	if k < 1 then return k + 1 end
	--
	local c = s:sub(k, k)
	--
	while k >= 1 and not DaLiJeGranicnikZaProsirivanje(c) do
		-- print(c)
		k = k - 1
		c = s:sub(k, k)
	end
	--
	return k + 1
end
-- -----------------------------------------------------------------------------
function ProsirivanjeSelekcijeUdesno(s, k)
	local g = string.len(s)
	if k > g then return k - 1 end
	--
	local c = s:sub(k, k)
	--
	while k <= g and not DaLiJeGranicnikZaProsirivanje(c) do
		-- print(c)
		k = k + 1
		c = s:sub(k, k)
	end

	return k - 1
end
-- -----------------------------------------------------------------------------
function ProveraPoslednjegZnaka(s, koord)
	local c = s:sub(koord.k2, koord.k2)

	-- print(string.format("red: '%s'", s))
	-- print(string.format("c:   '%s'", c))
	return DaLiJeASCII(c)
end
-- -----------------------------------------------------------------------------
-- Funkcija preko koje se određuje za koliko treba proširiti selekciju
-- Funkcija se aktivira samo ukoliko je funkcija KorekcijaPoslednjiZnak
-- (koja je definisana ispod), ustanovila da poslednji znak ima širinu
-- veću od jednog bajta

function ProsirivanjePoslednjegZnaka(s, koord, mode)
	local i = koord.k2 + 1   -- pomoćni indeks
	local d = string.len(s)

	if i > d then return 0 end

	local b = 0
	local c = s:sub(i, i)

	while not DaLiJeASCII(c) do
		i = i + 1
		b = b + 1
		if i <= d then
			c = s:sub(i, i)
		else
			c = 'a'
		end
	end

	return b
end

-- function ProsirivanjePoslednjegZnaka(s, koord, mode)
-- 	local i = koord.k2 + 1   -- pomoćni indeks
-- 	local d = string.len(s)
--
-- 	if i > d then return 0 end
--
-- 	local b = 0  -- brojač
-- 	local c      -- poslenji znak (s tim da nije ceo znak,
-- 	             -- već jedan od UTF-8 bajtova)
--
-- 	repeat
-- 		c       = s:sub(i, i)
-- 		local u = not DaLiJeASCII(c)
--
-- 		if u then
-- 			b = b + 1
-- 		end
--
-- 		i = i + 1
-- 	until u and i <= d
--
-- 	return b
-- end
-- -----------------------------------------------------------------------------
-- Ako Visual mode selekcija na poslednjem mestu "zahvati" neki od "ne-ASCII"
-- znakova, biće obuhvaćen samo prvi bajt iz UTF-8 znaka - a treba da budu
-- obuhvaćeni i svi ostali

function KorekcijaPoslednjiZnak(koord, mode)
	local korekcija = 0
	local s         = vim.fn.getline(koord.r2)

	-- print("'" .. s .. "'")
	if not ProveraPoslednjegZnaka(s, koord) then
		korekcija = ProsirivanjePoslednjegZnaka(s, koord, mode)
	end

	return {
		r1 = koord.r1,
		k1 = koord.k1,
		r2 = koord.r2,
		k2 = koord.k2 + korekcija,
	}
end
-- -----------------------------------------------------------------------------
-- Za normal mode - posebna funkcija za automatsko proširivanje selekcije
-- (selekcija iz normal moda je obavezno jedan znak)
-- NAPOMENA: Korekcija za kolonu (-1), je vrlo čudna, ali, izgleda da
--           Telescope pomera kursor

function CitanjeKoordinataNormalMode(mode)
	local K = 0                   -- Korekcija za kolonu
	local r = vim.fn.line(".")    -- red
	local k = vim.fn.col(".") + K -- kolona
	local s = vim.fn.getline(r)   -- sadržaj reda
	local l = k                   -- levi graničnik
	local d = k                   -- desni graničnik
	local c = s:sub(k, k)         -- znak ispod kursora
                                  -- (pri selektovanju)

	if not DaLiJeGranicnikZaProsirivanje(c) then
		l = ProsirivanjeSelekcijeUlevo(s, k - 1)
		d = ProsirivanjeSelekcijeUdesno(s, k + 1)
		-- d = d - UnicodeKorekcijaPartDeux(s, l, d)
	end

	return {
		r1 = r,
		k1 = l,
		r2 = r,
		k2 = d,
	}
end
-- -----------------------------------------------------------------------------
-- Za Visual mode može da se napravi normalna selekcija preko API markera
-- (za normal mode je bilo problema, da se selekcija "uhvati" preko markera, pa
-- sam zato pisao custom funckiju)

function CitanjeKoordinataVisualMode(mode)
	local p = nil -- pocetak[x, y]
	local k = nil -- kraj[x, y]

	if mode == "v" then
		p = vim.fn.getpos("'<")
		k = vim.fn.getpos("'>")
	end

	return KorekcijaPoslednjiZnak(
		{
			r1 = p[2] ,
			k1 = p[3] ,
			r2 = k[2] ,
			k2 = k[3] ,
		},
		mode
	)
end
-- -----------------------------------------------------------------------------
-- Ako se selekcija prostire na više redova, kursor se pomera za širinu
-- zatvarajućeg taga, a ako je selekcija u jednom redu, kursor se pomera
-- za zbirnu širinu oba taga

function RacunanjeOffseta(par, koord)
	-- print(par[1])
	-- print(par[2])

	if math.abs(koord.r2 - koord.r1) > 0 then
		return string.len(par[2])
	else
		return string.len(par[1]) + string.len(par[2])
	end
end
-- -----------------------------------------------------------------------------
-- Uokviravanje funkcioniše po principu "<tag>" + selekcija + "</tag>"
-- par[1] je tipično otvarajući tag
-- par[2] je tipično zatvarajući tag
-- Međutim ....
-- Lista "linije" je tu zato što (Neo)Vim ne čita izabrani tekst kao
-- blok teksta (to jest, kao "jednu" nisku), već kao listu linija

function UokviravanjeSelekcijeRadni(par, koord)
	-- IspisKoordinata(koord)

	local linije    = vim.api.nvim_buf_get_text(0, koord.r1 - 1, koord.k1 - 1, koord.r2 - 1, koord.k2, {})

	linije[1]       = par[1]          .. linije[1]
	linije[#linije] = linije[#linije] .. par[2]

	vim.api.nvim_buf_set_text(0, koord.r1 - 1, koord.k1 - 1, koord.r2 - 1, koord. k2, linije)
end
-- -----------------------------------------------------------------------------
-- Ideja je da se otvarajući i zatvarajući tag 'izvuku' iz teksta koji
-- se prikazuje u meniju (umesto da se čuvaju u zasebnoj listi i sl)
-- Cela linija ima format: "1. <tag>%s</tag>"
-- Traže se: (1) prvi spejs posle broja i (2) niska "%s" (koja predstavlja
-- realnu nisku iz teksta, koja se uokviruje)

function CitanjeParovaIzStringa(s)
	local p1 = string.sub(s, string.find(s, " ") + 1, string.find(s, "%%s<") - 1)
	local p2 = string.sub(s, string.find(s, "%%s.*") + 2)

	return { p1 , p2 }
end
-- -----------------------------------------------------------------------------
function IzlazakVMPostavljanjeKursora(koord, offset)
	vim.api.nvim_win_set_cursor( 0 , { koord.r2, koord.k2 + offset } )
end
-- -----------------------------------------------------------------------------
-- Kanda radi lepo, ali sve ovo bi definitivno trebalo
-- istražiti detaljnije (i izgleda da je postavljanje modova
-- preko API-ja, poveća zezancija)!

function IzlazakIzVisualModa(mode, offset, koord)
	if mode == "n" then
		-- Kanda radi lepo, ali sve ovo bi definitivno trebalo
		-- istražiti detaljnije !!
		local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)
		vim.api.nvim_feedkeys(esc, 'x', false)
	end

	IzlazakVMPostavljanjeKursora(koord, offset)
end

-- P.S.
-- Ispod su dve "fore" koje NISU radile:
-- vim.api.nvim_input("<ESC>")
-- vim.api.nvim_feedkeys("\\<ESC>", "n", true)
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
-- Prilično je bezbedno ispitivati samo one uslove koji su dole navedeni,
-- budući da se funkcija poziva samo preko zasebnih prečica, koje su
-- definisane samo za odgovarajući mod
-- NAPOMENA: funkcija koja se 'zapravo' poziva iz programa,
--           definisana je ispod

function ObradaMenija(ulaz, mode)
	if ulaz == nil then
		return
	end

	local koord

	if mode == "n" then
		koord = CitanjeKoordinataNormalMode(mode)
	end

	if mode == "v" then
		koord  = CitanjeKoordinataVisualMode(mode)
	end

	local par = CitanjeParovaIzStringa(ulaz)

	-- IspisKoordinata(koord)
	UokviravanjeSelekcijeRadni(par, koord)

	local offset = RacunanjeOffseta(par, koord)

	-- if mode == "v" then
	IzlazakIzVisualModa(mode, offset, koord)
	-- end
end
-- -----------------------------------------------------------------------------
-- Funkcija koja se poziva direktno iz programa
-- Na ovom mestu biće definisana lista tagova (neće biti prevelika)
-- Radna funkcija (definisana iznad) je callback funkcija funkcije
-- select (iz Neovim-ovog API-ja)

function UokviravanjeSelekcije(mode)
	-- print(string.format("mode: %s", mode))
	vim.ui.select(
		{
			"1. <code class='kod_u_tekstu'>%s</code>" ,
			"2. <%s>" ,
			"3. <em>%s</em>",
			"4. <strong>%s</strong>",
			"5. <a href=''>%s</a>",
		} ,
	    {
			prompt = "Izbor taga",
		} ,
		function(choice)
			ObradaMenija(choice, mode)
		end
	)
end
-- -----------------------------------------------------------------------------
-- END OF UokviravanjeSelekcije
-- -----------------------------------------------------------------------------
function RenameHandler()
	print("LSP rocx!")
end
-- -----------------------------------------------------------------------------
-- LSP RENAME:
-- -----------------------------------------------------------------------------
function LSPRenamePripremaQuickFixa(promena, bufnr)
	local linija_start = promena.range.start.line + 1
	local linija       = vim.api.nvim_buf_get_lines(bufnr, linija_start - 1, linija_start, false)[1]

	local quickFix = {
		bufnr = bufnr,
		lnum  = linija_start,
		col   = promena.range.start.character + 1,
		text  = linija,
	}

	-- print(vim.inspect(promena))
	-- print(vim.inspect(quickFix))

	return quickFix
end
-- -----------------------------------------------------------------------------
function LSPRenameCitanjeChanges(JSON_lista, ctx)
	local lista = { }

	for uri, izmene in pairs(JSON_lista) do
		local bufnr = vim.uri_to_bufnr(uri)

		for _, izmena in ipairs(izmene) do
			local quickFix = LSPRenamePripremaQuickFixa(izmena, bufnr)
			table.insert(lista, quickFix)
		end
	end

	return lista
end
-- -----------------------------------------------------------------------------
function LSPRenameCitanjeDocumentChanges(JSON_lista, ctx)
	local lista = { }

	for _, izmene in ipairs(JSON_lista) do
		local bufnr = vim.uri_to_bufnr(izmene.textDocument.uri)
		for _, izmena in ipairs(izmene.edits) do
			local quickFix = LSPRenamePripremaQuickFixa(izmena, bufnr)
			table.insert(lista, quickFix)
		end
	end

	return lista
end
-- -----------------------------------------------------------------------------
function LSPRenameKreiranjeQFListe(result, ctx)
	if result.changes then
		return LSPRenameCitanjeChanges(result.changes, ctx)
	elseif result.documentChanges then
		return LSPRenameCitanjeDocumentChanges(result.documentChanges, ctx)
	else
		return { }
	end
end
-- -----------------------------------------------------------------------------
function LSPRenameHandler(err, result, context, config)
	if not result then return end
	--
	-- print(vim.inspect(context))
	-- print(vim.inspect(result))
	--
	local client = vim.lsp.get_client_by_id(context.client_id)
	vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)
	--
	local lista = LSPRenameKreiranjeQFListe(result, context)
	--
	-- print(vim.inspect(lista))
	vim.fn.setqflist(lista, "r")
	vim.cmd("copen")
	-- require('telescope.builtin').quickfix()
end
-- -----------------------------------------------------------------------------
function LSPRename(ime)
	local clients = vim.lsp.get_clients({ bufnr = buf }) -- TODO - dobro proveriti
	local position_params   = vim.lsp.util.make_position_params(win, clients[1].offset_encoding or 'utf-16') -- TODO - Dobro proveriti argumente u zagradi
	local novoIme           = ime
	position_params.newName = novoIme
	-- print(vim.inspect(position_params))

	vim.lsp.buf_request(0, "textDocument/rename", position_params, LSPRenameHandler)
end
-- -----------------------------------------------------------------------------
function LSPRenamePoziv()
	vim.lsp.buf.document_highlight()
	local staro_ime = vim.fn.expand("<cword>")

	vim.ui.input({
			prompt  = "Novo ime: ",
			default = staro_ime
		},
		function(input)
			-- print(string.format("Input=%s", input))
			if input ~= nil and input ~= "" and staro_ime ~= input then
				LSPRename(input)
				vim.notify(" Novo ime: " .. input, "info", { title = "[LSP rename]" })
				-- vim.notify(input)
			else
				vim.notify(" LSP rename otkazan ....", "warn", { title = "INFO" })
				-- print("Rename otkazan ....")
				-- vim.lsp.buf.clear_references()
			end
		end
	)

	vim.lsp.buf.clear_references()
end
-- -----------------------------------------------------------------------------
-- END OF LSP RENAME
-- -----------------------------------------------------------------------------
-- QUICK FIX RENAME ....
-- -----------------------------------------------------------------------------
function pronalazenjeUDatoteci(input)
	local cur = vim.fn.getpos(".")
	local p   = vim.fn.search(input)
	vim.fn.setpos(".", cur)
	return p ~= 0
end
-- -----------------------------------------------------------------------------
function renameQuickFix()
	-- TODO: zašto ne radi document_highlight?!
	vim.lsp.buf.document_highlight()
	-- print("Biće nešto od ovoga! :)")
	local ime = vim.fn.expand("<cword>")
	-- vim.notify(ime)

	vim.ui.input({
			prompt  = "Novo ime: ",
			default = ime -- vim.fn.expand("<cword>")
		},
		function(input)
			if pronalazenjeUDatoteci(input) then
				vim.notify("GREŠKA - Identifikator već postoji!", "warn", { title = "[Grep rename]"})
				-- return
			-- end

			elseif input ~= nil and input ~= "" and ime ~= input then
				-- vim.lsp.buf.references()
				local cur = vim.fn.getpos(".")
				vim.cmd("silent grep " .. ime)
				vim.notify(" Novo ime: " .. input, "info", { title = "[Grep rename]" })
				vim.cmd("silent cdo s/\\<" .. ime .. "\\>/" .. input .. "/e")
				vim.fn.setpos(".", cur)
				vim.lsp.buf.references()
				-- vim.cmd("cdo update")
			else
				vim.notify(" Grep rename otkazan ....", "warn", { title = "INFO" })
			end
		end
	)

	vim.lsp.buf.clear_references()
end
-- -----------------------------------------------------------------------------
-- END OF QUICK FIX RENAME
-- -----------------------------------------------------------------------------
function prebrojavanjeBafera()
	local baferi = vim.fn.getbufinfo()
	local n = 0

	for _,bafer in ipairs(baferi) do
		if bafer.listed > 0 and bafer.name ~= "" then
			n = n + 1
		end
	end

	return n
end
-- -----
function prebrojavanjeElemenataTabele(t)
	local n = 0

	for _, v in pairs(t) do
		n = n + 1
	end

	return n
end
-- -----
function izlistavanjeProzora()
	local prozori = vim.fn.getwininfo()
	local n_win   = prebrojavanjeElemenataTabele(prozori)
	local buf     = vim.api.nvim_get_current_buf()
	local n_curr  = 0
	local t = { }
	-- local n_w = vim.fn.winnr("$")     -- broj prozora

	for _,prozor in ipairs(prozori) do
		if prozor.bufnr == buf then
			n_curr = n_curr + 1
		end
		-- print(prozor.bufnr)
		t[prozor.bufnr] = 1 -- može (skoro) bilo šta umesto 1
	end

	local n_buf = prebrojavanjeBafera()
	print("#win: " .. n_win .. " #buf: " .. n_buf .. " #curr: " .. n_curr)
	-- return {
	-- 	n_win = n_win,
	-- 	n_buf = n_buf,
	-- 	n_curr = n_curr
	-- }
	return { n_win, n_buf, n_curr }
end
-- --------------------
function boljiQuit()
	local n_win, n_buf, n_curr = unpack(izlistavanjeProzora())

	if n_buf > 1 then
		if n_curr > 1 then
			vim.cmd("q")
		else
			-- vim.cmd("set bufhidden=delete | bprevious")
			-- vim.cmd("bp|bd#")
			vim.cmd("bprevious|bdelete#")
		end
	else
		if n_win > 1 then
			vim.cmd("q")
		else
			vim.cmd("bd")
		end
	end
end
-- -----------------------------------------------------------------------------
-- Cowsay za Alpha
-- -----------------------------------------------------------------------------
function cowsay_padding(s, w)
	local t = ""
	local i = 1
	local d = w - #s
	--
	while i <= d do
		t = t .. " "
		i = i + 1
	end
	--
	return s .. t
end
-- -----------------------------------------------------------------------------
function cowsay_correct_line(s, width)
	local corr = 0
	local last = false
	local left = #s
	--
	if #s < width then
		last = true
	else
		local c = s:sub(left, left)
		while c ~= " " do
			left = left - 1
			corr = corr + 1
			c = s:sub(left, left)
		end
		--
		s    = s:sub(1, left - 1)
		left = left
	end
	--
	s = cowsay_padding(s, width)
	--
	return {
		line = s,
		corr = corr,
		last = last
	}
end
-- -----------------------------------------------------------------------------
function cowsay_format_lines(s)
	local lines = { }
	local width = 56
	local char  = "│"
	local l     = 1
	local r     = width + 1
	--
	if r > #s then
		r = #s
	end
	--
	while l <= #s do
		local t   = s:sub(l, r)
		local res = cowsay_correct_line(t, width)
		t = res.line
		t = char .. " " .. t .. " " .. char
		table.insert(lines, t)
		--
		if res.last == false then
			l = r - res.corr + 1
		else
			l = #s + 1
		end
		--
		r = l + width
		--
		if r > #s then
			r = #s
		end
	end
	--
	return lines
end
-- -----------------------------------------------------------------------------
function cowsay_merge_quote_lines(lines, quote_lines, i)
	for _,line in ipairs(quote_lines) do
		-- print(vim.inspect(line))
		table.insert(lines, i, line)
		i = i + 1
	end
	--
	return i
end
-- -----------------------------------------------------------------------------
function cowsay_get_index(t)
	math.randomseed(os.clock())
	return math.random(1, #t)
end
-- -----------------------------------------------------------------------------
function CowSay()
	local i = 2
	local lines = {
		"╭──────────────────────────────────────────────────────────╮",
		"╰──────────────────────────────────────────────────────────╯",
        "   o                                                        ",
        "    o   ^__^                                                ",
        "     o  (oo)\\_______                                       ",
        "        (__)\\       )\\/\\                                 ",
        "            ||----w |                                       ",
        "            ||     ||                                       ",
	}
	--
	local quotes      = require("cowsay").quotes
	local index       = cowsay_get_index(quotes)
	local quote       = quotes[index][1]
	local author      = quotes[index][2]
	local quote_lines = cowsay_format_lines(quote)
	local author_lines
	if author == "" then
		author_lines = { }
	else
		author_lines = cowsay_format_lines("- " .. author)
	end
	--
	i = cowsay_merge_quote_lines(lines, quote_lines, i)
	i = cowsay_merge_quote_lines(lines, author_lines, i)
	--
	return lines
end
-- -----------------------------------------------------------------------------
function AlphaQuit()
	local n = #vim.fn.filter(vim.fn.range(vim.fn.bufnr("$")), 'buflisted(v:val)') - vim.fn.buflisted(0)
	if n > 0 then -- more than one window?
		vim.cmd("Alpha")
	else
		vim.cmd("q")
	end
end
-- -----------------------------------------------------------------------------
