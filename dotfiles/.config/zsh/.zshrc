autoload -U colors && colors
autoload -U promptinit; promptinit

# prompt pure
# prompt spaceship
eval "$(starship init zsh)"

HISTSIZE=999999999
SAVEHIST=999999999
HISTFILE=~/.zsh_history
#HISTFILE=/tmp/.zsh_history
fpath+="$ZDOTDIR/.zfunc"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
setopt autocd
eval "$(zoxide init zsh)"

autoload -Uz vcs_info
precmd() {
    vcs_info
}
setopt PROMPT_SUBST

typeset -gA ZSH_HIGHLIGHT_STYLES
setopt interactivecomments
ZSH_HIGHLIGHT_STYLES[comment]="fg=#aeaeae"

bindkey -v
export KEYTIMEOUT=1

autoload -z edit-command-line
zle -N edit-command-line

function run_tmux {
    if [ -f "$(pwd)/.tmuxinator.yml" ]; then
        tmuxinator start
    else
        tmux
    fi
}

bindkey "^?" backward-delete-char
bindkey -s "^g" ". lfcd\n"
bindkey -s "^p" ". fuzzy_projects\n"
bindkey -s "^n" "nvim .\n"
bindkey -s "^t" run_tmux"\n"
bindkey "^X^E" edit-command-line

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() {
    echo -ne '\e[5 q' # Use beam shape cursor for each new prompt.
}

eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

source "${ZDOTDIR}/functions.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/prompt.zsh"
source "${ZDOTDIR}/prompt_purification.zsh"

# source "$HOME/clone/zap.git/improve-plug-function/zap.zsh"
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "djui/alias-tips"

# bun completions
# [ -f "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

