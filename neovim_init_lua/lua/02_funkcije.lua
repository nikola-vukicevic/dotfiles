-- -----------------------------------------------------------------------------
-- print("[" .. k1[2] .. ", " .. k1[3] .. "]")
-- -----------------------------------------------------------------------------
function PronalazenjeImenaFunkcije()
	local ts_util = require('nvim-treesitter.ts_utils')
	local node = ts_util.get_node_at_cursor()
	print(node)
end
-- -----------------------------------------------------------------------------
function PressI()
	vim.cmd.startinsert()
end
-- -----------------------------------------------------------------------------
function UnpressI()
	vim.cmd.stopinsert()
end
-- -----------------------------------------------------------------------------
function InspectTable(table)
	print(vim.inspect(table))
end
-- -----------------------------------------------------------------------------
function SpelovanjeToggle()
	if vim.g.spell_check == false then
		vim.g.spell_check = true
		-- vim.cmd("set spelllang=sr_RS")
		vim.cmd("set spell")
		-- vim.cmd("set syntax=OFF")
		vim.notify("Spell checker uključen [" .. vim.g.jezik .. "]", "info", { title = "Spell check" })
	else
		vim.g.spell_check = false
		vim.cmd("set nospell")
		-- vim.cmd("set syntax=ON")
		vim.notify("Spell checker isključen", "info", { title = "Spell check" })
	end
end
-- -----------------------------------------------------------------------------
function JezikToggle()
	if vim.g.jezik == "SR" then
		vim.cmd("set spelllang=en")
		vim.g.jezik="EN"
		vim.notify("Jezik za proveru pravopisa: EN", "info", { title = "Izbor jezika" })
	elseif vim.g.jezik == "EN" then
		vim.cmd("set spelllang=sr")
		vim.g.jezik="SR"
		vim.notify("Jezik za proveru pravopisa: SR", "info", { title = "Izbor jezika" })
	end
end
-- -----------------------------------------------------------------------------
function AutoLSPFloatToggle()
	if vim.g.auto_lsp_float == true then
		vim.g.auto_lsp_float = false
		vim.notify("Isključeno automatsko prikazivanje LSP hintova")
	else
		vim.g.auto_lsp_float = true
		vim.notify("Uključeno automatsko prikazivanje LSP hintova")
	end
end
-- -----------------------------------------------------------------------------
function AutoLSPHoverToggle()
	if vim.g.auto_lsp_hover == true then
		vim.g.auto_lsp_hover = false
		vim.notify("Isključeno automatsko prikazivanje LSP hovera")
	else
		vim.g.auto_lsp_hover = true
		vim.notify("Uključeno automatsko prikazivanje LSP hovera")
	end
end
-- -----------------------------------------------------------------------------
function FormatiranjeClang()
	local command         = "clang-format -style=file:"
	local config_file_c   = "/home/korisnik/.config/clangd/clang_format_c"
	local config_file_cpp = "/home/korisnik/.config/clangd/clang_format_cpp"
	-- local red    = vim.fn.line(".")
	-- local kolona = vim.fn.col(".")
	if vim.bo.filetype == "c" then
		vim.cmd("'<,'>!" .. command .. config_file_c)
	elseif vim.bo.filetype == "cpp" then
		vim.cmd("'<,'>!" .. command .. config_file_cpp)
	end
	-- vim.api.nvim_win_set_cursor( 0, { red, kolona - 1} )
end
-- -----------------------------------------------------------------------------
function FormatiranjePython()
	local command     = "ruff format --config "
	local config_file = "/home/korisnik/sajtovi/.ruff.toml"
	vim.cmd("'<,'>!" .. command .. config_file .. " -")
end
-- -----------------------------------------------------------------------------
function FormatiranjeTsJsStari()
	local command     = "prettier --parser typescript --config "
	local config_file = "/home/korisnik/sajtovi/.prettierrc"
	vim.cmd("'<,'>!" .. command .. config_file)
end
-- -----------------------------------------------------------------------------
function FormatiranjeTsJs()
	local command     = "deno fmt - --config "
	local config_file = "/home/korisnik/sajtovi/deno.json"
	vim.cmd("'<,'>!" .. command .. config_file)
end
-- -----------------------------------------------------------------------------
function FormatiranjeJson()
	local command     = "deno fmt - --ext json --config "
	local config_file = "/home/korisnik/sajtovi/deno.json"
	vim.cmd("'<,'>!" .. command .. config_file)
end
-- -----------------------------------------------------------------------------
function FormatiranjeYaml()
	local command     = "deno fmt - --ext yaml --config "
	local config_file = "/home/korisnik/sajtovi/deno_yaml.json"
	vim.cmd("'<,'>!" .. command .. config_file)
end
-- -----------------------------------------------------------------------------
function FormatiranjeCss()
	local command     = "deno fmt - --ext css --config "
	local config_file = "/home/korisnik/sajtovi/deno.json"
	vim.cmd("'<,'>!" .. command .. config_file)
end
-- -----------------------------------------------------------------------------
function FormatiranjeZig()
	local command     = ""
	local config_file = ""
	vim.cmd("'<,'>! zig fmt --stdin")
end
-- -----------------------------------------------------------------------------
function FormatiranjeIzvornogKoda(mode)
	if mode == "n" then
		vim.notify("Tekst mora biti selektovan!")
		return
	end

	if mode ~= "v" then return end

	local tip = vim.bo.filetype

	if tip == "c" or tip == "cpp" then
		FormatiranjeClang()
	elseif tip == "javascript" or tip == "typescript" then
		FormatiranjeTsJs()
	elseif tip == "json" then
		FormatiranjeJson()
	elseif tip == "yaml" then
		FormatiranjeYaml()
	elseif tip == "css" then
		FormatiranjeCss()
	elseif tip == "python" then
		FormatiranjePython()
	elseif tip == "zig" then
		FormatiranjeZig()
	end
end
-- -----------------------------------------------------------------------------
function ToggleDiffMode()
	if vim.g.diff_mode == true then
		vim.g.diff_mode = false
		vim.cmd("diffoff")
		vim.notify("Diff režim isključen")
	else
		vim.g.diff_mode = true
		vim.cmd("windo diffthis")
		vim.notify("Diff režim aktiviran")
	end
end
-- -----------------------------------------------------------------------------
function UklanjanjeNepotrebnihWhitespaceova()
	local cursor_pos = vim.fn.getpos(".")
	vim.cmd [[%s/\s\+$//e]]
	vim.cmd [[%s/\n\{2,}\%$/\r/e]]
	vim.fn.setpos(".", cursor_pos)
	vim.notify("Uklonjen višak whitespace znakova sa krajeva redova.")
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
function DaLiJeBaferQF()
	return vim.bo.filetype == 'qf'
end
-- -----------------------------------------------------------------------------
function PomeranjeLinijeNaDole()
	-- if DaLiJeBaferQF() then
	-- 	vim.cmd("cnext")
	-- 	return
	-- end
	local r = vim.fn.getcursorcharpos(".")[2]
	if r < vim.api.nvim_buf_line_count(0) then
		vim.cmd(":m .+1<cr>")
	end
end
-- -----------------------------------------------------------------------------
function PomeranjeLinijeNaGore()
	-- if DaLiJeBaferQF() then
	-- 	vim.cmd("cprev")
	-- 	return
	-- end
	local r = vim.fn.getcursorcharpos(".")[2]
	if r > 1 then
		vim.cmd(":m .-2<cr>")
	end
end
-- -----------------------------------------------------------------------------
function PronalazenjeNaslova()
	vim.cmd("vimgrep /^#\\{1,6} \\k/ %")
	-- require('telescope.builtin').quickfix()
	vim.cmd("botright copen")
	-- Snacks.picker.qflist()
end
-- -----------------------------------------------------------------------------
-- UokviravanjeSelekcije:
-- -----------------------------------------------------------------------------
function DaLiJeASCII(char)
	-- print("ASCII provera: '" .. c .. "'")
	return string.byte(char) <= 127
end
-- -----------------------------------------------------------------------------
function DaLiJeVelikoSlovo(char)
	return char == string.upper(char)
end
-- ----------------------------------------------------------------------------
function DaLiJeCifra(char)
	return string.byte(char) >= '0' and string.byte(char) <= '9'
end
-- ----------------------------------------------------------------------------
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
	local p1 = string.sub(s, 0, string.find(s, "%%s") - 1)
	-- local p1 = string.sub(s, string.find(s, " ") + 1, string.find(s, "%%s<") - 1)
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
function PodesavanjeUiSelectProzora(tip, sirina, visina)
	require("telescope").setup({
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({
					layout_strategy = tip,
					layout_config   = {
						width  = sirina,
						height = visina,
					}
				})
			}
		}
	})

	require("telescope").load_extension("ui-select")
end
-- -----------------------------------------------------------------------------
-- Quick buffer switcher:
-- -----------------------------------------------------------------------------
function PronalazenjeOtvorenihBafera()
	return vim.tbl_filter(function(bufnr)
		return vim.api.nvim_buf_get_option(bufnr, "buflisted")
	end, vim.api.nvim_list_bufs())
end
--
function DaLiJeTrenutni(bufnr)
	local bufnr_trenutni = vim.fn.bufnr('%')
	return bufnr_trenutni == bufnr
end
--
function DaLiJePrethodni(bufnr)
	local bufnr_prethodni = vim.fn.bufnr('#')
	return bufnr_prethodni == bufnr
end
--
function PronalazenjeImenaPoBufNumberu(bufnr)
	local path = vim.api.nvim_buf_get_name(bufnr)
	local cwd  = vim.loop.cwd()
	local name = string.gsub(path, cwd, "")

	return name
end
--
function UredjivanjeListeOtvorenihBafera(lista_obj)
	local konacna_lista = { }

	if lista_obj.trenutni ~= "" then
		table.insert(konacna_lista, lista_obj.trenutni)
	end

	if lista_obj.prethodni ~= "" then
		table.insert(konacna_lista, lista_obj.prethodni)
	end

	for _, ime_datoteke in ipairs(lista_obj.nova_lista) do
		table.insert(konacna_lista, ime_datoteke)
	end

	return konacna_lista
end
--
function PopunjavanjeListeOtvorenihBafera()
	lista_bafera = PronalazenjeOtvorenihBafera()
	lista_imena  = {
		trenutni   = "",
		prethodni  = "",
		najsiri    = 0,
		nova_lista = { }
	}
	
	-- TODO: Da li pisati "skroz efikasno" grananje?
	for _, bufnr in ipairs(lista_bafera) do
		local ime_datoteke = PronalazenjeImenaPoBufNumberu(bufnr)

		if vim.api.nvim_buf_get_option(bufnr, "modified") then
			ime_datoteke = ime_datoteke .. " [+]"
		end

		local d = #ime_datoteke
		if #ime_datoteke > lista_imena.najsiri then lista_imena.najsiri = d end

		if DaLiJeTrenutni(bufnr) then
			lista_imena.trenutni = ime_datoteke
		elseif DaLiJePrethodni(bufnr) then
			lista_imena.prethodni = ime_datoteke
		else
			table.insert(lista_imena.nova_lista, ime_datoteke)
		end
	end

	local konacna_lista = UredjivanjeListeOtvorenihBafera(lista_imena)
	local sirina = lista_imena.najsiri + 8
	local visina = #konacna_lista + 4
	-- Korekcije:
	sirina = math.min(sirina, 80) -- najveća širina:  80
	sirina = math.max(sirina, 32) -- najmanja širina: 32
	visina = math.min(visina, 24) -- najveća visina:  20 redova sa nazivima
	visina = math.max(visina, 7)  -- najmanja visina: 3 reda sa nazivima

	return {
		lista         = konacna_lista,
		sirina        = sirina,
		visina        = visina,
		broj_datoteka = #konacna_lista
	}
end
--
-- TODO
function prepravkaBufferListItem(item)
	if string.sub(item, -1) == "]" then
		item = string.sub(item, 0, -4)
	end
	return item
end
--
function SimpleBufferSwitcher()
	local bafer_info = PopunjavanjeListeOtvorenihBafera()
	-- print(vim.inspect(bafer_info))
	if bafer_info.broj_datoteka == 0 then
		vim.notify("Nema otvorenih datoteka.", "info", { title = "Buffer switcher"} )
		return
	end

	if bafer_info.broj_datoteka == 1 then
		vim.notify("Jedina otvorena datoteka je već prikazana.", "info", { title = "Buffer switcher"} )
		return
	end

	PodesavanjeUiSelectProzora("center", bafer_info.sirina, bafer_info.visina)
	-- +8 je padding sa desne strane (2 brordera + prompt + spejs 
	-- + pravi padding)
	-- +4 je dodatni "broj redova" u koje se ubrajaju
	-- 3 bordera i 1 ulazno polje.

	vim.ui.select(
		bafer_info.lista ,
		-- lista_imena ,
		{
			prompt = "Buffer switcher"
		} ,
		function(choice)
			if choice == nil then return end
			local ime_datoteke = prepravkaBufferListItem(choice)
			vim.cmd(":buffer " .. ime_datoteke)
		end
	)
end
--
function PronalazenjeKursoraUJumplisti(bufnr)
	local jumplist = vim.fn.getjumplist()[1]

	for i = #jumplist, 1, -1 do
		if jumplist[i].bufnr == bufnr then
			return {
				lnum = jumplist[i].lnum,
				col  = jumplist[i].col
			}
		end
	end

	return {
		lnum = 0,
		col  = 0
	}
end
--
function PripremaQfItemaZaBafer(datoteka)
	local bufnr    = vim.fn.bufnr(datoteka)
	-- local lnum     = -1
	-- local col      = -1

	local kursor = PronalazenjeKursoraUJumplisti()

	return {
		bufnr = bufnr,
		lnum  = kursor.lnum,
		col   = kursor.col,
		text  = "",
	}
end
--
function QfBufferSwitcher()
	local bafer_info = PopunjavanjeListeOtvorenihBafera()
	-- print(vim.inspect(bafer_info))
	if bafer_info.broj_datoteka == 0 then
		vim.notify("Nema otvorenih datoteka.", "info", { title = "Buffer switcher"} )
		return
	end

	if bafer_info.broj_datoteka == 1 then
		vim.notify("Jedina otvorena datoteka je već prikazana.", "info", { title = "Buffer switcher"} )
		return
	end

	local qflista = { }

	for _,datoteka in ipairs(bafer_info.lista) do
		local qfitem = PripremaQfItemaZaBafer(datoteka)
		table.insert(qflista, qfitem)
		-- InspectTable(qfitem)
	end

	vim.fn.setqflist(qflista, "r")
	vim.cmd("copen")	
end
-- -----------------------------------------------------------------------------
-- Funkcija koja se poziva direktno iz programa
-- Na ovom mestu biće definisana lista tagova (neće biti prevelika)
-- Radna funkcija (definisana iznad) je callback funkcija funkcije
-- select (iz Neovim-ovog API-ja)

function UokviravanjeSelekcije(mode)
	-- print(string.format("mode: %s", mode))
	PodesavanjeUiSelectProzora("cursor", 47, 9)

	vim.ui.select(
		{
			"<code class='kod_u_tekstu'>%s</code>" ,
			"<%s>" ,
			"<em>%s</em>",
			"<strong>%s</strong>",
			"<a href=''>%s</a>",
			-- "1. <code class='kod_u_tekstu'>%s</code>" ,
			-- "2. <%s>" ,
			-- "3. <em>%s</em>",
			-- "4. <strong>%s</strong>",
			-- "5. <a href=''>%s</a>",
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
function GetLspReferences()
	vim.lsp.buf.references(
		nil, 
		{
			on_list = function(options)
				-- InspectTable(options)
				vim.fn.setqflist(options.items, "r")
				require("telescope.builtin").quickfix({ prompt_title = "LSP references" })
			end
		}
	)
end
--
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
	-- vim.cmd("botright copen")
	-- Snacks.picker.qflist()
	require('telescope.builtin').quickfix({ prompt_title = "Rename (LSP references)" })
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
-- DAP STUFF:
-- -----------------------------------------------------------------------------
function ToggleDapUi()
	require("dapui").toggle()
end
-- -----------------------------------------------------------------------------
-- Bolji quit:
-- -----------------------------------------------------------------------------
function prebrojavanjeProzoraIBafera()
	local lista_prozora = vim.api.nvim_list_wins()
	local lista_bafera  = { }

	for _,winnr in ipairs(lista_prozora) do
		local bufnr  = vim.api.nvim_win_get_buf(winnr)
		local indeks = "buf_" .. bufnr

		if not lista_bafera[indeks] then
			lista_bafera[indeks] = { }
		end

		table.insert(lista_bafera[indeks], winnr)
	end

	return lista_bafera
end
--
-- function fancyPrebrojavanjeZaTabelu(tabela)
-- 	local prebrojavanje = 0
--
-- 	for _ in pairs(tabela) do
-- 		prebrojavanje = prebrojavanje + 1
-- 	end
--
-- 	return prebrojavanje
-- end
--
function boljiQuit()
	local lista_bafera = prebrojavanjeProzoraIBafera()
	local indeks       = "buf_" .. vim.api.nvim_buf_get_number(0)
	-- local broj_bafera  = fancyPrebrojavanjeZaTabelu(lista_bafera)

	-- InspectTable(lista_bafera)
	-- print(broj_bafera)
	-- print(#lista_bafera[indeks])

	if #lista_bafera[indeks] < 2 then
		vim.cmd("bd")
	else
		vim.cmd("q")
	end
end
-- -----------------------------------------------------------------------------
-- Session management (DIY):
-- -----------------------------------------------------------------------------
function GenerisanjeSessionImenaZaCwd()
	local cwd_ime = string.gsub(vim.loop.cwd(), "/", '____')
	-- print("cwd_ime: " .. cwd_ime)
	return cwd_ime
end
--
function LoadSession(dir)
	local putanja     = "/home/korisnik/.local/state/nvim/sessions/"
	local last_ime    = "last.vim"
	local cwd_ime     = "nepostojeca_datoteka.vim"
	local info_poruka = ""

	if dir == "last" then
		cwd_ime     = last_ime
		info_poruka = "Učitan poslednji session."
	elseif dir == "cwd" then
		cwd_ime     = GenerisanjeSessionImenaZaCwd() .. ".vim"
		info_poruka = "Učitan session za cwd:\n" .. vim.loop.cwd()
	end

	putanja = putanja .. cwd_ime

	if not vim.loop.fs_stat(putanja) then
		if dir == "last" then
			info_poruka = "Ne postoji 'poslednji' sačuvani session!"
		else
			info_poruka = "Ne postoji sačuvan session za trenutni cwd!"
		end
		vim.notify(info_poruka, "info", { title = "Info" } )

		return
	end

	vim.cmd.source(putanja)
	vim.notify(info_poruka, "info", { title = "Info" } )
end
--
function SaveSession()
	local lista_bafera = PronalazenjeOtvorenihBafera()
	-- print(vim.inspect(lista_bafera))

	if #lista_bafera < 1 then
		-- print("Doviđorno!")
		return
	end

	local putanja  = "/home/korisnik/.local/state/nvim/sessions/"
	local last_ime = "last.vim"
	local cwd_ime  = GenerisanjeSessionImenaZaCwd() .. ".vim"

	vim.cmd("mksession! " .. putanja .. cwd_ime)
	vim.cmd("mksession! " .. putanja .. last_ime)
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

