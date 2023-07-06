#!/bin/env bash

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

source "$HOME/.config/bash/.bash_env"
source "$HOME/.config/bash/.bash_aliases"
source "$HOME/.config/bash/.bash_prompt"
source "$HOME/.config/bash/.bash_functions"

HISTSIZE=HISTSIZE

eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

. "$HOME/.cargo/env"
