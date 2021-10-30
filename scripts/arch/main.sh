# !/usr/bin/bash

function help() {
  echo -e "
  -h --help\t print this message 
  "
}

# Print help message if no arg is found
if [[ $# = 0 ]]; then
  help
fi

for i in "$@"; do
  case $i in
    -h|--help)
      help
      shift
      ;;
  esac
done
# pacman -Qqen > pacman_pkglist
# yay -Qqem > yay_pkglist

# pacman -S - < pacman_pkglist
# yay -S - < yay_pkglist
