-- -----------------------------------------------------------------------------
local text_01 = '\n```typescript\nfunction ucitavanjeIzKonzole(obj: DijkstraObj): void\n```\n----------------------------------------------------------------------------\n*@brief*  \nUčitavanje iz _konzole_ je (zapravo) podrazumevani način pokretanja programa\n*@param* `obj` — Glavni "Dijkstra objekat"  \n*@code*  \nfunction perica(a) {\n   console.log(`mjau :)`)\n}'
-- ----------
local text_02 = "### function `reset_strukture_pokusaji`  \n\n---\n→ `void`  \nParameters:  \n- `char * p`\n\n---abc--- \n@brief - Resetujmo strukturu pokušaja ....  \npa kako bude ....  \nAko tako mora, tako i biće!  \n@param p Parametar #1  \n@param m Parametar #2  \n@param j Parametar #3  \n@since 1.0.0  \n\n---\n```cpp\nvoid reset_strukture_pokusaji(char *p)\n```"
-- -----------------------------------------------------------------------------
local f_split  = vim.fn.split
-- -----------------------------------------------------------------------------
function SpajanjeListe(list, delim, indeks)
	local s = ""
		for _,t in ipairs(list) do
			local p = ""
			if t[indeks] == true then p = delim end
			s = s .. p .. t[1]
		end
	return s
end
-- ----------------------------------------------------------------------------
function DaLiJeSpecijalni(token)
	if token:startsWith("\n")   then return true end
	if token:startsWith("#")    then return true end
	if token:startsWith("```")  then return true end
	if token:startsWith("---")  then return true end
	if token:startsWith(" ---") then return true end
	-- if token:startsWith("\\\\---")     then return true end
	-- C/C++:
	if token:startsWith("\\---")        then return true end
	if token:startsWith("- ")           then return true end
	if token:startsWith("→ ")           then return true end
	if token:startsWith("Parameters:")  then return true end
	if token:startsWith("@brief")       then return true end
	if token:startsWith("@param")       then return true end
	if token:startsWith("@constructor") then return true end
	if token:startsWith("@return")      then return true end
	-- JS/TS:
	if token:startsWith("*@brief*")       then return true end
	if token:startsWith("*@param*")       then return true end
	if token:startsWith("*@constructor*") then return true end
	if token:startsWith("*@return*")      then return true end

	return false
end
-- ----------------------------------------------------------------------------
function DaLiPrelaziUNoviRed(specijalni, prethodni_spec, prelazak_sledeci)
	return prelazak_sledeci  == true
	       or specijalni     == true
	       or prethodni_spec == true
end
-- ----------------------------------------------------------------------------
function DaLiAktiviraPrelazakSledeceg(token, specijalni, prelazak_prethodni)
	if specijalni == true then return false end

	if specijalni == false and prelazak_prethodni == true then
		return true
	end

	if token:startsWith("```")     then return true end
	if token:startsWith("*@code*") then return true end

	return false
end
-- ----------------------------------------------------------------------------
function prepravkeC(token)
	local l = vim.fn.split(token, "###")
	if #l < 2 then return token end
	return l[1] .. "\n" .. l[2]:trimStart()
end
-- ----------------------------------------------------------------------------
function ObradaTokena(token, spec_prethodni, novi_red_prethodni, prelazak_prethodni)
	local specijalni       = DaLiJeSpecijalni(token)
	local prelazak_sledeci = DaLiAktiviraPrelazakSledeceg(token, specijalni, prelazak_prethodni)
	local novi_red         = DaLiPrelaziUNoviRed(specijalni, spec_prethodni, prelazak_sledeci)

	if token:startsWith("\\---") then
		token = token:gsub("\\", "" )
	end

	if token:startsWith("---") or token:startsWith(" ---") then
		token = token:gsub("[%-]+ ", "---\n" )
	end

	if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
		token = prepravkeC(token) -- token:gsub(" ###", "\n")
	end

	token = token:trimStart()

	return {
		token;
		specijalni;
		novi_red;
		prelazak_sledeci;
	}
end
-- ----------------------------------------------------------------------------
function ObradaHover(str, delim)
	local list     = f_split(str, delim)
	local list_new = { }

	for _,red in ipairs(list) do
		if red ~= "" then
		-- if red ~= "" and red ~= "\n" then
			local p1 = true  -- specijalni
			local p2 = false -- novi_red
			local p3 = true  -- prelazak

			if list_new[#list_new] ~= nil then
				p1 = list_new[#list_new][2]
				p2 = list_new[#list_new][3]
				p3 = list_new[#list_new][4]
			end

			local t = ObradaTokena(red, p1, p2, p3)
			table.insert(list_new, t)
		end
	end

	return SpajanjeListe(list_new, delim, 3)
end
-- -----------------------------------------------------------------------------
local f_obrada = ObradaHover
-- -----------------------------------------------------------------------------
function string:startsWith(s2)
	return self:sub(1, #s2) == s2

end
-- -----------------------------------------------------------------------------
function string:trimStart()
	local l = 1
	
	while self:sub(l, l) == " " do
		l = l + 1
	end

	return self:sub(l, #self)
end
-- -----------------------------------------------------------------------------
function HoverHandler(err, result, context, config)
	if not result then return end
	-- print("\"Kontekst:\"")
	-- print(vim.inspect(context))
	-- print("\"Rezultat:\"")
	-- print(vim.inspect(result))
	local delim  = "\n"
	-- local G = 1000
	-- local tekst
	-- for i = 1, G, 1 do
	-- 	tekst  = f_obrada(result.contents.value, delim)
	-- end
	local tekst    = f_obrada(result.contents.value, delim)
	local parsed   = require("pretty_hover.parser").parse(tekst)
	local md_tekst = PrepravkaDocHover(parsed.text)

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
-- Vrv može DELETE
-- function probaPrettyHover()
-- 	local parsed = require("pretty_hover.parser").parse(text_02)
--
-- 	vim.lsp.util.open_floating_preview(parsed.text, "markdown", {
-- 		focus = true,
-- 		focusable = true,
-- 		wrap = true,
-- 		wrap_at = 40,
-- 		max_width = 46,
-- 		border = "rounded",
-- 		focus_id = "pretty-hover-example",
-- 	})
-- end
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

