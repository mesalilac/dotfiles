# functions for python virtual envs

# activate virtual env
function ave() {
    local VENV

    if [[ -n "$1" ]]; then
        VENV="$1"
    else
        VENV="venv"
    fi

    if [[ ! -d "$VENV" ]]; then
        echo "Error: Virtual env '$VENV' does not exists!"
        return 1
    fi

    source "$VENV/bin/activate"
}

# create virtual env
function cve() {
    local VENV

    if [[ -n "$1" ]]; then
        VENV="$1"
    else
        VENV="venv"
    fi

    if [[ -d "$VENV" ]]; then
        echo "Error: Virtual env '$VENV' already exists!"
        return 1
    fi

    virtualenv "$VENV"
}

# remove virtual env
function rve() {
    local VENV

    if [[ -n "$1" ]]; then
        VENV="$1"
    else
        VENV="venv"
    fi

    if [[ ! -d "$VENV" ]]; then
        echo "Error: Virtual env '$VENV' does not exists!"
        return 1
    fi

    # Note: (( $+commands[x] )) is for zsh only!
    if (( $+commands[deactivate] )); then
        echo "deactivated $VENV"
    fi

    rm -rf "$VENV" && echo "'$VENV' Removed!"
}

