#         __               __              ___                     
#        / /_  ____ ______/ /_      ____ _/ (_)___ _________  _____
#       / __ \/ __ `/ ___/ __ \    / __ `/ / / __ `/ ___/ _ \/ ___/
#    _ / /_/ / /_/ (__  ) / / /   / /_/ / / / /_/ (__  )  __(__  ) 
#   (_)_.___/\__,_/____/_/ /_/____\__,_/_/_/\__,_/____/\___/____/  
#                           /_____/                                


alias ls='ls --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias ccat="highlight --out-format=ansi"

alias gs="git status"
alias gd="git add"
alias gc="git commit -m"
alias gp="git push"
alias la="ls -A"
alias ll="ls -lh"
alias lla="ls -Alh"
alias nv="nvim"
alias snv="sudo nvim"
alias yt="youtube-dl -o \"%(title)s.%(ext)s\" --add-metadata -ic"
alias yta="youtube-dl -o \"%(title)s.%(ext)s\" --add-metadata -xic"
alias rm="rm -I"
alias cnf='clear && neofetch'
alias icat="kitty +kitten icat"
alias ..="cd .."
