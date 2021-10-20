autoload -U colors && colors
autoload -U promptinit; promptinit

prompt spaceship
#eval "$(starship init zsh)"

HISTSIZE=999999999
SAVEHIST=999999999
HISTFILE=~/.zsh_history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

bindkey "^?" backward-delete-char
bindkey -s "^g" ". lc\n"

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
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"

zsh_profile=".shell_profile/zsh"

[[ -f ~/$zsh_profile/.zsh_aliases ]] && . ~/$zsh_profile/.zsh_aliases
[[ -f ~/$zsh_profile/.zsh_functions ]] && . ~/$zsh_profile/.zsh_functions
[[ -f ~/$zsh_profile/.zsh_prompt ]] && . ~/$zsh_profile/.zsh_prompt

# plugins
[[ -f $zsh_profile/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
  . $zsh_profile/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f $zsh_profile/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
  . $zsh_profile/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


