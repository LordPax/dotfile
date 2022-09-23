#
# ~/.bashrc
#

[[ $- != *i* ]] && return

PS1='\[\e[01;36m\][\u@\h\[\e[01;37m\] \W\[\e[01;36m\]]\$\[\e[0m\] '

function colors() {
    local fgc bgc vals seq0

    printf "Color escapes are %s\n" '\e[${value};...;${value}m'
    printf "Values 30..37 are \e[33mforeground colors\e[m\n"
    printf "Values 40..47 are \e[43mbackground colors\e[m\n"
    printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

    # foreground colors
    for fgc in {30..37}; do
        # background colors
        for bgc in {40..47}; do
            fgc=${fgc#37} # white
            bgc=${bgc#40} # black

            vals="${fgc:+$fgc;}${bgc}"
            vals=${vals%%;}

            seq0="${vals:+\e[${vals}m}"
            printf "  %-9s" "${seq0:-(default)}"
            printf " ${seq0}TEXT\e[m"
            printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
        done
        echo; echo
    done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

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

# ex - archive extractor
# usage: ex <file>
function ext () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

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
alias save_mdp="cp ~/Mots_de_passe.kdbx /save"
alias restore_mdp="cp /save/Mots_de_passe.kdbx ~/"
alias save_mdp_usb="keepassxc-cli merge /mnt/veracrypt1/Mots_de_passe.kdbx Mots_de_passe.kdbx"
alias restore_mdp_usb="keepassxc-cli merge Mots_de_passe.kdbx /mnt/veracrypt1/Mots_de_passe.kdbx"

alias backup_log="bat ~/.config_backup/backup.log"

alias copy="xsel --clipboard -i"
alias emacs="emacs -nw"
alias dust="dust -r"
alias ctagsx="ctags --exclude=node_modules --exclude=dist"

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
PATH=$PATH:/home/lordpax/programme:/home/lordpax/.local/share/gem/ruby/3.0.0/bin
export EDITOR=vim
[ -z $TMUX ] && tmux
