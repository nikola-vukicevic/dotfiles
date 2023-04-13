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
			-- vim.fn["vsnip#anonymous"](args.body)     -- For `vsnip` users.
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end
	},
	-- performance = {
	-- 	-- debounce = 1500,
	-- 	-- trigger_debounce_time = 1500,
	-- 	debounce = 500,
	-- 	throttle = 800,
	-- 	fetching_timeout = 1200,
	-- },
	-- view = {            
	-- 	entries = "native", -- can be "custom", "wildmenu" or "native"
	-- },
	experimental = {
		native_menu = false,
		ghost_text  = true,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
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
		['<C-b>']   = cmp.mapping.scroll_docs(-4),
		['<C-f>']   = cmp.mapping.scroll_docs(4),
		-- ['<Left>']  = cmp.mapping.scroll_docs(-1),
		-- ['<Right>'] = cmp.mapping.scroll_docs(1),
		['<Up']       = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		['<Down>']    = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		-- ['<C-Space>'] = cmp.mapping.complete(),
		-- ['<C-e>']     = cmp.mapping.abort(),
		['<ESC>']    = cmp.mapping.abort(),
		['<CR>']     = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace ,
			select   = false }
		), -- Accept currently selected item.
		   -- Set `select` to `false` to only
		   -- confirm explicitly selected items.
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
	-- sources = {
	-- 	{ name = 'nvim_lsp_signature_help' },
	-- },
	sources = cmp.config.sources({
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'vsnip'    }, -- For vsnip users.
		-- { name = 'nvim_lua' }, -- Kanda neodev.vim
		                          -- radi sve što treba
		{ name = 'path' },
		{ name = 'calc' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer',
			-- option = {
			-- 	get_bufnrs = function()
			-- 		return vim.api.nvim_list_bufs()
			-- 	end
			-- },
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
	completion = { autocomplete = false },
	mapping    = cmp.mapping.preset.cmdline({
		['<Down>'] = { c = cmp.mapping.select_next_item( { behavior = cmp.SelectBehavior.Insert } ) },
        ['<Up>']   = { c = cmp.mapping.select_prev_item( { behavior = cmp.SelectBehavior.Insert } ) },
		['<ESC>']    = cmp.mapping.abort(),
	}),
	sources    = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	completion = { autocomplete = false },
	mapping    = cmp.mapping.preset.cmdline({
		['<Down>'] = { c = cmp.mapping.select_next_item( { behavior = cmp.SelectBehavior.Insert } ) },
        ['<Up>']   = { c = cmp.mapping.select_prev_item( { behavior = cmp.SelectBehavior.Insert } ) },
		['<ESC>']  = { c = cmp.mapping.abort( {            behavior = cmp.SelectBehavior.Abort  } ) },

		-- ['<Up>']   = cmp.select_prev_item({ behavior = cmp.types.cmp.SelectBehavior.Select }),
		-- ['<Down>'] = cmp.select_next_item({ behavior = cmp.types.cmp.SelectBehavior.Select }),
	}),
	sources    = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	})
})

