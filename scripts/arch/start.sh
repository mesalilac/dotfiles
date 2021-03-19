[[ $(pacman -Qe | grep lua) ]] || sudo pacman -S lua

lua main.lua