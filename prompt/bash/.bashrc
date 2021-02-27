#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=10000

neofetch

alias ls='ls --color=auto'

# colors
reset='\033[0m'

lightBlack='\033[1;90m'
lightRed='\033[1;91m'
lightGreen='\033[1;92m'
lightYellow='\033[1;93m'
lightBlue='\033[1;94m'
lightMagenta='\033[1;95m'
lightCyan='\033[1;96m'
lightWhite='\033[1;97m'

prompt () {
    PS1="[$lightRed\u"
    PS1+="$reset@"
    PS1+="\h "
    PS1+="$lightMagenta\W$reset]"

    PS1+="\n"
    PS1+="$lightGreen\$$reset "
}

prompt
