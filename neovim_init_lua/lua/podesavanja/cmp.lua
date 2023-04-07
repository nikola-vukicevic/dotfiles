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
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
--------------------------------------------------------------------------------
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body)     -- For `vsnip` users.
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format   = lspkind.cmp_format({
			mode     = "symbol_text",
			maxwidth = 25,
			menu = ({
				buffer        = "[Buffer]",
				nvim_lsp      = "[LSP]",
				luasnip       = "[LuaSnip]",
				nvim_lua      = "[Lua]",
				latex_symbols = "[Latex]",
			})
		}),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>']   = cmp.mapping.scroll_docs(-4),
		['<C-f>']   = cmp.mapping.scroll_docs(4),
		['<Left>']  = cmp.mapping.scroll_docs(-1),
		['<Right>'] = cmp.mapping.scroll_docs(1),
		-- ['<C-Space>'] = cmp.mapping.complete(),
		-- ['<C-e>']     = cmp.mapping.abort(),
		['<CR>']      = cmp.mapping.confirm({
												behavior = cmp.ConfirmBehavior.Replace ,
												select = false }
											), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() and cmp.get_selected_entry() then
			cmp.select_next_item()
		  elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		  elseif has_words_before() then
			cmp.complete()
		  else
			fallback()
		  end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_prev_item()
		  elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		  else
			fallback()
		  end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = 'nvim_lsp_signature_help' },
	},
	sources = cmp.config.sources({
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'vsnip'    }, -- For vsnip users.
		{ name = 'path' },
		{ name = 'buffer',
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
		{ name = 'nvim_lsp' },
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
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	},
	{
		{ name = 'cmdline' }
	})
})

