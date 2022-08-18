#define CMDLENGTH 100
#define DELIMITER "^c#e0e0e0^|"
#define CLICKABLE_BLOCKS

const Block blocks[] = {
	// BLOCK("sb-mail",    1800, 17),
	// BLOCK("sb-music",   0,    18),
	// BLOCK("sb-disk",    1800, 19),
	// BLOCK("sb-memory",  10,   20),
	// BLOCK("sb-loadavg", 5,    21),
	// BLOCK("sb-mic",     0,    26),
	// BLOCK("sb-volume",  0,    22),
	// BLOCK("sb-battery", 5,    23),
	// BLOCK("sb-date",    1,    24),
	// BLOCK("sb-network", 5,    25),
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_cpu.sh"  ,  1   ,  1 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_mem.sh"  ,  1   ,  2 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_ssd.sh"  ,  1   ,  3 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_wifi.sh" ,  1   ,  4 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_bat.sh"  ,  1   ,  5 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_snd.sh"  ,  0   ,  6 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_kbd.sh"  ,  0   ,  7 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_pmn.sh"  ,  900 ,  8 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_eml.sh"  ,  300 ,  9 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/dwb_sat.sh"  ,  1   , 10 ) ,
	// BLOCK( "/home/korisnik/.dwm/blocks/dwb_pwr.sh"  ,  1   , 11 ) ,
};

