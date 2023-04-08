-- -----------------------------------------------------------------------------
vim.g.mapleader = " "
-- -----------------------------------------------------------------------------
-- " inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
-- " nmap <leader>r <Plug>(coc-rename)
-- noremap <leader>p va}:!clang-format -style=file:/home/korisnik/.config/clangd/clang_format<cr>
-- " ---------------------------------------------------------------------------- "
vim.keymap.set( "n" , "<F2>" ,         ":NvimTreeToggle<cr>" ,                     { desc = "" , remap = false } )
vim.keymap.set( "n" , "<leader>e" ,    ":Lf<cr>" ,                                 { desc = "" , remap = false } )
vim.keymap.set( "n" , "<leader>f" ,    ":Lf<cr>" ,                                 { desc = "" , remap = false } )
vim.keymap.set( "n" , "<F3>" ,         ":Startify<cr>" ,                           { desc = "" , remap = false } )
vim.keymap.set( "n" , "<leader><F3>" , ":Tags<cr>" ,                               { desc = "" , remap = false } )
vim.keymap.set( "n" , "<F4>" ,         ":Buffers<cr>" ,                            { desc = "" , remap = false } )
vim.keymap.set( "n" , "<leader><F4>" , ":Files<cr>" ,                              { desc = "" , remap = false } )
vim.keymap.set( "n" , "<F5>" ,         ":lua Uokviravanje()<cr>" ,                 { desc = "" , remap = false } )
vim.keymap.set( "i" , "<F5>" ,         "<esc>l:lua Uokviravanje()<cr>" ,           { desc = "" , remap = false } )
vim.keymap.set( "v" , "<F5>" ,         ":lua UokviravanjeVisualSelekcija(1)<cr>" , { desc = "" , remap = false } )
vim.keymap.set( "n" , "<F6>" ,         ":lua ProbaMenija()<cr>" ,                  { desc = "" , remap = false } )
vim.keymap.set( "v" , "<F6>" ,         ":lua ProbaMenija()<cr>" ,                  { desc = "" , remap = false } )
-- inoremap <F5>         <esc>ebi<code class='kod_u_tekstu'><esc>ea</code><esc>a
-- nnoremap <leader><F5>     ebi&lt;<esc>ea&gt;<esc>
--
-- map      <F6> :Tabularize /
-- nnoremap <F7> :w !python /home/korisnik/git/python/markdown/idiosync_parser.py<cr>
vim.keymap.set( "" , "<F7>" , ":lua SpelovanjeToggle()<cr>" , { desc = "" , remap = false } )
-- nnoremap <F8> :TagbarToggle<cr>
--
-- " map <leader>= :Tabularize /=<cr>
-- map <leader>= !python /home/korisnik/git/python/pretty_css.py<cr>
-- --------------------------------------------------------
vim.keymap.set( "" , "<F9>" ,      ":set number!<cr>"         , { desc = "" , remap = false } )
vim.keymap.set( "" , "<F10>" ,     ":set relativenumber!<cr>" , { desc = "" , remap = false } )
vim.keymap.set( "" , "<leader>y" , ":set wrap!<cr>" ,           { desc = "" , remap = false } )
vim.keymap.set( "" , "<F11>" ,     ":VimadeToggle<cr>" ,        { desc = "" , remap = false } )
vim.keymap.set( "" , "<F11>" ,     ":bd<cr>" ,                  { desc = "" , remap = false } )
vim.keymap.set( "" , "<F12>" ,     ":qa<cr>" ,                  { desc = "" , remap = false } )
-- -----
-- uklanjanje oznake sa poslednjeg pretraživanog stringa
vim.keymap.set( "n", "<esc><esc>", ":noh<cr>", { desc = "" , remap = true })
-- search za Normal mode:
vim.keymap.set( "n" , "<leader><backspace>" , ":%s//gc<left><left><left>" , { desc = "" , remap = false } )
-- search za Visual mode:
vim.keymap.set( "v" , "<leader><backspace>" , ":s//gc<left><left><left>"  , { desc = "" , remap = false } )
-- toggle za prikaz whitespace-ova preko specijalnih znakova
vim.keymap.set( "" , "<leader>`" , ":set list!<cr>" , { desc = "" , remap = false })
-- -----
-- premotavanje pola stranice na dole:
vim.keymap.set( "n" , "<S-f>" , "<C-d>" , { desc = "" , remap = false } )
-- premotavanje pola stranice na gore:
vim.keymap.set( "n" , "<S-b>" , "<C-u>" , { desc = "" , remap = false } )
-- premeštanje reda jedno mesto na dole:
vim.keymap.set( "n" , "<S-j>" , ":lua PomeranjeLinijeNaDole()<cr>" , { desc = "" , silent = true , remap = false } )
-- premeštanje reda jedno mesto na gore:
vim.keymap.set( "n" , "<S-k>" , ":lua PomeranjeLinijeNaGore()<cr>" , { desc = "" , silent = true , remap = false } )
-- dupliranje reda na dole (kursor prelazi u donji red):
vim.keymap.set( "n" , "<S-h>", ":lua DupliranjeLinijeNaDole()<cr>" , { desc = "" , silent = true , remap = false } )
-- dupliranje reda na gore (kursor ostaje u istom redu):
vim.keymap.set( "n" , "<S-l>", ":lua DupliranjeLinijeNaGore()<cr>" , { desc = "" , silent = true , remap = false } )
-- " horizontalni skok na početak reda:
vim.keymap.set( "n" , "<leader>h" , "0" ,                            { desc = "" , silent = true , remap = false } )
-- " horizontalni skok na kraj reda:
vim.keymap.set( "n" , "<leader>l" , "$" ,                            { desc = "" , silent = true , remap = false } )
-- vertikalni skok na sredinu ekrana:
vim.keymap.set( "n" , "<leader>m" , "M" , { desc = "" , remap = false } )
-- vertikalni skok na dno ekrana:
vim.keymap.set( "n" , "<leader>j" , "L" , { desc = "" , remap = false } )
-- vertikalni skok na vrh ekrana:
vim.keymap.set( "n" , "<leader>k" , "H" , { desc = "" , remap = false } )
-- -----
-- Simulacija ponašanja ostalih editora u Insert modu:
-- 'Shift-Del' - brisanje sledeće reči
vim.keymap.set( "i" , "<C-e>" , "<C-o>de" , { desc = "" , remap = false } )
-- 'Ctrl-Shift-Del' - brisanje do kraja reda
vim.keymap.set( "i" , "<C-r>" , "<C-o>D" , { desc = "" , remap = false } )
-- 'Shift-Backspace' je već mapirano na <C-w>
-- 'Ctrl-Shift-Backspace' - brisanje do početka reda:
vim.keymap.set( "i" , "<C-q>" , "<C-o>d^" , { desc = "" , remap = false } )
-- Dupliranje reda:
vim.keymap.set( "i" , "<C-d>" , "<C-o>:lua DupliranjeLinijeNaDole()<cr>" , { desc = "" , remap = false } )
-- -----
-- Malo olakšanje za rad sa splitovanom
-- radnom površinom
vim.keymap.set( "n" , "<leader>v" , ":vsp<cr>" , { desc = "" , remap = false } )
vim.keymap.set( "n" , "<leader>w" , "<C-w>w" ,    { desc = "" , remap = false } )
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
vim.keymap.set( "n" , "j" , "(v:count == 0 ? 'gj' : 'j')" , { desc = "" , expr = true , remap = false } )
vim.keymap.set( "n" , "k" , "(v:count == 0 ? 'gk' : 'k')" , { desc = "" , expr = true , remap = false } )
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
-- " ---------------------------------------------------------------------------- "

