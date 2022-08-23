" ---------------------------------------------------------------------------- "
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nmap <leader>r <Plug>(coc-rename)
" ---------------------------------------------------------------------------- "
nnoremap <F2>         :NERDTreeToggle<cr>
nnoremap <F3>         :Startify<cr>
nnoremap <leader><F3> :Tags<cr>
nnoremap <F4>         :Buffers<cr>
nnoremap <leader><F4> :Files<cr>

map      <F6> :Tabularize /
nnoremap <F7> :w !pypy /home/korisnik/git/python/idiosync_parser.py<cr>
nnoremap <F8> :TagbarToggle<cr>

" map <leader>= :Tabularize /=<cr>
map <leader>= ! node /home/korisnik/git/node/css_tab.js<cr>
" -------------------------------------------------------- "
map <F9>      :set number!<cr>
map <F10>     :set relativenumber!<cr>
map <leader>y :set wrap!<cr>
map <F11>     :VimadeToggle<cr>
map <F12>     :qa<cr>
" ----- "
" uklanjanje oznake sa poslednjeg pretraživanog stringa
noremap  <esc><esc> :noh<cr>
" search za Normal mode
noremap  <leader><backspace> :%s//gc<left><left><left>
" search za Visual mode
vnoremap <leader><backspace> :s//gc<left><left><left>
" toggle za prikaz whitespace-ova preko specijalnih znakova
noremap  <leader>`           :set list!<cr>
" ----- "
" premotavanje pola stranice na dole
noremap <S-f> <C-d>
" premotavanje pola stranice na gore
noremap <S-b> <C-u>
" premeštanje reda jedno mesto na dole
noremap <silent><S-j> :call PomeranjeLinijeNaDole()<cr>
" premeštanje reda jedno mesto na gore
noremap <silent><S-k> :call PomeranjeLinijeNaGore()<cr>
" dupliranje reda na dole (kursor prelazi u donji red)
noremap <S-h> :call DupliranjeLinijeNaDole()<cr>
" dupliranje reda na gore (kursor ostaje u istom redu)
noremap <S-l> :call DupliranjeLinijeNaGore()<cr>
" horizontalni skok na početak reda
noremap <leader>h 0
" horizontalni skok na kraj reda
noremap <leader>l $
" vertikalni skok na sredinu ekrana
noremap <leader>m M
" vertikalni skok na dno ekrana
noremap <leader>j L
" vertikalni skok na vrh ekrana
noremap <leader>k H
" ----- "
" Simulacija ponašanja ostalih editora u Insert modu:
" 'Shift-Del' - brisanje sledeće reči
inoremap <C-e> <C-o>dw
" 'Ctrl-Shift-Del' - brisanje do kraja reda
inoremap <C-r> <C-o>D
" 'Shift-Backspace' je već mapirano na
" <C-w>
" 'Ctrl-Shift-Backspace' - brisanje do početka reda
inoremap <C-q> <C-o>d^
" Dupliranje reda
inoremap <C-d> <C-o>:call DupliranjeLinijeNaDole()<cr>
" ----- "
" Malo olakšanje za rad sa splitovanom
" radnom površinom
noremap <leader>v :vsp<cr>
noremap <leader>w <C-w>
" ----- "
" Tabove zapravo ne koristim često, ali,
" neka bude ovako
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <expr><silent> <leader>t &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>"
" ----- "
" -kada je uključena opcija 'wrap', po defaultu <j> i <k>
" prebacuju kursor na sledeći/prethodni red koji u prikazu
" može biti zapravo nekoliko mesta ispod/iznad
" -preko mapiranja, podešeno je da <j> i <k> pomeraju
"  kursor jedno mesto dole/gore u prikazu
noremap <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <expr> k (v:count == 0 ? 'gk' : 'k')
" bez donjih mapiranja, multicursor plugin ne radi
map <Esc>[1;5A <C-Up>
map <Esc>[1;5B <C-Down>
map <Esc>[1;5D <C-Left>
map <Esc>[1;5C <C-Right>

map <Esc>[1;2D <S-Left>
map <Esc>[1;2C <S-Right>
map <Esc>[1;2D <S-Left>
map <Esc>[1;2C <S-Right>
" ---------------------------------------------------------------------------- "
