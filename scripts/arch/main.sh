load () {
    [[ -f "$1" ]] && . "$1" || echo "can't load $1"
}

pac () {
    echo -e "\n\033[1;32minstalling\033[0m $1\n"
    sudo pacman -S $1 --noconfirm || echo "can't install $1 using pacman" >> ~/log
}

ya () {
    echo -e "\n\033[1;32minstalling\033[0m $1\n"
    yay -S $1 || echo "can't install $1 using yay" >> ~/log
}

if pacman -Qe "fzf" > /dev/null ; then
        echo
    else
        pac "fzf"
fi

clear

load "config.sh"

main_menu=$(echo -e "packages
window manager
terminal
update
quit" | fzf --layout=reverse)

[[ $main_menu == "packages" ]] && load "lib/packages.sh"
[[ $main_menu == "window manager" ]] && load "lib/window_manager.sh"
[[ $main_menu == "terminal" ]] && load "lib/terminal.sh"
[[ $main_menu == "update" ]] && sudo pacman -Syu
