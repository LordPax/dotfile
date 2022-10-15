#
# ~/.bashrc
#

[[ $- != *i* ]] && return

PS1=' \[\e[01;36m\][\u@\h\[\e[01;37m\] \W\[\e[01;36m\]]\$\[\e[0m\] '

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-cmd-mode-string \e[01;34m(cmd)'
bind 'set vi-ins-mode-string \e[01;33m(ins)'
bind -m vi 'j':'backward-char'
bind -m vi 'k':'history-search-forward'
bind -m vi 'l':'history-search-backward'
bind -m vi 'm':'forward-char'

alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias ls='ls --color'

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias backup_file="backup -c /home/lordpax/.config_backup/config.txt -o /save -s 3"
alias backup_file_usb="backup -c /home/lordpax/.config_backup/config.txt -o /mnt/veracrypt1/Backup -n backup_compute2 -s 3"
alias backup_dotfile="backup -c /home/lordpax/.config_backup/config_dotfile.txt -o /save -n dotfile -s 3"
alias backup_dotfile_usb="backup -c /home/lordpax/.config_backup/config_dotfile.txt -o /mnt/veracrypt1/Backup -n dotfile_compute2 -s 3"
alias restore_file="backup -r /save -o /"
alias restore_file_usb="backup -r /mnt/veracrypt1/Backup -o / -n backup_compute2"
alias restore_dotfile="backup -r /save -o / -n dotfile"
alias restore_dotfile_usb="backup -r /mnt/veracrypt1/Backup -o / -n dotfile_compute2"
alias git_dotfile="backup -g /home/lordpax/.config_backup/config_dotfile_git.txt compute-2 -o /home/lordpax/Documents/dotfile"
# alias save_rapport="cp /home/lordpax/Documents/Alternance/Rapport_teddy_gauthier.odt /save"
alias save_rapport="backup -f /home/lordpax/Documents/Alternance/Rapport_teddy_gauthier.odt -o /save -n backup_rapport_alternance -s 3"

# alias save_mdp="keepassxc-cli merge /save/Mots_de_passe.kdbx Mots_de_passe.kdbx"
# alias restore_mdp="keepassxc-cli merge Mots_de_passe.kdbx /save/Mots_de_passe.kdbx"
alias save_mdp="cp ~/Perso/Mots_de_passe.kdbx /save"
alias restore_mdp="cp /save/Mots_de_passe.kdbx ~/Perso"
alias save_mdp_usb="keepassxc-cli merge /mnt/veracrypt1/Mots_de_passe.kdbx ~/Perso/Mots_de_passe.kdbx"
alias restore_mdp_usb="keepassxc-cli merge ~/Perso/Mots_de_passe.kdbx /mnt/veracrypt1/Mots_de_passe.kdbx"

alias backup_log="bat ~/.config_backup/backup.log"

alias copy="xsel --clipboard -i"
alias emacs="emacs -nw"
alias dust="dust -r"
alias ctagsx="ctags --exclude=node_modules --exclude=dist"

alias get_vimrc="mv ~/.vimrc ~/.vimrc_old; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-1/.vimrc"
alias get_tmux="mv ~/.tmux.conf ~/.tmux_old.conf; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-1/.tmux.conf"
alias get_picom="mv ~/.config/picom/picom.conf ~/.config/picom/picom_old.conf; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-1/picom/picom.conf -P ~/.config/picom/"
alias get_Xresources="mv ~/.Xresources ~/.Xresources_old; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-1/.Xresources"

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

[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
PATH=$PATH:/home/lordpax/programme:/home/lordpax/.local/bin:/home/lordpax/.local/share/gem/ruby/3.0.0/bin
export EDITOR=vim
[ -z $TMUX ] && tmux
