#!/usr/bin/env bash

set -eux

if [[ $(id -u) -eq 0 ]]; then
    echo "Don't run this script as root..."
    exit 1
fi

DOTFILES_DIR=$(dirname "$(readlink -f "$0")")

. "$DOTFILES_DIR/lib/debian-packages.sh"
. "$DOTFILES_DIR/lib/colors.sh"

function log_info    { echo -e "[${IBlue} INFO ${NO_COLOR}] ${IYellow}$*${NO_COLOR}"; }

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

log_info "Creating Directories"
mkdir -pv ~/Documents
mkdir -pv ~/Pictures
mkdir -pv ~/Downloads
mkdir -pv ~/Music
mkdir -pv ~/Videos
mkdir -pv ~/Screenshots
mkdir -pv ~/mpv_screenshots
mkdir -pv ~/sources
mkdir -pv ~/.local/
mkdir -pv ~/.local/bin/
mkdir -pv ~/.local/bin/app-images

log_info "Downloading and Installing apt packages"
sudo apt-get install -y "${APT_PACKAGES[@]}"

# Add new sources
sudo apt-add-repository contrib non-free -y

log_info "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source "$HOME/.cargo/env"

log_info "Changing default shell to zsh!"
chsh -s "$(which zsh)"

log_info "Running restore script"
"$DOTFILES_DIR/./restore.py"

log_info "Installing yt-dlp (youtube donwloader)"
curl -L -o yt-dlp https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
chmod +x yt-dlp
mv yt-dlp ~/.local/bin/yt-dlp

log_info "Installing vimv (bulk name files)"
if [ ! -d "/tmp/vimv" ] ; then
    git clone https://github.com/thameera/vimv.git /tmp/vimv
fi
cp /tmp/vimv/vimv ~/.local/bin/
chmod +x ~/.local/bin/vimv

log_info "Installing sccache"
# https://github.com/mozilla/sccache
cargo install sccache

log_info "Installing tree-sitter-cli"
cargo install tree-sitter-cli

log_info "Installing cmus-rpc"
cargo install --git https://github.com/MesaBytes/cmus-rpc.git

log_info "Installing dust"
cargo install du-dust

cargo install diesel_cli

cargo install bat

cargo install scout

cargo install bacon

log_info "Installing discord"
wget "https://discord.com/api/download?platform=linux&format=deb" -O ~/Downloads/discord.deb
sudo apt install ~/Downloads/./discord.deb

#log_info "Installing steam"
sudo dpkg --add-architecture i386
sudo apt-get update
# https://wiki.debian.org/Steam
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
sudo apt-get install steam-installer

log_info "Installing github-cli"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# Install spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

# Install cloudflare-wrap
# Add cloudflare gpg key
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
# Add this repo to your apt repositories
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt-get update
sudo apt-get install -y cloudflare-warp
# --------------

wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O ~/Downloads/packages-microsoft-prod.deb
wget https://opentabletdriver.net/Release/Download/OpenTabletDriver.deb -O ~/Downloads/OpenTabletDriver.deb
# Add the Microsoft Packages repository, use the URL related to your distribution
sudo dpkg -i ~/Downloads/packages-microsoft-prod.deb
# Install the .NET runtime
sudo apt update
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-6.0
# This will install the package, assuming you are in the correct directory
sudo apt install ~/Downloads/OpenTabletDriver.deb
# Reload the systemd user unit daemon
systemctl --user daemon-reload
# Enable and start the user service
systemctl --user enable opentabletdriver --now

systemctl --user --now enable wireplumber.service

wget https://github.com/Figma-Linux/figma-linux/releases/download/v0.10.0/figma-linux_0.10.0_linux_amd64.deb -O ~/Downloads/figma-linux_amd64.deb
sudo dpkg -i ~/Downloads/figma-linux_amd64.deb

#
# Setup the pgadmin repository
#
# Install the public key for the repository (if not done previously):
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
# Create the repository configuration file:
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
#
# Install pgAdmin
#
# Install for web mode only:
sudo apt install pgadmin4-web
# Configure the webserver, if you installed pgadmin4-web:
sudo /usr/pgadmin4/bin/setup-web.sh

sudo npm -g install yarn

yarn global add sass

pipx install discover-overlay
pipx install identify

curl -sS https://starship.rs/install.sh | sh

if [ ! -d "$HOME/.tmux/plugins/tpm" ] ; then
    mkdir -p "$HOME/.tmux/plugins"
    git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
fi

# build from source
cd ~/sources

if [ ! -d "dmenu" ] ; then
    git clone https://github.com/MesaBytes/dmenu.git
fi
cd dmenu
make install

cd ..

if [ ! -d "neovim" ] ; then
    git clone --depth=1 "https://github.com/MesaBytes/neovim" --branch stable
fi
cd neovim && make CMAKE_BUILD_TYPE=Release
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

cd ..

if [ ! -d "colorpicker" ] ; then
    git clone https://github.com/Jack12816/colorpicker.git
fi
cd colorpicker
make clean colorpicker
cp colorpicker ~/.local/bin/

cd ..

sudo apt build-dep awesome
[[ ! -d "awesome" ]] && git clone "https://github.com/awesomewm/awesome"
cd awesome
make package
sudo apt install ./build/*.deb

cd ..

if [[ ! -d "lua-language-server" ]] ; then
    git clone https://github.com/LuaLS/lua-language-server
fi
cd lua-language-server
./make.sh

cd ..

