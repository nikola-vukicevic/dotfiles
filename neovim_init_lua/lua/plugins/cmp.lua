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
		-- completeopt = 'menu,menuone,noinsert',
		-- autocomplete = false,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	performance = {
		debounce = 400;
	},
	-- view = {
	-- 	docs = {
	-- 		auto_open = false;
	-- 	}
	-- };
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
		-- documentation = cmp.config.window.bordered(),
		documentation = {
			border = "rounded";
			max_width = 72;
			winhighlight = "Normal:CmpDocWin"
		}
	},
	formatting = {
		format = lspkind.cmp_format({
			mode      = "symbol_text",
			maxwidth  = 24,
			-- maxheight = 5,
			menu = {
				buffer        = "[Buf]",
				nvim_lsp      = "[LSP]",
				luasnip       = "[Snip]",
				-- nvim_lua      = "[API]",
				calc          = "[Calc]",
				latex_symbols = "[Latex]",
			}
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
--- HACK: Override `vim.lsp.util.stylize_markdown` to use Treesitter.
---@param bufnr integer
---@param contents string[]
---@param opts table
---@return string[]
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
	contents = vim.lsp.util._normalize_markdown(contents, {
		width = vim.lsp.util._make_floating_popup_size(contents, opts),
	})

	vim.bo[bufnr].filetype = 'markdown'
	vim.treesitter.start(bufnr)
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)

	return contents
end
-- -----------------------------------------------------------------------------
local cmp_entry = require('cmp.entry')
--
function PrepravkaDocHover(lista)
	local nova_lista = { }
	local prethodni = ""
	local moze_ubacivanje = true

	for _, e in ipairs(lista) do
		moze_ubacivanje = not e:startsWith("---") or not prethodni:startsWith("---")
		if moze_ubacivanje == true then
			table.insert(nova_lista, e)
		end
		prethodni = e
	end
	
	return nova_lista
end
--
cmp_entry.get_documentation = function(self)
	-- print(vim.inspect(self.completion_item))
	local label  = self.completion_item.label or ""
	local detail = self.completion_item.detail or ""
	local doc    = self.completion_item.documentation and
	               self.completion_item.documentation.value or ""

	if detail ~= "" then detail = "\n---\n" .. detail end
	if doc    ~= "" then doc    = "\n---\n" .. doc    end

	local md_1 = "### " .. label .. detail .. doc

	local md_2 = ObradaHover(md_1, "\n")
	-- print(vim.inspect(md_2))
	local md_3 = require("pretty_hover.parser").parse(md_2)
	-- print(vim.inspect(md_3))
	local md_4 = PrepravkaDocHover(md_3.text)
	-- print(vim.inspect(md_4))

	return md_4
end
-- -----------------------------------------------------------------------------

