# --------------------------------------------------------------------------- #
autoload -U colors && colors
autoload -Uz compinit
compinit -C -d $XDG_CONFIG_HOME/zsh/.zcompdump
autoload -Uz promptinit
promptinit
# --------------------------------------------------------------------------- #
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*'     check-for-changes true
zstyle ':vcs_info:*'     unstagedstr       '%F{1}[u]%F{$reset_color}'
zstyle ':vcs_info:*'     stagedstr         '%F{1}[s]%F{$reset_color}'
zstyle ':vcs_info:git:*' formats           ' [%b]%c%u'
zstyle ':vcs_info:*'     enable git
# --------------------------------------------------------------------------- #
HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT='[%F %T] '
setopt extendedglob
# --------------------------------------------------------------------------- #
# ---------------- #
# Vim mode:
# ---------------- #
bindkey -v
# ---------------- #
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[M"    kill-word
bindkey "^H"      backward-kill-word
bindkey "^[[3~"   delete-char
bindkey "^[[H"    beginning-of-line
bindkey "^[[4~"   end-of-line
# ---------------------------------------------------------------------------- #
# Alias
# ---------------------------------------------------------------------------- #
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gl='git log'
# --------------- #
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
# alias ls='ls --color=auto'
alias a="source /home/korisnik/.config/zsh/zsh_dodatne_opcije"
alias ls="ls -lhA --color=auto --group-directories-first"
alias grep='grep --color=auto'
alias c="clear"
alias e="vim"
alias m="sudo mc"
alias mx="amx.sh"
alias n="neofetch"
alias h="htop"
alias pp="python"
alias jj="node"
alias srv="/home/korisnik/.dwm/server_start.sh"
alias srx="/home/korisnik/.dwm/server_down.sh"
alias syu="sudo pacman -Syyu"
alias f="lfrun"
alias z="exit"
# --------------- #
alias ggs='cd ~/git/st'
alias ggd='cd ~/git/dwm'
alias ggm='cd ~/git/dmenu_5_0'
alias ggl='cd ~/git/slock'
alias ii='sudo make clean install'
# --------------- #
alias scrot='scrot ~/slike/screenshots/%b%d::%H%M%S.png'
alias sxiv='rifle_sxiv.sh'
alias wi='sudo rfkill unblock wifi'
alias uwi='sudo rfkill block wifi'
alias x="startx"
# --------------------------------------------------------------------------- #
zstyle ':completion:*' completer _expand_alias _complete _ignored
# ./.samo_prvi_neofetch.sh
# neofetch
# export PATH=$PATH:~/git/blender-3.0.0-linux-x64
# --------------------------------------------------------------------------- #
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# --------------------------------------------------------------------------- #
# PROMPT
# --------------------------------------------------------------------------- #
LAST_ERROR=%(?.""."%{$fg[magenta]%}[%?] %{$reset_color%}")
PS1='%F{75}%n@%M %F{220}%~%F{252}${vcs_info_msg_0_} %F{2}%#%F{$reset_color} $LAST_ERROR%F{173}> %{$reset_color%}'
# ---------------------------- #
# Mini prompt
# ---------------------------- #
# PS1='%F{220}%~%F{252}${vcs_info_msg_0_} %F{2}%#%F{$reset_color} $LAST_ERROR%F{173}> %{$reset_color%}'
# ---------------------------- #
# Fancy prompt sa strelicama
# ---------------------------- #
# P_1='%K{27}%F{0} korisnik@rs1 %K{202}%F{27}%F{7}'
# P_2=' %~ %K{2}%F{202}%F{0}'
# PS1='$P_1$P_2${vcs_info_msg_0_} %# ${LAST_ERROR}%K{default}%F{2}%{$reset_color%} '
# --------------------------------------------------------------------------- #
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] # && exec startx
# --------------------------------------------------------------------------- #
source /home/korisnik/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/korisnik/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# --------------------------------------------------------------------------- #
export PATH=$PATH:"$HOME/.config/yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# --------------------------------------------------------------------------- #

