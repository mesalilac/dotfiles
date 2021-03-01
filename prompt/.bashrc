#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
    PS1="[$lightRed\u$reset@$lightYellow\h $lightMagenta\W$reset]\n"
    PS1+="$lightGreen\$$reset "
}

# aliases 
alias ls='ls --color=auto'
alias cnf='clear && neofetch'
#alias rkl="sudo python3 ~/Keyboard_layout.py"

# set bash history size
HISTSIZE=10000

prompt
neofetch
