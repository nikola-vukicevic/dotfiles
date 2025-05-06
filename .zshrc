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
zstyle ':vcs_info:*'     stagedstr         '%F{2} ✚%F{$reset_color}'
zstyle ':vcs_info:*'     unstagedstr       '%F{167} ●%F{$reset_color}'
# zstyle ':vcs_info:git:*' branchformat      '%b'
zstyle ':vcs_info:git:*' formats           ' %F{245}%b%F{$reset_color}%c%u'
# zstyle ':vcs_info:git:*' formats           ' %F{245}> %b%F{$reset_color}%c%u'
# zstyle ':vcs_info:git:*' formats           ' > %b%c%u'
# zstyle ':vcs_info:*'     stagedstr         '%F{2}[s]%F{$reset_color}'
# zstyle ':vcs_info:*'     unstagedstr       '%F{215}[u]%F{$reset_color}'
# zstyle ':vcs_info:git:*' formats           ' [%b]%c%u'
zstyle ':vcs_info:*'     enable git
# --------------------------------------------------------------------------- #
HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
# ----- #
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
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
bindkey "^[r" fzf-history-widget
# ---------------------------------------------------------------------------- #
# Alias
# ---------------------------------------------------------------------------- #
alias gs='git status'
alias gc='git commit'
alias ga='git add .'
alias gl='git log'
alias glo='git log --oneline'
alias glf='git log --all --graph'
alias gla='git log --all --graph --oneline'
alias lg='lazygit'
# --------------- #
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
# alias ls='ls --color=auto'
alias a="source /home/korisnik/.config/zsh/zsh_dodatne_opcije"
alias ls="ls -lhA --color=auto --group-directories-first"
alias grep='grep --color=auto'
alias du='du -h -s'
alias df='df -h'
alias dc='deactivate'
alias c="clear"
alias vim="nvim"
alias e="nvim"
alias em="nvim 'barebones'"
alias E="cat files | xargs -o nvim"
alias m="sudo mc"
alias mm="neomutt"
alias mx="amx.sh"
alias n="nnn -d -H"
alias nn="neofetch"
alias h="htop"
alias pp="python"
alias jj="node"
alias srv="/home/korisnik/.dwm/server_start.sh"
alias srx="/home/korisnik/.dwm/server_down.sh"
alias syu="sudo pacman -Syyu"
alias f="lfrun"
alias dosbox="dosbox -conf '/home/korisnik/.config/dosbox/dosbox-0.74-3.conf'"
alias tt="ctags -R *"
alias z="exit"
# --------------- #
alias ggs='cd ~/git/01_suckless/st_0_9_2'
alias ggd='cd ~/git/01_suckless/dwm_6_5'
alias ggm='cd ~/git/01_suckless/dmenu_5_3'
alias ggl='cd ~/git/01_suckless/slock'
alias ii='sudo make clean install'
alias cf='clang-format -style=file:/home/korisnik/.config/clangd/clang_format'
# --------------- #
alias scrot='scrot ~/slike/screenshots/%b%d::%H%M%S.png'
alias sxiv='rifle_sxiv.sh'
alias wi='sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant_mts.conf'
alias wi_orion='sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant_orion.conf'
# alias wi='sudo rfkill unblock wifi'
# alias uwi='sudo rfkill block wifi'
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
LAST_ERROR=%(?.""."%B%F{166}[%?] %{$reset_color%}")
# LAST_ERROR=%(?.""."%{$fg[red]%}[%?] %{$reset_color%}")
PS1='%B%F{105}%n@%M %F{215}%~%b%F{252}${vcs_info_msg_0_} %F{108}%#%F{$reset_color} $LAST_ERROR%F{186}> %{$reset_color%}'
# ---------------------------- #
# Mini prompt
# ---------------------------- #
# PS1='%F{220}%~%F{252}${vcs_info_msg_0_} %F{2}%#%F{$reset_color} $LAST_ERROR%F{173}> %{$reset_color%}'
# PS1='%F{220}%~%F{252}${vcs_info_msg_0_} %F{$reset_color}$LAST_ERROR%F{173}> %{$reset_color%}'
# PS1='%F{215}%~%F{252}${vcs_info_msg_0_} %F{108}%#%F{$reset_color} $LAST_ERROR%F{187}> %{$reset_color%}'
# ---------------------------- #
# Fancy prompt sa strelicama
# ---------------------------- #
# P_1='%K{27}%F{0} %n@%M %K{220}%F{27}%F{0}'
# P_2=' %~ %K{2}%F{220}%F{0}'
# PS1='$P_1$P_2${vcs_info_msg_0_} %# ${LAST_ERROR}%K{default}%F{2}%{$reset_color%} '
# --------------------------------------------------------------------------- #
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] # && exec startx
# --------------------------------------------------------------------------- #
source /home/korisnik/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/korisnik/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# --------------------------------------------------------------------------- #
export ZSH_AUTOSUGGEST_MANUAL_REBIND
export FZF_DEFAULT_OPTS_FILE=~/.config/fzfrc
export PATH=$PATH:"$HOME/.config/yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH":/home/korisnik/proba_lua/
# --------------------------------------------------------------------------- #

