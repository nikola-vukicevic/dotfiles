-- -----------------------------------------------------------------------------
local text_01 = '\n```typescript\nfunction ucitavanjeIzKonzole(obj: DijkstraObj): void\n```\n----------------------------------------------------------------------------\n*@brief*  \nUčitavanje iz _konzole_ je (zapravo) podrazumevani način pokretanja programa\n*@param* `obj` — Glavni "Dijkstra objekat"  \n*@code*  \nfunction perica(a) {\n   console.log(`mjau :)`)\n}'
-- ----------
local text_02 = "### function `reset_strukture_pokusaji`  \n\n---\n→ `void`  \nParameters:  \n- `char * p`\n\n---abc--- \n@brief - Resetujmo strukturu pokušaja ....  \npa kako bude ....  \nAko tako mora, tako i biće!  \n@param p Parametar #1  \n@param m Parametar #2  \n@param j Parametar #3  \n@since 1.0.0  \n\n---\n```cpp\nvoid reset_strukture_pokusaji(char *p)\n```"
-- -----------------------------------------------------------------------------
local f_split  = vim.fn.split
-- -----------------------------------------------------------------------------
function SpajanjeListe(list, delim, lsp_hover_novi_red)
	local s = ""

	for _,token in ipairs(list) do
		local p = ""

		if lsp_hover_novi_red or token.zapocinje_novi_red or token.zapocet_u_gornjem_redu then
			p = delim
		end

		if not lsp_hover_novi_red and token.spajanje_sa_gornjim then
			p = p .. " "
		end

		s = s .. p .. token.sadrzaj
	end

	return s
end
-- ----------------------------------------------------------------------------
function DaLiAktiviraPrelaske(token, c_ili_cpp)
	local zapocinje_novi_red    = token.zapocinje_novi_red
	local zapocinje_donji_red   = token.zapocinje_donji_red
	local razdvajanje_od_donjeg = token.razdvajanje_od_donjeg
	local code_context          = token.code_context

	if token.sadrzaj:customStartsWith("\n") then
		zapocinje_novi_red  = true
	end

	if token.sadrzaj:customStartsWith("#") then
		zapocinje_novi_red    = true
		zapocinje_donji_red   = true
		razdvajanje_od_donjeg = true
	end

	if token.sadrzaj:customStartsWith("```") then
		zapocinje_novi_red    = true
		zapocinje_donji_red   = true
		razdvajanje_od_donjeg = true

		if #token.sadrzaj > 4 then
			code_context = true
		else
			code_context = false
		end
	end

	if token.sadrzaj:customStartsWith("---") then
		zapocinje_novi_red  = true
		zapocinje_donji_red = true
	end

	if token.sadrzaj:customStartsWith(" ---") then
		zapocinje_novi_red  = true
		zapocinje_donji_red = true
	end

	-- Da li počinje velikim slovom:
	if string.find(token.sadrzaj, "^%u") then
		zapocinje_novi_red  = true
		-- zapocinje_donji_red = false
	end

	-- Da li počinje cifrom:
	if string.find(token.sadrzaj, "^%d") then
		zapocinje_novi_red  = true
		-- zapocinje_donji_red = false
	end

	-- if token.sadrzaj:customStartsWith("\\\\---")     then return true end

	-- C/C++:
	if c_ili_cpp then
		if token.sadrzaj:customStartsWith("\\---")        then zapocinje_novi_red = true end
		if token.sadrzaj:customStartsWith("- ")           then zapocinje_novi_red = true end
		if token.sadrzaj:customStartsWith("\\- ")         then zapocinje_novi_red = true end
		if token.sadrzaj:customStartsWith("→ ")           then zapocinje_novi_red = true end
		if token.sadrzaj:customStartsWith("Parameters:")  then zapocinje_novi_red = true end
		if token.sadrzaj:customStartsWith("@brief")       then zapocinje_novi_red = true end
		if token.sadrzaj:customStartsWith("@param")       then zapocinje_novi_red = true end
		if token.sadrzaj:customStartsWith("@constructor") then zapocinje_novi_red = true end
		if token.sadrzaj:customStartsWith("@return")      then zapocinje_novi_red = true end
	end

	-- JS/TS:
	if token.sadrzaj:customStartsWith("*@brief*")       then zapocinje_novi_red = true end
	if token.sadrzaj:customStartsWith("*@param*")       then zapocinje_novi_red = true end
	if token.sadrzaj:customStartsWith("*@constructor*") then zapocinje_novi_red = true end
	if token.sadrzaj:customStartsWith("*@return*")      then zapocinje_novi_red = true end

	-- Lua:
	if token.sadrzaj:customStartsWith("@*param*")       then zapocinje_novi_red = true end

	if code_context then
		-- print(token.sadrzaj)
		zapocinje_novi_red = true
	end

	return {
		zapocinje_novi_red    = zapocinje_novi_red,
		zapocinje_donji_red   = zapocinje_donji_red,
		specijalni            = zapocinje_novi_red,
		razdvajanje_od_donjeg = razdvajanje_od_donjeg,
		code_context          = code_context,
		-- code_context_prenos   = code_context_prenos
	}
end
-- ----------------------------------------------------------------------------
function prepravkeC(token)
	local l = vim.fn.split(token.sadrzaj, "###")
	local rez

	if #l < 2 then
		rez = token.sadrzaj
	else
		rez = l[1] .. "\n" .. l[2]--:customTrimStart()
	end

	token.sadrzaj = rez:gsub("\\", "")
	-- return rez:gsub("\\", "")
	-- return rez:gsub("\\_", "_")
end
-- ----------------------------------------------------------------------------
function ObradaTokena(token)
	token.sadrzaj = token.sadrzaj:gsub("\\", "")
	local c_ili_cpp             = vim.bo.filetype == "c" or vim.bo.filetype == "cpp"
	local rez                   = DaLiAktiviraPrelaske(token, c_ili_cpp)

	token.specijalni            = rez.specijalni
	token.zapocinje_novi_red    = rez.zapocinje_novi_red
	token.zapocinje_donji_red   = rez.zapocinje_donji_red
	token.razdvajanje_od_donjeg = rez.razdvajanje_od_donjeg
	token.code_context          = rez.code_context

	if token.specijalni or token.code_context then
		token.spajanje_sa_gornjim = false
	end

	if token.sadrzaj:customStartsWith("\\---") then
		token.sadrzaj = token.sadrzaj:gsub("\\", "" )
	end

	if token.sadrzaj:customStartsWith("---") or token.sadrzaj:customStartsWith(" ---") then
		token.sadrzaj = token.sadrzaj:gsub("[%-]+ ", "---\n" )
	end

	if c_ili_cpp then
		prepravkeC(token) -- token:gsub(" ###", "\n")
		-- token.sadrzaj = prepravkeC(token.sadrzaj) -- token:gsub(" ###", "\n")
	end
end
-- ----------------------------------------------------------------------------
function ObradaHover(str, delim, lsp_hover_novi_red)
	local list     = f_split(str, delim)
	local list_new = { }

	for _,red in ipairs(list) do
		if red ~= "" then
			local token = {
				specijalni             = false,
				zapocinje_novi_red     = false,
				zapocinje_donji_red    = false,
				zapocet_u_gornjem_redu = false,
				spajanje_sa_gornjim    = true,
				razdvajanje_od_donjeg  = false,
				code_context           = false,
				sadrzaj                = red --:trimStart()
			}

			if list_new[#list_new] ~= nil then
				token.zapocet_u_gornjem_redu = list_new[#list_new].zapocinje_donji_red
				token.zapocinje_novi_red     = token.zapocet_u_gornjem_redu
				token.spajanje_sa_gornjim    = token.spajanje_sa_gornjim and not list_new[#list_new].razdvajanje_od_donjeg
				token.code_context           = list_new[#list_new].code_context
			end

			ObradaTokena(token)
			table.insert(list_new, token)
		end
	end

	return SpajanjeListe(list_new, delim, lsp_hover_novi_red)
end
-- -----------------------------------------------------------------------------
local f_obrada = ObradaHover
-- -----------------------------------------------------------------------------
function string:startsWith(s2)
	return self:sub(1, #s2) == s2
end
-- -----------------------------------------------------------------------------
function string:customStartsWith(s2)
	local i = 1

	-- Zanemarivanje whitespace-ova na početku
	-- TODO match ^[ \t]
	while self:sub(i, i) == " " or self:sub(i, i) == "\t" do
		i = i + 1
	end

	return self:sub(i, i + #s2 - 1) == s2 -- TODO: proveriti taj "-1"

end
-- -----------------------------------------------------------------------------
function string:customTrimStart()
	local l = 1
	
	while self:sub(l, l) == " " or self:sub(l, l) == "\t" do
		l = l + 1
	end

	return self:sub(l, #self)
end
-- -----------------------------------------------------------------------------
function LogToFile(sadrzaj, putanja)
	local datoteka = io.open(putanja, "w")

	if datoteka then
		datoteka:write(sadrzaj)
		datoteka:close()
	else
		print("Datoteka" .. putanja .. "nije uspešno otvorena za upis!")
	end
end
-- -----------------------------------------------------------------------------
function HoverHandler(err, result, context, config)
	if not result then return end

	local delim  = "\n"

	local tekst    = f_obrada(result.contents.value, delim, vim.g.lsp_hover_novi_red)
	-- InspectTable(tekst)
	local parsed   = require("pretty_hover.parser").parse(tekst)
	-- InspectTable(parsed)
	local md_tekst = PrepravkaDocHover(parsed.text)
	-- InspectTable(md_tekst)
	-- LogToFile(result.contents.value, "/home/korisnik/lua_log_1")
	-- LogToFile(tekst,                 "/home/korisnik/lua_log_2")

	vim.lsp.util.open_floating_preview(md_tekst, "markdown", {
		focus     = true;
		focusable = true;
		wrap      = true;
		wrap_at   = 60;
		max_width = 64;
		border    = "rounded";
		focus_id  = "pretty-hover";
	})
end
-- --------------------
function HoverHandlerDebug(err, result, context, config)
	if not result then return end
	local delim    = "\n"
	local tekst    = f_obrada(result.contents.value, delim)
	local parsed   = require("pretty_hover.parser").parse(tekst)
	local md_tekst = PrepravkaDocHover(parsed.text)

	probaObrada(result.contents.value)
	probaObrada(tekst)

	vim.lsp.util.open_floating_preview(md_tekst, "markdown", {
		focus     = true;
		focusable = true;
		wrap      = true;
		wrap_at   = 60;
		max_width = 64;
		border    = "rounded";
		focus_id  = "pretty-hover";
	})
end
-- --------------------
function LSPHover()
	local clients = vim.lsp.get_clients({ bufnr = buf })
	local position_params = vim.lsp.util.make_position_params(win, clients[1].offset_encoding or "UTF-16") -- TODO - Dobro proveriti argumente u zagradi
	-- print("Parametri za slanje zahteva:")
	-- print(vim.inspect(position_params))
	-- print("Sledi odgovor ....")
	vim.lsp.buf_request(0, "textDocument/hover", position_params, HoverHandler)
end
-- -----------------------------------------------------------------------------
function LSPHoverDebug()
	local clients = vim.lsp.get_clients({ bufnr = buf })
	local position_params = vim.lsp.util.make_position_params(win, clients[1].offset_encoding or "UTF-16") -- TODO - Dobro proveriti argumente u zagradi
	-- print("Parametri za slanje zahteva:")
	-- print(vim.inspect(position_params))
	-- print("Sledi odgovor ....")
	vim.lsp.buf_request(0, "textDocument/hover", position_params, HoverHandlerDebug)
end
-- -----------------------------------------------------------------------------
function IspisTokena(lista, s1, s2)
	local str = ""
	for i, t in ipairs(lista) do
		print(s1 .. str .. t .. s2)
		-- str = str .. t .. s1
	end
	-- print(str)
end
-- -----------------------------------------------------------------------------
function probaObrada(s_01)
	-- local s_01 = '\n```typescript\nfunction ucitavanjeIzKonzole(obj: DijkstraObj): void\n```\n----------------------------------------------------------------------------\n\n*@brief*  \nUčitavanje iz _konzole_ je (zapravo) podrazumevani\nnačin pokretanja programa  \n\n*@param* `obj` — Glavni "Dijkstra objekat"  \n\n*@code*  \nfunction perica(a) {\n   console.log(`mjau :)`)\n}'
	-- local s = "Pera#i#Mika"
	local d = "\n"
	local l = f_split(s_01, d)
	-- print(vim.inspect(l))
	IspisTokena(l, ">>>", "")
	vim.cmd("new")
	vim.cmd("put=execute('messages')")
end
-- -----------------------------------------------------------------------------

