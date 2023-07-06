# source function, aliases and prompts files

function init {
    load_folder "aliases"
    load_folder "functions"
    load_folder "prompts"
}

function load_folder {
    local FOLDER_NAME

    FOLDER_PATH=~/.config/zsh/$1

    for f in $(find $FOLDER_PATH -type f); do
        source $f
    done
}

init

unset -f load_folder init
