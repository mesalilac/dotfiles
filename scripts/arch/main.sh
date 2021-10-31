# !/usr/bin/bash

function help() {
  echo -e "
  -h --help\t print this message 
  --install\t install packages and copy files
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

source functions/*

for i in "$@"; do
  case $i in
    -h|--help)
      help
      shift
      ;;
    --install)
      install_packages
      # copy_files
      shift
    ;;
  esac
done
# pacman -Qqen > pacman_pkglist
# yay -Qqem > yay_pkglist

# pacman -S - < pacman_pkglist
# yay -S - < yay_pkglist

# git clone -b <branchname> <remote-repo-url>
