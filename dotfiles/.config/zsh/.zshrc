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
# zstyle ':completion:*' menu select
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
# zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zmodload zsh/complist
compinit
_comp_options+=(globdots)
setopt autocd
eval "$(zoxide init zsh)"

autoload -Uz add-zsh-hook

clear_icat_images() {
    printf "\x1b_Ga=d,d=A\x1b\\"
}

add-zsh-hook precmd clear_icat_images

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
bindkey -s "^e" "ea\n"
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
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"

# bun completions
# [ -f "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

