#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[ -z "$TMUX" ] && tmux && exit

PS1='\[\e[01;36m\][\u@\h\[\e[01;37m\] \W\[\e[01;36m\]]\$\[\e[0m\] '

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-cmd-mode-string \e[01;34m(NOR)\e[0m'
bind 'set vi-ins-mode-string \e[01;33m(INS)\e[0m'
bind -m vi 'j: backward-char'
bind -m vi 'k: history-search-forward'
bind -m vi 'l: history-search-backward'
bind -m vi 'm: forward-char'
# bind -m vi-command 'Control-l: clear-screen'
# bind -m vi-insert 'Control-l: clear-screen'

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Default
export PATH=$HOME/programme:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export EDITOR=/usr/bin/vim
export DOTFILE_BRANCH=compute-2

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Xmake
[ -s "$HOME/.xmake/profile" ] && source "$HOME/.xmake/profile" # load xmake profile

# Android
export ANDROID_HOME=/opt/android-sdk
export ANDROID_AVD_HOME=$HOME/.android/avd
export ANDROID_SDK_ROOT=$ANDROID_HOME
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH

# Flutter
export PATH="$PATH:/opt/flutter/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# alias syncdash="firefox-developer-edition localhost:8384"
# alias syncdash="pulse-browser localhost:8384"
alias syncdash="firefox localhost:8384"
alias backup_dotfile="backup -c .config_backup/config_dotfile.txt -o /media/veracrypt1/Backup -n dotfile_jarvis -s 3"
alias restore_dotfile="backup -r /media/veracrypt1/Backup -o / -n dotfile_jarvis"
alias backup_file="backup -c .config_backup/config.txt -o /media/veracrypt1/Backup -n backup -s 3"
alias restore_file="backup -r /media/veracrypt1/Backup -o / -n backup"
alias save_mdp="cp ~/Perso/Mots_de_passe.kdbx /media/veracrypt1/"
alias restore_mdp="cp /media/veracrypt1/Mots_de_passe.kdbx ~/Perso/"
alias git_dotfile="backup -g /home/lordpax/.config_backup/config_dotfile_git.txt jarvis -o /home/lordpax/Documents/dotfile"
alias getconf="getdotfile -o .config"

alias viminstall="vimc PlugInstall"
alias vimupdate="vimc PlugUpdate"
alias vimclean="vimc PlugClean"

alias df='df -h'
alias free='free -h'
alias more=less
alias ls='ls --color'
alias grep='grep --color=auto'
alias copy="xsel --clipboard -i"
alias paste="xsel --clipboard -o"
alias emacs="emacs -nw"
alias dust="dust -r"
alias ctagsx="ctags --exclude=node_modules --exclude=dist"
alias ll="ls -l"
alias vimex="vim -c Ex"
alias myip="curl ifconfig.me"
alias a='arsenal'
alias scim="sc-im"
alias mountme="sudo mount -o uid=1000,gid=1000"

alias ga="git add"
alias gaa="git add --all"
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

alias dp="docker ps"
alias dpa="docker ps -a"
alias di="docker image"
alias de="docker exec"
alias dc="docker compose"
alias dk="docker kill"
alias dr="docker run"
alias dka="docker kill $(docker ps -q)"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcl="docker compose logs"
alias dce="docker compose exec"
alias dcb="docker compose build"

function vimf() {
    [ "$1" == "" ] && echo "Usage : vimf <file>" &> /dev/stderr && return 1
    vim -c "find $1"
}

function vimc() {
    [ "$1" == "" ] && echo "Usage : vimc <command>" &> /dev/stderr && return 1
    vim -c "$1"
}

function vimack() {
    [ "$1" == "" ] && echo "Usage : vimack <command>" &> /dev/stderr && return 1
    vim -c "Ack! $1"
}

function psgrep() {
    [ "$1" == "" ] && echo "Usage : psgrep <process>" &> /dev/stderr && return 1
    ps -aux | grep "$1" | grep -v grep
}

function chmog() {
    [ $# -ne 4 ] && echo "Usage : chmog <user> <group> <mode> <file>" &> /dev/stderr && return 1
    chmod "$1" "$4"
    chown "$2" "$4"
    chgrp "$3" "$4"
}

function cdf() {
    local file=$(fzf)
    [ -z "$file" ] && return 1
    cd "$(dirname "$file")" || return 1
}

function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
