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
vim.keymap.set( "" , "gg" ,        "gg0" ,                                 opts_nr )
vim.keymap.set( "" , "G" ,         "G0" ,                                  opts_nr )
vim.keymap.set( "" , "<M-o>" ,     "<C-o>" ,                               opts_nr )
vim.keymap.set( "" , "<M-i>" ,     "<C-i>" ,                               opts_nr )
vim.keymap.set( "" , "<M-z>" ,     "<C-r>" ,                               opts_nr )
vim.keymap.set( "" , "<M-n>" ,     ":cprev<cr>" ,                          opts_nr )
vim.keymap.set( "" , "<M-m>" ,     ":cnext<cr>" ,                          opts_nr )
vim.keymap.set( "" , "<M-a>" ,     ":lua vim.diagnostic.setqflist()<cr>" , opts_nr )
vim.keymap.set( "" , "<M-q>" ,  function()
	if vim.fn.winnr("$") > 1 then
		vim.cmd(":q")
	else
		vim.cmd(":bd")
	end
end, opts_nr )
-- ------ -----------------------------------------------------------------------
vim.keymap.set( "n" , "<leader><F3>" , ":lua require('prozor_proba').make_window()<cr>" ,                                                   opts_nr )
-- ------ -----------------------------------------------------------------------
vim.keymap.set( "" , "<leader>p" , ":!clang-format -style=file:/home/korisnik/.config/clangd/clang_format<cr>" , opts_nr )
-- " ---------------------------------------------------------------------------- "
vim.keymap.set( "n" , "<F2>" ,         ":NvimTreeToggle<cr>" ,                                                         opts_nr )
vim.keymap.set( "n" , "<M-t>" ,        ":NvimTreeToggle<cr>" ,                                                         opts_nr )
vim.keymap.set( "n" , "<leader><F2>" , ":Telescope find_files<cr>" ,                                                   opts_nr )
-- vim.keymap.set( "n" , "<leader>e" ,    ":Lf<cr>" ,                                                                     opts_nr )
vim.keymap.set( "n" , "<leader>f" ,    ":Lf<cr>" ,                                                                     opts_nr )
vim.keymap.set( "n" , "<leader>i" ,    "/" ,                                                                           opts_nr )
vim.keymap.set( "n" , "<F3>" ,         ":Alpha<cr>" ,                                                                  opts_nr )
-- vim.keymap.set( "n" , "<leader><F3>" , ":Telescope aerial<cr>" ,                                                       opts_nr )
vim.keymap.set( "n" , "<F4>" ,         ":Telescope buffers<cr>" ,          opts_nr )
vim.keymap.set( "n" , "<M-u>" ,        ":Telescope buffers<cr>" ,          opts_nr )
vim.keymap.set( "n" , "<leader><F4>" , ":Telescope live_grep<cr>" , opts_nr )
vim.keymap.set( "n" , "<M-s>" ,        ":Telescope live_grep<cr>" , opts_nr )
vim.keymap.set( "n" , "<F5>" ,         ":lua UokviravanjeSelekcije('n')<cr>" ,                                         opts_nr )
vim.keymap.set( "v" , "<F5>" ,         ":lua UokviravanjeSelekcije('v')<cr>" ,                                         opts_nr )
-- ---------------------------------------------------------
--
-- map      <F6> :Tabularize /
-- nnoremap <F7> :w !python /home/korisnik/git/python/markdown/idiosync_parser.py<cr>
vim.keymap.set( "" , "<F7>" ,      ":lua SpelovanjeToggle()<cr>" , opts_nr )
-- vim.keymap.set( "" , "<leader>g" , ":AerialToggle<cr>"           , opts_nr )
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
vim.keymap.set( "" , "<M-p>" ,     ":set wrap!<cr>" ,           opts_nr )
vim.keymap.set( "" , "<F11>" ,     ":VimadeToggle<cr>" ,        opts_nr )
vim.keymap.set( "" , "<F11>" ,     ":bd<cr>" ,                  opts_nr )
vim.keymap.set( "" , "<F12>" ,     ":qa<cr>" ,                  opts_nr )
-- -----
vim.keymap.set("c" , "<M-j>" , "<Down>"  , { desc = "" , remap = false } )
vim.keymap.set("c" , "<M-k>" , "<Up>"    , { desc = "" , remap = false } )
vim.keymap.set("i" , "<M-j>" , "<Down>"  , { desc = "" , remap = false } )
vim.keymap.set("i" , "<M-k>" , "<Up>"    , { desc = "" , remap = false } )
vim.keymap.set("i" , "<M-h>" , "<Left>"  , { desc = "" , remap = false } )
vim.keymap.set("i" , "<M-l>" , "<Right>" , { desc = "" , remap = false } )
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
-- ------------------------------------------------------------------------------
-- Fancy izlazak iz insert mode-a:
-- ------------------------------------------------------------------------------
-- vim.keymap.set("i", "<esc>", "<esc>`^", opts_snr)
-- ------------------------------------------------------------------------------
-- Još "fensiji" izlazak iz insert mode-a:
-- ------------------------------------------------------------------------------
vim.keymap.set( "n" , "i" , function()
	vim.cmd("startinsert")
	vim.g.insert_okidac = "i"
end, opts_nr )
--
vim.keymap.set("i", "<esc>", function()
	if vim.g.insert_okidac == "i" then
		vim.cmd("normal! l")
	end

	vim.cmd("stopinsert")
end, opts_snr)
-- -----------------------------------------------------------------------------
vim.keymap.set("n", "q", function()
	local ft = vim.bo.filetype
	if ft == "qf" then
		vim.cmd("cclose")
	end
end, opts)
-- search za Normal mode:
vim.keymap.set( "n" , "<leader><backspace>" , ":%s//gc<left><left><left>" , opts_nr )
-- search za Visual mode:
vim.keymap.set( "v" , "<leader><backspace>" , ":s//gc<left><left><left>"  , opts_nr )
-- toggle za prikaz whitespace-ova preko specijalnih znakova
vim.keymap.set( "" , "<leader>`" , ":set list!<cr>" , opts_nr)
-- -----
-- premotavanje pola stranice na dole:
vim.keymap.set( "n" , "<M-f>" , "<C-d>" , opts_nr )
-- premotavanje pola stranice na gore:
vim.keymap.set( "n" , "<M-d>" , "<C-u>" , opts_nr )
-- premeštanje reda jedno mesto na dole:
vim.keymap.set( "n" , "<M-j>" , ":lua PomeranjeLinijeNaDole()<cr>" , opts_snr )
-- premeštanje reda jedno mesto na gore:
vim.keymap.set( "n" , "<M-k>" , ":lua PomeranjeLinijeNaGore()<cr>" , opts_snr )
-- dupliranje reda na dole (kursor prelazi u donji red):
vim.keymap.set( "n" , "<M-h>", ":lua DupliranjeLinijeNaDole()<cr>" , opts_snr )
-- dupliranje reda na gore (kursor ostaje u istom redu):
vim.keymap.set( "n" , "<M-l>", ":lua DupliranjeLinijeNaGore()<cr>" , opts_snr )
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
vim.keymap.set( "i" , "<M-e>" , "<C-o>de" , opts_nr )
-- 'Ctrl-Shift-Del' - brisanje do kraja reda
vim.keymap.set( "i" , "<M-r>" , "<C-o>D" , opts_nr )
-- 'Shift-Backspace' je već mapirano na <C-w>
-- 'Ctrl-Shift-Backspace' - brisanje do početka reda:
vim.keymap.set( "i" , "<M-q>" , "<C-o>d^" , opts_nr )
-- Dupliranje reda:
vim.keymap.set( "i" , "<C-j>" , "<C-o>:lua PomeranjeLinijeNaDole()<cr>" ,  opts_nr )
vim.keymap.set( "i" , "<C-k>" , "<C-o>:lua PomeranjeLinijeNaGore()<cr>" ,  opts_nr )
vim.keymap.set( "i" , "<C-h>" , "<C-o>:lua DupliranjeLinijeNaDole()<cr>" , opts_nr )
vim.keymap.set( "i" , "<C-l>" , "<C-o>:lua DupliranjeLinijeNaGore()<cr>" , opts_nr )
-- -----
-- Malo olakšanje za rad sa splitovanom
-- radnom površinom
vim.keymap.set( "n" , "<leader>v" , ":vsp<cr>" ,  opts_nr )
vim.keymap.set( "n" , "<M-v>" ,     ":vsp<cr>" ,  opts_nr )
vim.keymap.set( "n" , "<leader>w" , "<C-w>w" ,    opts_nr )
vim.keymap.set( "n" , "<M-w>" ,     "<C-w>w" ,    opts_nr )
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
		vim.keymap.set('n', 'gh', function() vim.lsp.buf.hover({ border = 'single' }) end, opts)
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
		vim.keymap.set('n', '<M-r>', ":lua FancyRenamePoziv()<cr>", opts)
		-- vim.keymap.set('n', '<leader>r', ":lua FancyRenamePoziv()<cr>", opts)
		-- vim.keymap.set("n", "<leader>r", function()
		-- 	vim.lsp.buf.document_highlight()
		-- 	vim.lsp.buf.rename()
		-- 	vim.lsp.buf.clear_references()
		-- 	-- return ":IncRename " .. vim.fn.expand("<cword>")
		-- end, opts_snr)

		--
		vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<M-e>', ":Telescope lsp_references<cr>", opts)
		vim.keymap.set('n', 'ge', ":lua vim.lsp.buf.references()<cr>", opts)
		-- vim.keymap.set('n', '<space>f', function()
		-- 	vim.lsp.buf.format { async = true }
		-- end, opts)
  end,
})

