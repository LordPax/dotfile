#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export LC_ALL="C"

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\e[01;36m\][\u@\h\[\e[01;37m\] \W\[\e[01;36m\]]\$\[\e[0m\] '

# alias connect='~/programme/connect/connect_univ.sh'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

PATH=$PATH:/home/lordpax/programme:/home/lordpax/programme/emsdk:/home/lordpax/programme/emsdk/node/14.18.2_64bit/bin:/home/lordpax/programme/emsdk/upstream/emscripten


export EDITOR=vim

[ -z $TMUX ] && tmux

alias backup_dotfile="backup -c .config_backup/config_dotfile.txt -o /mnt/veracrypt1/Backup -n dotfile -s 1"
alias restore_dotfile="backup -r /mnt/veracrypt1/Backup -o / -n dotfile"
alias backup_file="backup -c .config_backup/config.txt -o /mnt/veracrypt1/Backup -n backup -s 1"
alias restore_file="backup -r /mnt/veracrypt1/Backup -o / -n backup"
alias save_mdp="cp ~/Mots_de_passe.kdbx /mnt/veracrypt1/"
alias restore_mdp="cp /mnt/veracrypt1/Mots_de_passe.kdbx ~/"
alias git_dotfile="backup -g /home/lordpax/.config_backup/config_dotfile_git.txt compute-1 -o /home/lordpax/Documents/dotfile"
alias get_vimrc="mv ~/.vimrc ~/.vimrc_old; wget https://raw.githubusercontent.com/LordPax/dotfile/compute-2/.vimrc"
alias emacs="emacs -nw"

alias copy="xsel --clipboard -i"
alias connect_HDMI="xrandr --output HDMI-1 --left-of eDP-1"
