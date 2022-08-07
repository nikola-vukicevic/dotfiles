#
# ~/.bash_profile
#

# [[ -f ~/.bashrc ]] && . ~/.bashrc
export XAUTHORITY=~/.local/tmp/.Xauthority

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm

export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export MYSQL_HISTFILE="$XDG_CONFIG_HOME/mysql/mysql_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_CONFIG_HOME/npm/node_repl_history"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export ZSH_COMPDUMP=$HOME/zsh/.zcompdump

export PATH=$PATH:~/.dwm/skripte
export EDITOR=vim
export TERMINAL=st
export BROWSER=brave
export BAT_LEVEL=101
export BAT_AC=Mjau

# xmodmap -e 'clear lock' -e 'keycode 0x42 = Escape'
# numlockx on
