# ################################

# Fichier de configuration de BASH
# ~/.bashrc

# ################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Auto completion
if [ -f /etc/bash_completion ] ;
    then . /etc/bash_completion
fi

# ###### Console Prompt ######
# PS1='[\u@\h \W]\$ ' Par defaut
# PS1="[\[\033[0;36m\]\u\[\033[0m\]] [\[\033[0;32m\]\H\[\033[0m\]] [\[\033[0;33m\]\w\[\033[0m\]] > "

PS1='\[\e[0;34m\]├──\[\e[1;35m\]| \[\e[0;35m\]\u\[\e[0;34m\] \[\e[1;35m\]|\[\e[0;34m\] \[\e[0;33m\]\H\[\e[0;34m\] \[\e[1;35m\]| \[\e[0;32m\]\w\[\e[0;34m\] \[\e[1;35m\]|\[\e[0;34m\]`__git_ps1` \n └─\[\e[1;35m\]| \[\e[0;36m\]\D{%d/%m/%y %H:%M:%S UTC%z %Z}\[\e[0;34m\] \[\e[1;35m\]|\[\e[0;34m\]──\[\e[1;35m\]╼\[\e[1;36m\] \e[0m'
# ###### Aliases ######

# Activation de la couleur
export LS_OPTIONS='--color=auto'
eval "`dircolors`"

export EDITOR="vim"
export VISUAL="vim"
export PAGER="less -r"

# Raccourcis
alias grep='grep $LS_OPTIONS'
alias ls='ls $LS_OPTIONS -lX'
alias c='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias df='df -h'
alias dfall='df -h | grep /dev/sda'
alias du='du -c -h'
alias mkdir='mkdir -p'
alias nano='vim'
alias ping='ping -c 100'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls='echo -ne "\033c"'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias pgmodeler='/opt/pgmodeler/start.sh &'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias halt='systemctl halt'
alias arch='alsi -a -u'
alias search="yaourt --color --pager -Ss"
alias systemctl="sudo systemctl"
alias dmesg='dmesg --color=always | less -r'
alias digs='dig +short'
alias digr='dig +short -x'
alias digt='dig +nocmd +noall +answer'
alias diga='dig +noauthority +noquestion +noadditional +nostats'

# SSH servers
alias franklin='ssh hardware@franklin.meshup.net -p 48151'
alias burrows='ssh hardware@burrows.meshup.net -p 48151'
alias bagwell='ssh hardware@bagwell.meshup.net -p 48151'
alias scofield='ssh hardware@scofield.meshup.net -p 48151'
alias patoshik='ssh hardware@patoshik.meshup.net -p 48151'
alias dockxvm="ssh hardware@91.121.40.5"
alias buttersstotch="ssh hardware@91.121.40.5"
alias kennymccormick="ssh hardware@188.165.168.162"

# VPN server
vpn() { sudo systemctl $1 openvpn@cyberghost.service; }

# ###### Git auto completion ######

source ~/.git-completion.bash
source ~/.git-prompt.sh
source /usr/share/doc/pkgfile/command-not-found.bash

# Fonction d'extraction de fichers compressÃ©s
# Formats : tar, gz, bz2, zip, rar, tbz2, tgz

extract () {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)  tar xjf $1 ;;
        *.tar.gz)   tar xzf $1 ;;
        *.bz2)      bunzip2 $1 ;;
        *.rar)      rar x   $1 ;;
        *.gz)       gunzip  $1 ;;
        *.tar)      tar xf  $1 ;;
        *.tbz2)     tar xjf $1 ;;
        *.tgz)      tar xzf $1 ;;
        *.zip)      unzip   $1 ;;
        *.7z)       7z x    $1 ;;
        *)          echo "Format de fichier non reconnu..." ;;
        esac
    else
        echo "Format de fichier invalide..."
    fi
}

PATH=$PATH:/home/hardware/.gem/ruby/2.2.0/bin
