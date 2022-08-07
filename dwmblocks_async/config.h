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
	BLOCK( "/home/korisnik/.dwm/blocks/01_cpu.sh"  ,  1  ,  11 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/02_mem.sh"  ,  1  ,  12 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/03_ssd.sh"  ,  1  ,  13 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/04_wifi.sh" ,  1  ,  14 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/05_bat.sh"  ,  1  ,  15 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/06_snd.sh"  ,  0  ,  16 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/07_kbd.sh"  ,  0  ,  17 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/08_pmn.sh"  ,  60 ,  18 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/09_eml.sh"  ,  60 ,  19 ) ,
	BLOCK( "/home/korisnik/.dwm/blocks/10_sat.sh"  ,  1  ,  20 ) ,
};
