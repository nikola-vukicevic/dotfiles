--------------------------------------------------------------------------------
-- Setup nvim-cmp.
local cmp     = require'cmp'
local lspkind = require'lspkind'
--------------------------------------------------------------------------------
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
--------------------------------------------------------------------------------
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require("nvim-autopairs").setup()
-- ---------------------------
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)
--------------------------------------------------------------------------------
cmp.setup({
	completion = {
		autocomplete = false,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end
	},
	experimental = {
		native_menu = false,
		ghost_text  = {
			hl_group = 'CMPGhostText',
		},
	},
	window = {
		-- completion    = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format   = lspkind.cmp_format({
			mode     = "symbol_text",
			maxwidth = 25,
			menu     = ({
				buffer        = "[Buf]",
				nvim_lsp      = "[LSP]",
				luasnip       = "[Snip]",
				nvim_lua      = "[API]",
				calc          = "[Calc]",
				latex_symbols = "[Latex]",
			})
		}),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(),
		-- ----------------------------------
		['<C-j>'] = cmp.mapping.select_next_item(),
		-- ----------------------------------
		-- ['<Esc>'] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		if not cmp.get_selected_entry() then
		-- 			cmp.close()
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	else
		-- 		fallback()
		-- 	end
		-- end),
		-- ----------------------------------
		['<CR>'] = cmp.mapping.confirm({
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
			elseif cmp.visible() and has_words_before() then
				print("CMP [Tab]: sledeća stavka u meniju")
				cmp.select_next_item()
			else
				print("CMP [Tab]: Tab fallback")
				fallback()
			end
		end, { "i", "s" }),
		-- ----------------------------------
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				print("CMP [Tab]: prethodna stavka u meniju")
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				print("CMP [Tab]: S-Tab fallback")
				fallback()
			end
		end, { "i", "s" }),
		-- ----------------------------------
	}),
	sources = cmp.config.sources({
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'nvim_lua' }, -- Kanda neodev.vim
		                          -- radi sve što treba
		{ name = 'path' },
		{ name = 'calc' },
		{ name = 'nvim_lsp' },
		{
			name           = 'buffer',
			keyword_length = 3,
		},
		{ name = 'nvim_lsp_signature_help' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	},
	{
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	-- completion = { autocomplete = true },
	mapping    = cmp.mapping.preset.cmdline({
		['<Down>'] = { c = cmp.mapping.select_next_item( { behavior = cmp.SelectBehavior.Insert } ) },
        ['<Up>'  ] = { c = cmp.mapping.select_prev_item( { behavior = cmp.SelectBehavior.Insert } ) },
		['<ESC>' ] = cmp.mapping.abort(),
	}),
	sources    = {
		{ name = 'buffer'   },
		{ name = 'cmdline'  },
		{ name = 'nvim.lsp' },
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	completion = { autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged } },
	mapping    = cmp.mapping.preset.cmdline({
		['<C-k>'] = { c = cmp.mapping.select_prev_item( { behavior = cmp.SelectBehavior.Insert } ) },
		['<C-j>'] = { c = cmp.mapping.select_next_item( { behavior = cmp.SelectBehavior.Insert } ) },
		-- ['ESC'  ] = { c = cmp.mapping.abort() }
	}),
	sources    = cmp.config.sources({
		{ name = 'path'                    },
		{ name = 'cmdline'                 },
		{ name = 'nvim_lsp'                },
		{ name = 'nvim_lsp_signature_help' },
	},
	{
		name   = 'cmdline',
		option = {
			ignore_cmds = {

			}
		}
	})
})

