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

mkdir -pv ~/Documents
mkdir -pv ~/Pictures
mkdir -pv ~/Downloads
mkdir -pv ~/Music
mkdir -pv ~/Videos
mkdir -pv ~/Screenshots
mkdir -pv ~/mpv_screenshots
mkdir -pv ~/AppImages
mkdir -pv /usr/share/cmus/
mkdir -p ~/wm
sudo mkdir -p /usr/local/share/fonts

for f in functions/*; do source $f; done

for i in "$@"; do
  case $i in
    -h|--help)
      help
      shift
      ;;
    --install)
      install_packages
      shift
    ;;
  esac
done
# pacman -Qqen > pacman_pkglist
# yay -Qqem > yay_pkglist

# pacman -S - < pacman_pkglist
# yay -S - < yay_pkglist

# git clone -b <branchname> <remote-repo-url>
