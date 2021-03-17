#
# ~/.bashrc
#


[[ $- != *i* ]] && return
[[ -f ~/.env ]] && . ~/.env
[[ -f ~/.aliases ]] && . ~/.aliases


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
    PS1="[$lightRed\u$reset@$lightYellow\h $lightMagenta\W$reset] "
    PS1+="$lightGreen\$$reset "
}


HISTSIZE=HISTSIZE

prompt
neofetch
