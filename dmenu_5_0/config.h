/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int                topbar    = 1;    /* -b  option; if 0, dmenu appears at bottom     */
static int                centered  = 1;    /* -c option; centers dmenu on screen */
static int                min_width = 600;  /* minimum width when centered */
static const unsigned int alpha     = 0xe0;

/* Size of the window border */
static const unsigned int border_width = 2;

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 12;

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=18"
};

static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel]  = { "#eeeeee", "#005577" },
	[SchemeOut]  = { "#000000", "#00ffff" },
};

static const unsigned int alphas[SchemeLast][2] = {
	[SchemeNorm] = { OPAQUE, alpha },
	[SchemeSel]  = { OPAQUE, alpha },
	[SchemeOut]  = { OPAQUE, alpha },
};

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
