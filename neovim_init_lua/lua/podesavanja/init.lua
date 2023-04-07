-- -------------------------------------------------------------------------- -
require('podesavanja/lualine')
require('podesavanja/treesitter')
require('podesavanja/nvimtree')
require('podesavanja/lsp')
require('podesavanja/lsp/lsp_saga')
require('podesavanja/luasnip')
require('podesavanja/cmp')
-- -------------------------------------------------------------------------- -
-- Plugin - Illuminate:
-- -------------------------------------------------------------------------- -
require('illuminate').configure({
     -- delay: delay in milliseconds
     delay = 40,
})

