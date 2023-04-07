-- -----------------------------------------------------------------------------
luasnip         = require("luasnip")
-- -----------------
local ls_snip   = luasnip.snippet
local ls_ispis  = luasnip.text_node
local ls_func   = luasnip.function_node
local ls_insert = luasnip.insert_node
-- local date     = function() return {os.date('%Y-%m-%d')} end
-- local node     = luasnip.snippet_node
-- local choice   = luasnip.choice_node
-- local dynamicn = luasnip.dynamic_node
-- -----------------------------------------------------------------------------
-- Snipeti
-- -----------------------------------------------------------------------------
luasnip.add_snippets(nil, {
	all = {
		-- ---------------------------------------------------------------------
		-- <span class='kod_u_tekstu'>$kod</span>
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "ssp",
			namr = "<span class='kod_u_tekstu'> ....",
			dscr = "Span sa klasom 'kod_u_tekstu'"
		}, {
			ls_ispis("<span class='kod'>"),
			ls_insert(1, "kod"),
			ls_ispis("</span>"),
			ls_insert(0)
		}),
		-- ---------------------------------------------------------------------
		-- console.log('$ispis')
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "scj",
			namr = "console.log('$ispis')",
			dscr = "console.log sa apostrofima"
		}, {
			ls_ispis("console.log('"),
			ls_insert(1, "ispis"),
			ls_ispis("')"),
			ls_insert(0)
		}),
		-- ---------------------------------------------------------------------
		-- console.log("$ispis")
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "scd",
			namr = "console.log(\"$ispis\")",
			dscr = "console.log sa navodnicima"
		}, {
			ls_ispis("console.log(\""),
			ls_insert(1, "ispis"),
			ls_ispis("\")"),
			ls_insert(0)
		}),
		-- ---------------------------------------------------------------------
		-- console.log(`$ispis`)
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "sct",
			namr = "console.log(`$ispis`)",
			dscr = "console.log sa backtick-ovima"
		}, {
			ls_ispis("console.log(`"),
			ls_insert(1, "ispis"),
			ls_ispis("`)"),
			ls_insert(0)
		}),
		-- ---------------------------------------------------------------------
		-- <aside class='napomena_u_tekstu'> ....
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "san",
			namr = "<aside class='napomena_u_tekstu'> ....",
			dscr = "Tag aside sa klasom 'napomena_u_tekstu'"
		}, {
			ls_ispis({
				"``",
				"<aside class='napomena_u_tekstu'>",
			    "	<p>",
				"		"
			}),
			ls_insert(1, "ispis"),
			ls_ispis({
				"",
				"	</p>",
				"</aside>",
				"~~",
				"",
			}),
			ls_insert(0)
		}),
		-- ---------------------------------------------------------------------
		-- Veliki blok koda unutar figcaption-a
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "skk",
			namr = "Blok koda",
			dscr = "Blok koda za članke"
		}, {
			ls_ispis({
				"``",
				"<figure>",
				"	<pre class='iskljucena_selekcija'>",
				"		<code class='language-text'>",
				""
			}),	
			ls_insert(1, "Kod"),
			ls_ispis({
				"",
				"		</code>",
				"	</pre>",
				"	<figcaption>",
				"		Slika #s#. - Opis slike.",
				"	</figcaption>",
				"</figure>",
				"~~",
				"",
			}),
			-- ls_insert(1, "ispis"),
			-- ls_ispis(""),
			ls_insert(0)
		}),
		-- ---------------------------------------------------------------------
		-- Blok komentar C:
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "skc",
			namr = "Blok komentar C",
			dscr = "Blok komentar C (u tri reda)",
		}, {
			ls_ispis({
				"/* -------------------------------------------------------------------------- */",
				"// ",
			}),
			ls_insert(1, "Komentar"),
			ls_ispis({
				"",
				"/* -------------------------------------------------------------------------- */",
				"",
			}),
			-- ls_insert(1, "ispis"),
			-- ls_ispis(""),
			ls_insert(0),
		}),
		-- ---------------------------------------------------------------------
		-- Blok komentar Python:
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "skp",
			namr = "Blok komentar Python",
			dscr = "Blok komentar Python (u tri reda)",
		}, {
			ls_ispis({
				"# ---------------------------------------------------------------------------- #",
				"# ",
			}),
			ls_insert(1, "Komentar"),
			ls_ispis({
				"",
				"# ---------------------------------------------------------------------------- #",
				"",
			}),
			-- ls_insert(1, "ispis"),
			-- ls_ispis(""),
			ls_insert(0),
		}),
		-- ---------------------------------------------------------------------
		-- Neovim lua config key map:
		-- ---------------------------------------------------------------------
		ls_snip ({
			trig = "vma",
			namr = "Neovim keymap",
			dscr = "Neovim keymap Lua",
		}, {
			ls_ispis({
				"vim.keymap.set(\"\" , \"\" , \"\" , { desc = \"\" , remap = true } )",
			}),
			ls_insert(0),
		}),
		-- ---------------------------------------------------------------------
		-- ---------------------------------------------------------------------
	},
})
-- -----------------------------------------------------------------------------
require("luasnip.loaders.from_vscode").lazy_load()
-- -----------------------------------------------------------------------------

