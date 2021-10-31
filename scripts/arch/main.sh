# !/usr/bin/bash

function help() {
  echo -e "
  help\t print this message 
  install\t install packages and copy files
  backup\t backup packages and dotfiles
  "
}

# Print help message if no arg is found
if [[ $# = 0 ]]; then
  help
fi

if pacman -Qe "yay" > /dev/null ; then
  echo
  else
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
fi

for f in functions/*; do source $f; done

for i in "$@"; do
  case $i in
    help)
      help
      shift
      ;;
    install)
      install_packages
      shift
    ;;
    backup)
      backup
      shift
    ;;
  esac
done