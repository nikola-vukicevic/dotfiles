-- -----------------------------------------------------------------------------
local cmp     = require"cmp"
local lspkind = require"lspkind"
-- -----------------------------------------------------------------------------
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
require("nvim-autopairs").setup()
-- ---------------------------
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done()
)
-- -----------------------------------------------------------------------------
cmp.setup({
	completion = {
		autocomplete = false,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	experimental = {
		-- native_menu = false, -- ostaviti (iako je to meni bez boja i highlightinga)
		ghost_text  = {
			hl_group = "CMPGhostText",
		},
	},
	window = {
		completion = {
			winhighlight = "Normal:CMPWindow,CursorLine:CMPLine"
		},
		-- completion    = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format   = lspkind.cmp_format({
			mode     = "symbol_text",
			maxwidth = 25,
			maxheight = 5,
			menu     = ({
				buffer        = "[Buf]",
				nvim_lsp      = "[LSP]",
				luasnip       = "[Snip]",
				-- nvim_lua      = "[API]",
				calc          = "[Calc]",
				latex_symbols = "[Latex]",
			})
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<M-k>"] = cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Select 
		}),
		-- ----------------------------------
		["<M-j>"] = cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Select 
		}),
		-- ----------------------------------
		["<M-h>"] = cmp.mapping.close(),
		-- ----------------------------------
		["<M-l>"] = cmp.mapping.confirm(),
		-- ----------------------------------
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace ,
			select   = false }
		), -- Accept currently selected item.
		   -- Set `select` to `false` to only
		   -- confirm explicitly selected items.
		-- ----------------------------------
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() and luasnip.expand_or_jumpable() and not cmp.get_selected_entry() then
				print("CMP [Tab]: proširivanje snipeta")
				luasnip.expand_or_jump()
			elseif not cmp.visible() and luasnip.expand_or_jumpable() then
				print("CMP [Tab]: Snipet jump")
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- -- ----------------------------------
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		-- { name = "nvim_lua" }, -- Kanda neodev.vim
		                          -- radi sve što treba
		{
			name = "lazydev",
			group_index = 0,
		},
		{ name = "path" },
		{ name = "calc" },
		{
			name           = "buffer",
			keyword_length = 3,
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
		-- { name = "nvim_lsp_signature_help" },
	})
})
-- -----------------------------------------------------------------------------
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	},
	{
		{ name = "buffer" },
	})
})
-- -----------------------------------------------------------------------------
cmp.setup.cmdline("/", {
	completion = { autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged } },
	mapping    = cmp.mapping.preset.cmdline({
		["<M-j>"] = { c = cmp.mapping.select_next_item( { behavior = cmp.SelectBehavior.Insert } ) },
		["<M-k>"] = { c = cmp.mapping.select_prev_item( { behavior = cmp.SelectBehavior.Insert } ) },
		["<M-l>"] = { c = cmp.mapping.close() }
	}),
	sources    = {
		{ name = "buffer", 	},
		{ name = "cmdline"  },
		{ name = "nvim.lsp" },
	}
})
-- -----------------------------------------------------------------------------
cmp.setup.cmdline(":", {
	completion = { autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged } },
	mapping    = cmp.mapping.preset.cmdline({
		["<M-k>"] = { c = cmp.mapping.select_prev_item( { behavior = cmp.SelectBehavior.Insert } ) },
		["<M-j>"] = { c = cmp.mapping.select_next_item( { behavior = cmp.SelectBehavior.Insert } ) },
		["<M-l>"] = { c = cmp.mapping.close() }
	}),
	sources    = cmp.config.sources({
		{ name = "buffer"                  },
		{ name = "path"                    },
		{ name = "cmdline"                 },
		{ name = "nvim_lsp"                },
		-- { name = "nvim_lsp_signature_help" },
	},
	{
		name   = "cmdline",
		option = {
			ignore_cmds = {

			}
		}
	})
})
-- -----------------------------------------------------------------------------

