/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 0;   /* border pixel of windows */
static const unsigned int gappx     = 0;   /* gaps between windows */
static const unsigned int snap      = 32;  /* snap pixel */
static const int swallowfloating    = 0;   /* 1 means swallow floating windows by default */
static const int scalepreview       = 4;   /* tag preview scaling */
static const int showbar            = 1;   /* 0 means no bar */
static const int topbar             = 1;   /* 0 means bottom bar */
static const int focusonwheel       = 0;
/* ----- */
static const int user_bh            = 27;  /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
static const int user_bh_padding    = 3;   /* if user_bh == 0, user bh padding is added to font height */
static const int user_attach_bottom = 1;
/* ----- */
static const char *fonts[]      = {
	"monospace:size=11"
};
static const char dmenufont[]   = "monospace:size=15";
static const char col_gray1[]   = "#2e2e31";
static const char col_gray2[]   = "#2e2e31";
static const char col_gray3[]   = "#bbbbbb";
static const char col_gray4[]   = "#eeeeee";
static const char col_cyan[]    = "#6b7084";  // "#005577";
static const char *colors[][3]  = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Sublime_text",    NULL,     NULL,           1 << 6,    0,          0,           0,        -1 },
	{ "Gimp",            NULL,     NULL,           0,         1,          0,           0,        -1 },
	{ "Firefox",         NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
	{ "St",              NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ NULL,              NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
	{ "Brave-browser",   NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
};

/* layout(s) */
static const float mfact        = 0.6;  /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1;    /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#define STATUSBAR "dwmblocks"

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, "-i" , NULL };
static const char *termcmd[]  = { "st", NULL };

#include "shift-tools.c"

static Key keys[] = {
	
	/* modifier             key         function           argument */
	
	{ MODKEY,	            XK_n,       shiftviewclients,  { .i = -1 } },
	{ MODKEY,	            XK_m,       shiftviewclients,  { .i = +1 } },
	{ MODKEY,               XK_d,       spawn,             {.v = dmenucmd } },   /* izmena - bilo p */
	{ MODKEY,               XK_Return,  spawn,             {.v = termcmd } },    /* izmena */
	{ MODKEY,               XK_b,       togglebar,         {0} },
	{ MODKEY,               XK_j,       focusstack,        {.i = +1 } },
	{ MODKEY,               XK_k,       focusstack,        {.i = -1 } },
	{ MODKEY,               XK_i,       incnmaster,        {.i = +1 } },
	{ MODKEY,               XK_p,       incnmaster,        {.i = -1 } },         /* izmena - bilo d */
	{ MODKEY,               XK_h,       setmfact,          {.f = -0.05} },
	{ MODKEY,               XK_l,       setmfact,          {.f = +0.05} },
	{ MODKEY|ShiftMask,     XK_Return,  zoom,              {0} },                /* izmena */
	{ MODKEY,               XK_Tab,     view,              {0} },
	{ MODKEY|ShiftMask,     XK_c,       killclient,        {0} },
	{ MODKEY,               XK_t,       setlayout,         {.v = &layouts[0]} },
	{ MODKEY,               XK_f,       setlayout,         {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,     XK_m,       setlayout,         {.v = &layouts[2]} },
	{ MODKEY,               XK_u,       setlayout,         {.v = &layouts[3]} },
	{ MODKEY,               XK_o,       setlayout,         {.v = &layouts[4]} },
	{ MODKEY,               XK_space,   setlayout,         {0} },
	{ MODKEY|ShiftMask,     XK_space,   togglefloating,    {0} },
	{ MODKEY,               XK_0,       view,              {.ui = ~0 } },
	{ MODKEY|ShiftMask,     XK_0,       tag,               {.ui = ~0 } },
	{ MODKEY,               XK_comma,   focusmon,          {.i = -1 } },
	{ MODKEY,               XK_period,  focusmon,          {.i = +1 } },
	{ MODKEY|ShiftMask,     XK_comma,   tagmon,            {.i = -1 } },
	{ MODKEY|ShiftMask,     XK_period,  tagmon,            {.i = +1 } },
	{ MODKEY,               XK_minus,   setgaps,           {.i = -1 } },
	{ MODKEY,               XK_equal,   setgaps,           {.i = +1 } },
	{ MODKEY|ShiftMask,     XK_equal,   setgaps,           {.i = 0  } },
	
	/* ----- Moji bind-ovi -------------------------------------------------- */
    
	{ MODKEY, XK_F1,      spawn, SHCMD("amixer set Master toggle ; pkill -RTMIN+16 dwmblocks")            },
	{ MODKEY, XK_F2,      spawn, SHCMD("amixer -q set Master 1%- ; pkill -RTMIN+16 dwmblocks")            },
	{ MODKEY, XK_F3,      spawn, SHCMD("amixer -q set Master 1%+ ; pkill -RTMIN+16 dwmblocks")            },
	{ MODKEY, XK_F9,      spawn, SHCMD("setxkbmap -layout us                ; pkill -RTMIN+17 dwmblocks") },
	{ MODKEY, XK_F10,     spawn, SHCMD("setxkbmap -layout rs -variant latin ; pkill -RTMIN+17 dwmblocks") },
	{ MODKEY, XK_F11,     spawn, SHCMD("setxkbmap -layout rs                ; pkill -RTMIN+17 dwmblocks") },
	{ MODKEY, XK_F12,     spawn, SHCMD("/home/korisnik/.dwm/skripte/screenshot_f12")                      },  
	{ MODKEY, XK_grave,   spawn, SHCMD("promena_tastature")                                               },
	{ MODKEY, XK_q,       spawn, SHCMD("dunstctl close-all")                                              },
	{ MODKEY, XK_z,       spawn, SHCMD("slock")                                                           },
	{ MODKEY, XK_e,       spawn, SHCMD("st lfrun")                                                        },
	
	/* ----- nastavak (default keybinds) ------------------------------------ */

	TAGKEYS(                XK_1,                      0)
	TAGKEYS(                XK_2,                      1)
	TAGKEYS(                XK_3,                      2)
	TAGKEYS(                XK_4,                      3)
	TAGKEYS(                XK_5,                      4)
	TAGKEYS(                XK_6,                      5)
	TAGKEYS(                XK_7,                      6)
	TAGKEYS(                XK_8,                      7)
	TAGKEYS(                XK_9,                      8)
	
	// { MODKEY|ShiftMask,     XK_q,      quit,           {0} },
	{ MODKEY|ControlMask|ShiftMask,     XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigstatusbar,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

