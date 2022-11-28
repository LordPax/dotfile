#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export LC_ALL="C"

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1="\[\e[01;36m\][\u@\h\[\e[01;37m\] \W\[\e[01;36m\]]\$\[\e[0m\] "

set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-cmd-mode-string \e[01;34m(cmd)'
bind 'set vi-ins-mode-string \e[01;33m(ins)'
bind -m vi 'j':'backward-char'
bind -m vi 'k':'history-search-forward'
bind -m vi 'l':'history-search-backward'
bind -m vi 'm':'forward-char'

# alias connect='~/programme/connect/connect_univ.sh'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

PATH=$PATH:$HOME/programme:$HOME/programme/emsdk:$HOME/programme/emsdk/node/14.18.2_64bit/bin:$HOME/programme/emsdk/upstream/emscripten:$HOME/go/bin

export EDITOR=vim
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export DOTFILE_BRANCH=compute-2

[ -z $TMUX ] && tmux

alias syncdash="firefox-developer-edition localhost:8384"
alias backup_dotfile="backup -c .config_backup/config_dotfile.txt -o /media/veracrypt1/Backup -n dotfile_compute1 -s 1"
alias restore_dotfile="backup -r /media/veracrypt1/Backup -o / -n dotfile_compute1"
alias backup_file="backup -c .config_backup/config.txt -o /media/veracrypt1/Backup -n backup -s 1"
alias restore_file="backup -r /media/veracrypt1/Backup -o / -n backup"
alias save_mdp="cp ~/Perso/Mots_de_passe.kdbx /media/veracrypt1/"
alias restore_mdp="cp /media/veracrypt1/Mots_de_passe.kdbx ~/Perso/"
alias git_dotfile="backup -g /home/lordpax/.config_backup/config_dotfile_git.txt compute-1 -o /home/lordpax/Documents/dotfile"

# alias get_vimrc="mv ~/.vimrc ~/.vimrc_old; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-2/.vimrc"
# alias get_tmux="mv ~/.tmux.conf ~/.tmux-old.conf; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-2/.tmux.conf"
# alias get_picom="mv ~/.config/picom/picom.conf ~/.config/picom/picom_old.conf; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-2/picom/picom.conf -P ~/.config/picom/"
# alias get_Xresources="mv ~/.Xresources ~/.Xresources_old; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-2/.Xresources"

alias emacs="emacs -nw"
alias dust="dust -r"
alias ll="ls -l"
alias copy="xsel --clipboard -i"
alias connect_HDMI="xrandr --output HDMI-1 --left-of eDP-1"
alias vimex="vim -c Ex"

alias ga="git add"
alias gaa="git add *"
alias gpu="git push origin"
alias gpum="git push origin master"
alias gpud="git push origin develop"
alias gpl="git pull origin"
alias gplm="git pull origin master"
alias gpld="git pull origin develop"
alias gs="git status"
alias gch="git checkout"
alias gco="git commit"
alias gl="git log"
alias gb="git branch"

function vimf() {
    [ "$1" == "" ] && echo "Usage : vimf <file>" &> /dev/stderr && return 1
    vim -c "find $1"
}

function vimc() {
    [ "$1" == "" ] && echo "Usage : vimc <command>" &> /dev/stderr && return 1
    vim -c $1
}

function vimack() {
    [ "$1" == "" ] && echo "Usage : vimack <command>" &> /dev/stderr && return 1
    vim -c "Ack! $1"
}

function psgrep() {
    [ "$1" == "" ] && echo "Usage : psgrep <process>" &> /dev/stderr && return 1
    ps -aux | grep $1 | grep -v grep
}

function chmog() {
    [ $# -ne 4 ] && echo "Usage : chmog <user> <group> <mode> <file>" &> /dev/stderr && return 1
    chmod $1 $4
    chown $2 $4
    chgrp $3 $4
}
