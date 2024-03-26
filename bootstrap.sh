#!/usr/bin/env bash

set -eu

if [[ $(id -u) -eq 0 ]]; then
    echo "Don't run this script as root..."
    exit 1
fi

DOTFILES_DIR=$(dirname "$(readlink -f "$0")")

. "$DOTFILES_DIR/lib/packages.sh"
. "$DOTFILES_DIR/lib/colors.sh"

function log_info    { echo -e "[${IBlue} INFO ${NO_COLOR}] ${IYellow}$*${NO_COLOR}"; }
function log_error   { echo -e "[${IRed} ERROR ${NO_COLOR}] ${IYellow}$*${NO_COLOR}"; }
function log_warning { echo -e "[${IYellow} WARNING ${NO_COLOR}] ${IYellow}$*${NO_COLOR}"; }
function log_debug   { echo -e "[${IGreen} DEBUG ${NO_COLOR}] ${IYellow}$*${NO_COLOR}"; }

function pause_execution {
    local PROMPT_MESSAGE="Press any key to continue... "
    [[ -n $1 ]] && PROMPT_MESSAGE="$1"

    # stop executing the script and wait for any key press
    read -rsn1 -p "${PROMPT_MESSAGE}" ; echo
}

echo -e "$ICyan"
cat << "EOF"
    __                __       __
   / /_  ____  ____  / /______/ /__________ _____
  / __ \/ __ \/ __ \/ __/ ___/ __/ ___/ __ `/ __ \
 / /_/ / /_/ / /_/ / /_(__  ) /_/ /  / /_/ / /_/ /
/_.___/\____/\____/\__/____/\__/_/   \__,_/ .___/
                                         /_/
EOF
echo -e "$NO_COLOR"

### bootstrap system

log_info "Creating Directories"
mkdir -pv ~/Documents
mkdir -pv ~/Pictures
mkdir -pv ~/Downloads
mkdir -pv ~/Music
mkdir -pv ~/Videos
mkdir -pv ~/Screenshots
mkdir -pv ~/mpv_screenshots
mkdir -pv ~/AppImages
mkdir -pv ~/clone
mkdir -pv ~/suckless
mkdir -pv ~/.local/
mkdir -pv ~/.local/bin/

log_info "Downloading pacman packages"
sudo pacman -S --noconfirm --needed "${PACKMAN_PACKAGES[@]}"

log_info "Changing default shell to zsh!"
chsh -s "$(which zsh)"

log_info "Installing yay (aur helper)"
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si

# go back
cd "$DOTFILES_DIR"

log_info "Downloading aur packages"
yay -S --noconfirm --sudoloop --needed "${AUR_PACKAGES[@]}"

log_info "Running restore script"
"$DOTFILES_DIR/./restore.py"

log_info "Starting the smartd daemon"
sudo systemctl enable smartd.service --now

log_info "Enabling libvirtd"
sudo systemctl enable libvirtd --now

log_info "Adding ${USER} to libvirt group"
sudo usermod -a -G libvirt "$USER"

log_info "Installing yt-dlp (youtube donwloader)"
curl -L -o yt-dlp https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
chmod +x yt-dlp
mv yt-dlp ~/.local/bin/yt-dlp

# ERROR: CANT FIND DISPLAY
# log_info "flameshot setting --showhelp to false"
# flameshot config --showhelp false

log_info "jgmenu changing theme"
jgmenu_run init --theme=archlabs_1803

log_info "Installing vimv (bulk name files)"
git clone https://github.com/thameera/vimv.git
mv vimv/vimv ~/.local/bin/
chmod +x ~/.local/bin/vimv

log_info "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

log_info "Installing sccache"
# https://github.com/mozilla/sccache
cargo install sccache

log_info "Installing tree-sitter-cli"
cargo install tree-sitter-cli

log_info "Installing cmus-rpc"
cargo install --git https://github.com/MesaBytes/cmus-rpc.git

cd ~/suckless

#git clone https://github.com/siduck/st.git && cd st && sudo make install ; cd ..

# install dwm, dmenu, dwmblocks

#git clone https://github.com/MesaBytes/dwm.git && cd dwm && sudo make install ; cd ..

git clone https://github.com/MesaBytes/dmenu.git
cd dmenu
make install
cd ..

# git clone https://github.com/MesaBytes/dwmblocks.git
# cd dwmblocks
# make install
# cd ..

# git clone https://github.com/MesaBytes/tabbed.git
# cd tabbed
# make install

cd ~/

# Installing Appimages #################################

cd ~/AppImages/

# Get latest krita appimage download link
KRITA_APPIMAGE_LINK=$(curl -s https://krita.org/en/download/krita-desktop/ | grep -i class=piwik_download | sed 's/^.*https/https/' | sed 's/appimage.*/appimage/')

if [ -n "$KRITA_APPIMAGE_LINK" ]
then
    FILE_NAME=$(echo "$KRITA_APPIMAGE_LINK" | sed -n 's/^\(.*\/\)*\(.*\)/\2/p')

    # download appimage
    wget -O "$FILE_NAME" "$KRITA_APPIMAGE_LINK"
    chmod +x "$FILE_NAME"
fi

