#!/bin/bash

# ======================================================================================
#
#         FILE:  function.sh
#       AUTHOR:  Henry Mai <henryfromvietnam@gmail.com>
#      COMPANY:  ---
#        USAGE:  Source this file in .bashrc
#  DESCRIPTION:  User-defined aliases
#      CREATED:  Mar 27, 2022
#
# ======================================================================================

# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#                        _    _     ___    _    ____  _____ ____
#                       / \  | |   |_ _|  / \  / ___|| ____/ ___|
#                      / _ \ | |    | |  / _ \ \___ \|  _| \___ \
#                     / ___ \| |___ | | / ___ \ ___) | |___ ___) |
#                    /_/   \_\_____|___/_/   \_\____/|_____|____/
#
# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

# Add an "alert" alias for long running commands.
# Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && \
  echo terminal || echo error)" "$(history|tail -n1|sed \
  -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ls / exa aliases
alias ls='exa'
alias l='ls'
alias ll='exa -alhF'
alias la='ll --git'
alias tree='exa --tree --long'

# git aliases
alias gsh='git-sh'
alias gitsh='git-sh'
alias gst='git st'
alias gts='git st'
alias gcc='git cc'
alias gcm='git cm'
alias gca='git ca'
alias gdiff='gd'
alias gadd='ga'
alias gcl='git clone'
alias gco='git checkout'
alias gpsuh='gpush'
alias gpuhs='gpush'

# cd aliases
alias ..='cd ..'
alias ....='cd ../..'
alias cd..='cd ..'
alias cd....='cd ../..'
alias cc='cd /mnt/c/Users/TanDucMai/OneDrive\ -\ University\ of\ South\ Australia &&\
  clear && ls'
alias W='cd ~/myportfolio && clear && ls -l'
alias V='cd ~/.vim && clear && ls -l'
alias F='cd ~/.files && clear && ls -l'
alias P='cd ~/.password-store && clear && ls -l'

# File aliases
alias bashrc='vim ~/.files/bash/bashrc'
alias vimrc='vim ~/.vim/vimrc'
alias gitconf='vim ~/.files/git/gitconfig'
alias func='vim ~/.files/sh/function.sh'
alias installer='vim ~/.files/sh/installer'
alias aliasconf='vim ~/.files/sh/alias.sh'

# vi aliases
alias e='vim -o'
alias E='vim -o'
alias vim='vim -o'
alias vi='e3vi' # Miminal vim

# View aliases
alias view='xdg-open'
alias open='view'
alias opne='open'
alias e3='e3vi'

# Other aliases
alias py='python3'
alias ex='exit'
alias cl='clear'
alias ddate='date +"%R - %a, %B %d, %Y"'
alias dday='date +"%d-%m-%Y"'
alias toilet='toilet -t -f mono12 --filter border:metal -F metal'
alias toiletgay='toilet --filter border:gay -F gay'
alias sqlformat='sqlformat -s --reindent --keywords upper --identifiers lower'
alias pipinstall='python3 -m pip install --upgrade install'
alias updatedb='sudo updatedb'
alias hugodeploy='hugo --cleanDestinationDir --gc'

## Example: cat vimrc | CountChars
alias CountChars='sed "s/\(.\)/\n\1/g" | sort | uniq -c | sort -gr | column'

# Link aliases
yt='https://youtube.com'
fb='https://facebook.com'
hugodeploy='https://app.netlify.com/sites/tanducmai/overview'

