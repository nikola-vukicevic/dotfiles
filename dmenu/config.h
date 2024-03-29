/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar               = 1;     /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy                = 1;     /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
static int centered             = 1;     /* -c option; centers dmenu on screen */
static int min_width            = 500;   /* minimum width when centered */
static const unsigned int alpha = 0xf0;
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=16"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*                         fg         bg      */
	[SchemeNorm]          = { "#bbbbbb", "#272935" },
	[SchemeSel]           = { "#eeeeee", "#6b7084" }, // #005577
	[SchemeSelHighlight]  = { "#ffc978", "#6b7084" }, // #005577" },
	[SchemeNormHighlight] = { "#80a0f0", "#2e2e31" }, // #222222" },
	[SchemeOut]           = { "#ff0000", "#00ffff" },
};

static const unsigned int alphas[SchemeLast][2] = {
	[SchemeNorm] = { OPAQUE, alpha },
	[SchemeSel]  = { OPAQUE, alpha },
	[SchemeOut]  = { OPAQUE, alpha },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines          = 12;
/* -h option; minimum height of a menu line */
static unsigned int lineheight     = 32;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 1;
