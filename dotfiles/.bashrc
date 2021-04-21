#         __               __             
#        / /_  ____ ______/ /_  __________
#       / __ \/ __ `/ ___/ __ \/ ___/ ___/
#    _ / /_/ / /_/ (__  ) / / / /  / /__  
#   (_)_.___/\__,_/____/_/ /_/_/   \___/  

reset='\033[0m'
lightBlack='\033[1;90m'
lightRed='\033[1;91m'
lightGreen='\033[1;92m'
lightYellow='\033[1;93m'
lightBlue='\033[1;94m'
lightMagenta='\033[1;95m'
lightCyan='\033[1;96m'
lightWhite='\033[1;97m'

[[ $- != *i* ]] && return
[[ -f ~/.profile/bash/.bash_env ]] && . ~/.profile/bash/.bash_env
[[ -f ~/.profile/bash/.bash_aliases ]] && . ~/.profile/bash/.bash_aliases
[[ -f ~/.profile/bash/.bash_prompt ]] && . ~/.profile/bash/.bash_prompt
[[ -f ~/.profile/bash/.bash_functions ]] && . ~/.profile/bash/.bash_functions

HISTSIZE=HISTSIZE
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

