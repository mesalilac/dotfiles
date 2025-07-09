# go to external drive
alias ed='cd "/run/media/$USER/Toshiba external hard drive/"'
alias cd='z' # TODO: make `eval "$(zoxide init --cmd cd zsh)"`

alias diff="colordiff"
alias grep="grep --color=auto"
alias ccat="highlight --out-format=ansi"
alias edo="nvim ~/.todo"
alias calc="python -q"
alias cat="bat -pp --theme 'Visual Studio Dark+'"
alias catp="bat -p --theme 'Visual Studio Dark+'"
#alias yt="youtube-dl -o \"%(title)s.%(ext)s\" --add-metadata -ic"
#alias yta="youtube-dl --audio-format mp3 -o \"%(title)s.%(ext)s\" --add-metadata -xic"
alias cnf='clear && neofetch'
alias icat="kitty +kitten icat"
alias ..="cd .."

alias gs="git status"
alias gd="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gf="git fetch --prune"
alias gp="git push"

alias e='exa --header --modified --git --classify --icons --group-directories-first'
alias el='e -l'
alias ea='e -a'
alias ela='e -la'

# alias ls='ls --color=auto --group-directories-first'
# alias la="ls -A"
# alias ll="ls -lh"
# alias lla="ls -Alh"

alias ls='e'
alias la="ea"
alias ll="el"
alias lla="ela"

