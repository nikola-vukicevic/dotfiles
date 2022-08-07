# dotfiles
In 2016, after a long hiatus, I returned to Linux and Arch was a nice discovery for me (knew about it before, of course, but, never used it for real). I ditched the desktop enviroments and went the minimalist/terminal/VM way (started with i3, tried many VMs, settled with dwm and also switched from Arch to Artix).

So far so good! :)

## dwm

My build of the Suckless dwm window manager. Simple and effective with only a few patches:

- bottom stack (a nice additional layout)
- shift tools (for easier acces to adjacent tags)
- swallow (GUI app started from terminal 'swallows' the terminal, i.e. - the terminal temporarily disappears until the app is closed)
- full gaps (by default, it's practiaclly 'turned-off', as you can see in the config file, but I guess I like it sometimes, so I keep it

### Dependencies

In order for scripts to work, the following software is required:

- sysstat
- dunst

## st

My build of the Suckless Simple Terminal. Also simple and effective with not too many patches:

- del key (del key is not functional by default)
- focus (separate alpha for the main/aux windows)
- font 2 (so you can list backup fonts)
- scrollback & scrollback mouse (scrolling is not a default option in ST)

## ViM (legacy)
Although I'm still very much using Vim, haven't really fiddled with the .vimrc in a long time, so I'm calling these my "legacy" settings.

If you wanna try them out, you're going to need the Vundle plugin and you're also going to have to fiddle with YCM (and apprent;y, I also made a mod of one of the official Airline themes minimalist.vim).

## i3 (legacy)
Nothing fancy here. Simple and functional (a few dedicated shortcuts for switching the keyboard layout and some minor visual tweaks)

## Xresources (legacy)
These settings are for the urxvt terminal (which is what I used before switching to ST)
