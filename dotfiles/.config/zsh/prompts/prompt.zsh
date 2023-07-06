# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

prompt_1() {
    PROMPT="[$fg[red]%}%n%{$reset_color%}@$fg[yellow]%}%M $fg[magenta]%}%~%{$reset_color%}] "
    PROMPT+="$fg[green]%}\$%{$reset_color%} "
    RPROMPT=""
}

prompt_2() {
    PROMPT="$fg[green]%}%~%{$reset_color%} $fg[blue]%}𝝺%{$reset_color%} "
    RPROMPT=""
}

prompt_3() {
    PROMPT="$fg[red]%}%n%{$reset_color%} $fg[magenta]%}%~%{$reset_color%} $fg[blue]%}➤%{$reset_color%} "
    RPROMPT=""
}

prompt_4() {
    PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
    RPROMPT=""
}

prompt_5() {
    zstyle ':vcs_info:git:*' formats '%F{magenta}[%b]%f'

    PROMPT='%F{green}%n@%M%F{white} %F{cyan}%~%f ${vcs_info_msg_0_}
%(?.%F{green}.%F{red})﬌%f%b '
    RPROMPT='%F{yellow}%@%f'
}

prompt_6() {
    zstyle ':vcs_info:git:*' formats '%K{magenta}%F{black} [%b] %K{default}'

    PROMPT='%K{green}%F{black} %n@%M %K{default} %K{cyan}%F{black} %~ %f%K{default} ${vcs_info_msg_0_}
%(?.%F{green}.%F{red})﬌%f%b '
    RPROMPT='%K{yellow}%F{black}%@ %f%K{default}'
}

