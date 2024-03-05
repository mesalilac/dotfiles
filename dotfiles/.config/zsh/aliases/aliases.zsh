# go to external drive
alias ed='cd "/run/media/$USER/Toshiba external hard drive/"'

alias grep="grep --color=auto"
alias grep_from_all="grep --exclude-dir='.git/' --exclude-dir='target/' --exclude='Cargo.lock' -R"
alias ccat="highlight --out-format=ansi"
alias sysinfo="inxi -Fx"
alias memory-info="sudo inxi -m"
alias edo="nvim ~/.todo"
alias calc="python3 -q"
alias cat="bat -pp --theme 'gruvbox-dark'"
alias catp="bat -p --theme 'gruvbox-dark'"
alias snv="sudo nvim"
#alias yt="youtube-dl -o \"%(title)s.%(ext)s\" --add-metadata -ic"
#alias yta="youtube-dl --audio-format mp3 -o \"%(title)s.%(ext)s\" --add-metadata -xic"
alias rm="rm -I"
alias cnf='clear && neofetch'
alias icat="kitty +kitten icat"
alias ..="cd .."
