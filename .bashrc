#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias c="clear"
alias e="vim"
alias ls="ls -la --color=auto"
alias m="sudo mc"
alias mx="alsamixer"
alias n="neofetch"
alias sr="sudo reboot"
alias srv="/home/korisnik/Podaci/Backup/server.sh"
alias srx="/home/korisnik/Podaci/Backup/server_down.sh"
alias syu="sudo pacman -Syu"
alias r="ranger"
alias x="xrdb ~/.Xresources"
alias z="exit"

alias scrot='scrot ~/Podaci/Fotografije/Screenshots/%b%d::%H%M%S.png'

neofetch
PS1='[\u@\h \W]\$ '
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
numlockx on

