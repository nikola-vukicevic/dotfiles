-- -----------------------------------------------------------------------------
vim.g.mapleader = " "
-- -----------------------------------------------------------------------------
local opts_nr = {
	desc  = "",
	remap = false,
}
--
local opts = {
	desc  = "",
	remap = true,
}
--
local opts_snr = {
	desc   = "",
	remap  = true,
	silent = true,
}
--
local opts_nrexp = {
	desc  = "",
	expr  = true,
	remap = false,
}
-- ------ -----------------------------------------------------------------------
vim.keymap.set( "" , "<leader>p" , ":!clang-format -style=file:/home/korisnik/.config/clangd/clang_format<cr>" , opts_nr )
-- " ---------------------------------------------------------------------------- "
vim.keymap.set( "n" , "<F2>" ,         ":NvimTreeToggle<cr>" ,                                                opts_nr )
vim.keymap.set( "n" , "<leader><F2>" , ":Telescope find_files<cr>" ,                                          opts_nr )
-- vim.keymap.set( "n" , "<leader>e" ,    ":Lf<cr>" ,                                                            opts_nr )
vim.keymap.set( "n" , "<leader>f" ,    ":Lf<cr>" ,                                                            opts_nr )
vim.keymap.set( "n" , "<F3>" ,         ":Alpha<cr>" ,                                                         opts_nr )
vim.keymap.set( "n" , "<leader><F3>" , ":Telescope aerial<cr>" ,                                              opts_nr )
vim.keymap.set( "n" , "<F4>" ,         ":lua require('telescope.builtin').buffers( { sort_mru = true})<cr>" , opts_nr )
vim.keymap.set( "n" , "<leader><F4>" , ":Telescope live_grep<cr>" ,                                           opts_nr )
vim.keymap.set( "n" , "<F5>" ,         ":lua UokviravanjeSelekcije('n')<cr>" ,                                opts_nr )
vim.keymap.set( "v" , "<F5>" ,         ":lua UokviravanjeSelekcije('v')<cr>" ,                                opts_nr )
-- ---------------------------------------------------------
--
-- map      <F6> :Tabularize /
-- nnoremap <F7> :w !python /home/korisnik/git/python/markdown/idiosync_parser.py<cr>
vim.keymap.set( "" , "<F7>" ,      ":lua SpelovanjeToggle()<cr>" , opts_nr )
vim.keymap.set( "" , "<leader>g" , ":AerialToggle<cr>"           , opts_nr )
--
vim.keymap.set( "v" , "<" ,         "<gv" ,                        opts_nr )
vim.keymap.set( "v" , ">" ,         ">gv" ,                        opts_nr )
--
-- " map <leader>= :Tabularize /=<cr>
-- map <leader>= !python /home/korisnik/git/python/pretty_css.py<cr>
-- --------------------------------------------------------
vim.keymap.set( "" , "<F9>" ,      ":set number!<cr>"         , opts_nr )
vim.keymap.set( "" , "<F10>" ,     ":set relativenumber!<cr>" , opts_nr )
vim.keymap.set( "" , "<leader>y" , ":set wrap!<cr>" ,           opts_nr )
vim.keymap.set( "" , "<F11>" ,     ":VimadeToggle<cr>" ,        opts_nr )
vim.keymap.set( "" , "<F11>" ,     ":bd<cr>" ,                  opts_nr )
vim.keymap.set( "" , "<F12>" ,     ":qa<cr>" ,                  opts_nr )
-- -----
vim.keymap.set("c" , "<C-h>" , "<Down>"  , { desc = "" , remap = false } )
vim.keymap.set("c" , "<C-l>" , "<Up>"    , { desc = "" , remap = false } )
vim.keymap.set("i" , "<C-j>" , "<Down>"  , { desc = "" , remap = false } )
vim.keymap.set("i" , "<C-k>" , "<Up>"    , { desc = "" , remap = false } )
vim.keymap.set("i" , "<C-h>" , "<Left>"  , { desc = "" , remap = false } )
vim.keymap.set("i" , "<C-l>" , "<Right>" , { desc = "" , remap = false } )
-- -----
-- uklanjanje oznake sa poslednjeg pretraživanog stringa
-- vim.keymap.set( "n", "<esc><esc>", ":noh<cr>", opts )
vim.keymap.set( "n", "<esc><esc>", function()
	local ft = vim.bo.filetype
	if ft == "NvimTree" then
		vim.cmd("NvimTreeClose")
	elseif ft == "qf" then
		vim.cmd("cclose")
	elseif ft == "help" then
		vim.cmd("q")
	else
		vim.cmd("noh")
		vim.lsp.buf.clear_references()
	end
end, opts )
-- search za Normal mode:
vim.keymap.set( "n" , "<leader><backspace>" , ":%s//gc<left><left><left>" , opts_nr )
-- search za Visual mode:
vim.keymap.set( "v" , "<leader><backspace>" , ":s//gc<left><left><left>"  , opts_nr )
-- toggle za prikaz whitespace-ova preko specijalnih znakova
vim.keymap.set( "" , "<leader>`" , ":set list!<cr>" , opts_nr)
-- -----
-- premotavanje pola stranice na dole:
vim.keymap.set( "n" , "<S-f>" , "<C-d>" , opts_nr )
-- premotavanje pola stranice na gore:
vim.keymap.set( "n" , "<S-b>" , "<C-u>" , opts_nr )
-- premeštanje reda jedno mesto na dole:
vim.keymap.set( "n" , "<S-j>" , ":lua PomeranjeLinijeNaDole()<cr>" , opts_snr )
-- premeštanje reda jedno mesto na gore:
vim.keymap.set( "n" , "<S-k>" , ":lua PomeranjeLinijeNaGore()<cr>" , opts_snr )
-- dupliranje reda na dole (kursor prelazi u donji red):
vim.keymap.set( "n" , "<S-h>", ":lua DupliranjeLinijeNaDole()<cr>" , opts_snr )
-- dupliranje reda na gore (kursor ostaje u istom redu):
vim.keymap.set( "n" , "<S-l>", ":lua DupliranjeLinijeNaGore()<cr>" , opts_snr )
-- " horizontalni skok na početak reda:
vim.keymap.set( "n" , "<leader>h" , "0" ,                            opts_snr )
-- " horizontalni skok na kraj reda:
vim.keymap.set( "n" , "<leader>l" , "$" ,                            opts_snr )
-- vertikalni skok na sredinu ekrana:
vim.keymap.set( "n" , "<leader>m" , "M" , opts_nr )
-- vertikalni skok na dno ekrana:
vim.keymap.set( "n" , "<leader>j" , "L" , opts_nr )
-- vertikalni skok na vrh ekrana:
vim.keymap.set( "n" , "<leader>k" , "H" , opts_nr )
-- -----
-- Simulacija ponašanja ostalih editora u Insert modu:
-- 'Shift-Del' - brisanje sledeće reči
vim.keymap.set( "i" , "<C-e>" , "<C-o>de" , opts_nr )
-- 'Ctrl-Shift-Del' - brisanje do kraja reda
vim.keymap.set( "i" , "<C-r>" , "<C-o>D" , opts_nr )
-- 'Shift-Backspace' je već mapirano na <C-w>
-- 'Ctrl-Shift-Backspace' - brisanje do početka reda:
vim.keymap.set( "i" , "<C-q>" , "<C-o>d^" , opts_nr )
-- Dupliranje reda:
vim.keymap.set( "i" , "<C-d>" , "<C-o>:lua DupliranjeLinijeNaDole()<cr>" , opts_nr )
-- -----
-- Malo olakšanje za rad sa splitovanom
-- radnom površinom
vim.keymap.set( "n" , "<leader>v" , ":vsp<cr>" ,  opts_nr )
vim.keymap.set( "n" , "<leader>w" , "<C-w>w" ,    opts_nr )
-- -----
-- Tabove zapravo ne koristim često, ali,
-- neka bude ovako
-- noremap <leader>1 1gt
-- noremap <leader>2 2gt
-- noremap <leader>3 3gt
-- noremap <leader>4 4gt
-- noremap <leader>5 5gt
-- noremap <leader>6 6gt
-- noremap <leader>7 7gt
-- noremap <leader>8 8gt
-- noremap <leader>9 9gt
-- noremap <leader>0 :tablast<cr>
-- nnoremap <expr><silent> <leader>t &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>"
-- " ----- "
-- -Kada je uključena opcija 'wrap', po defaultu <j> i <k>
-- prebacuju kursor na sledeći/prethodni red koji u prikazu
-- može biti zapravo nekoliko mesta ispod/iznad
-- -Preko mapiranja, podešeno je da <j> i <k> pomeraju
-- kursor jedno mesto dole/gore u prikazu
vim.keymap.set( "n" , "j" , "(v:count == 0 ? 'gj' : 'j')" , opts_nrexp )
vim.keymap.set( "n" , "k" , "(v:count == 0 ? 'gk' : 'k')" , opts_nrexp )
-- " ----- "
-- " bez donjih mapiranja, multicursor plugin ne radi
-- map <Esc>[1;5A <C-Up>
-- map <Esc>[1;5B <C-Down>
-- map <Esc>[1;5D <C-Left>
-- map <Esc>[1;5C <C-Right>
--
-- map <Esc>[1;2D <S-Left>
-- map <Esc>[1;2C <S-Right>
-- map <Esc>[1;2D <S-Left>
-- map <Esc>[1;2C <S-Right>
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
-- LSP:
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group    = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts      = { buffer = ev.buf }
		local opts_sexp = { buffer = ev.buf, expr = true, silent = true }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'ga', ":lua vim.diagnostic.open_float({ border='single', width=60 })<cr>", opts_nr )
		-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = ev.buf, expr = true, silent = true } )
		-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		--
		-- vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
		-- vim.keymap.set('n', '<space>r', ":IncRename <cword>", opts)
		vim.keymap.set('n', '<space>r', ":lua FancyRenamePoziv()<cr>", opts)
		-- vim.keymap.set("n", "<leader>r", function()
		-- 	vim.lsp.buf.document_highlight()
		-- 	vim.lsp.buf.rename()
		-- 	vim.lsp.buf.clear_references()
		-- 	-- return ":IncRename " .. vim.fn.expand("<cword>")
		-- end, opts_snr)

		--
		vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', ":Telescope lsp_references<cr>", opts)
		-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- vim.keymap.set('n', '<space>f', function()
		-- 	vim.lsp.buf.format { async = true }
		-- end, opts)
  end,
})

