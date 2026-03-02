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

alias ls="eza --icons -F --color --header --git --git-repos-no-status --time-style '+%Y-%m-%d %I:%M %p'"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -al"

