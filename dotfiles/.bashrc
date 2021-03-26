#         __               __             
#        / /_  ____ ______/ /_  __________
#       / __ \/ __ `/ ___/ __ \/ ___/ ___/
#    _ / /_/ / /_/ (__  ) / / / /  / /__  
#   (_)_.___/\__,_/____/_/ /_/_/   \___/  


[[ $- != *i* ]] && return
[[ -f ~/.bash_env ]] && . ~/.bash_env
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_prompt ]] && . ~/.bash_prompt
[[ -f ~/.bash_functions ]] && . ~/.bash_functions

HISTSIZE=HISTSIZE

neofetch