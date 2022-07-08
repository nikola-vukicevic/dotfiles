# tHE FOLLOWING LINES WERE ADDED BY compinstall

zstyle :compinstall filename '/home/korisnik/.zshrc'

autoload -U colors && colors
autoload -Uz compinit
compinit

# End of lines added by compinstall

# Lines configured by zsh-newuser-install

HISTFILE=/home/korisnik/.zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extendedglob

# End of lines configured by zsh-newuser-install

# -------------------------------------------------- #
# Vim mode:
# -------------------------------------------------- #

bindkey -v

# ctrl-left and ctrl-right
# bindkey "\e[1;5D" backward-word
# bindkey "\e[1;5C" forward-word
# # ctrl-bs and ctrl-del
# # del, home and end
# bindkey "\e[3~" delete-char
# bindkey "\e[H"  beginning-of-line
#bindkey "\e[4~"  end-of-line

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[M" kill-word
bindkey "^H" backward-kill-word
bindkey "^[[3~" delete-char
bindkey "^[[H"  beginning-of-line
bindkey "^[[4~"  end-of-line

# # alt-bs
# bindkey "\e\d"  undo

# ---------------------------------------------------------------------------- #
# Kopirano iz .bashrc
# ---------------------------------------------------------------------------- #

# alias ls='ls --color=auto'
alias ls="ls -la --color=auto"
alias grep='grep --color=auto'
alias c="clear"
alias e="vim"
alias m="sudo mc"
alias mx="alsamixer"
alias n="neofetch"
alias h="htop"
alias sreb="sudo reboot"
alias srv="/home/korisnik/.dwm/server_start.sh"
alias srx="/home/korisnik/.dwm/server_down.sh"
alias syu="sudo pacman -Syu"
alias r="ranger"
alias z="exit"
alias gs='cd ~/git/st'
alias gd='cd ~/git/dwm'
alias gm='cd ~/git/dmenu'
alias ii='sudo make clean install'
alias scrot='scrot ~/slike/screenshots/%b%d::%H%M%S.png'
alias wi='sudo rfkill unblock wifi'
## alias x="xrdb ~/.Xresources"
# alias ms='sudo mount /dev/sdc4 /home/korisnik/samsung'
# alias ums='cd /home/korisnik/;sudo umount /home/korisnik/samsung'
# alias blender='/home/korisnik/git/blender-3.0.0-linux-x64/blender'
# alias cad='/home/korisnik/git/FreeCAD-asm3-Stable-Conda-Py3-Qt5-20211015-glibc2.12-x86_64.AppImage'

# ./.samo_prvi_neofetch.sh
# neofetch
# export PATH=$PATH:~/git/blender-3.0.0-linux-x64

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# PS1="%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$ "
PS1="[%n@%M %{$fg[yellow]%}%~%{$reset_color%}]%{$fg[blue]%}$%{$reset_color%} "

# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# setxkbmap -layout us -option caps:escape; xmodmap -e 'clear lock'
numlockx on

source /home/korisnik/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

