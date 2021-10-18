from tools import (pacman, yay)
from config import config
import os

def packages():
  ''' install all packages '''
  print("+ Setup user folders")
  os.system('''
mkdir -pv ~/Documents
mkdir -pv ~/Pictures
mkdir -pv ~/Downloads
mkdir -pv ~/Music
mkdir -pv ~/Videos
mkdir -pv ~/Screenshots
mkdir -pv ~/mpv_screenshots
mkdir -pv ~/AppImages
''')

  pacman(config["file_manager"])
  pacman(config["music_playercli"])
  pacman(config["video_player"])
  if config["browser"] == "google-chrome" or config["browser"] == "brave": yay(config["browser"])
  if config["browser"] == "firefox": pacman(config["browser"])

  # terminal
  if config["terminal"] == "alacritty" or config["terminal"] == "kitty": 
    pacman(config["terminal"])
    os.system(f"gsettings set org.cinnamon.desktop.default-applications.terminal exec {config['terminal']}")

  if config["terminal"] == "st":
    os.system('''cd ~
    git clone https://github.com/LukeSmithxyz/st &&
    cd st &&
    sudo make install''')
    os.system(f"gsettings set org.cinnamon.desktop.default-applications.terminal exec {config['terminal']}")

  # window manager
  if config["window_manager"] == "bspwm":
    pacman("bspwm")
    pacman("sxhkd")
    yay("btops-git")

  if config["window_manager"] == "openbox":
    pacman("openbox")
    pacman("obconf")
    pacman("lxappearance-obconf")
    pacman("menumaker")

  if config["window_manager"] == "dwm":
    os.system('''mkdir -p ~/wm &&
    cd ~/wm &&

    git clone https://github.com/Senpai-10/dwm.git &&
    cd dwm &&
    sudo make install &&
    cd .. &&

    git clone https://github.com/Senpai-10/dmenu.git &&
    cd dmenu &&
    sudo make install &&
    cd .. &&

    git clone https://github.com/Senpai-10/dwmblocks.git &&
    cd dwmblocks &&
    sudo make install &&
    cd .. &&''')

  pacman("zsh")
  pacman("which")
  pacman("zip")
  pacman("unzip")
  pacman("wget")
  pacman("bashtop")
  pacman("picom")
  pacman("easytag")
  pacman("ffmpegthumbnailer")
  pacman("ffmpegthumbs")
  pacman("pavucontrol")
  pacman("nitrogen")
  pacman("udisks2")
  pacman("ntfs-3g")
  pacman("neofetch")
  pacman("alsa-utils")
  pacman("code")
  pacman("feh")
  pacman("discord")
  pacman("htop")
  pacman("imagemagick")
  pacman("nodejs")
  pacman("npm")
  pacman("pulseaudio")
  pacman("python3")
  pacman("python-pip")
  pacman("rxvt-unicode")
  pacman("scrot")
  pacman("flameshot")
  pacman("curl")
  pacman("highlight")
  pacman("wine")
  pacman("youtube-dl")
  pacman("tree")
  pacman("xbindkeys")
  pacman("imwheel")
  pacman("nautilus")
  pacman("bc")
  pacman("lxappearance")
  pacman("rofi")
  pacman("gimp")
  pacman("gnome-calculator")
  pacman("gnome-system-monitor")
  pacman("steam")
  pacman("jgmenu")
  pacman("dmenu")
  pacman("onboard")
  pacman("redis")
  pacman("docker")

  # fonts
  pacman("ttf-dejavu")
  pacman("ttf-liberation")
  pacman("ttf-font-awesome")
  pacman("noto-fonts-emoji")
  pacman("ttf-jetbrains-mono")
  pacman("ttf-fantasque-sans-mono")
  pacman("noto-fonts")
  pacman("ttf-droid")
  pacman("terminus-font")
  pacman("ttf-fira-code")

  yay("consolas-font")
  yay("ttf-material-icons-git")
  yay("ttf-icomoon-feather")
  yay("nerd-fonts-iosevka")
  yay("noto-fonts-sc")
  yay("ttf-ms-fonts")
  yay("fontpreview-ueberzug-git")
  yay("nerd-fonts-jetbrains-mono")

  yay("spotify")
  yay("colorpicker")
  yay("figma-linux")
  yay("cava")
  yay("deadd-notification-center-bin")
  yay("spaceship-prompt-git")
  yay("code-marketplace")
  yay("ls-icons")
  yay("polybar")
  yay("dxhd")

  os.system('''sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ''')
  os.system("sudo chsh -s $(which zsh)")
  os.system("flameshot config --showhelp false")
  os.system("jgmenu_run init --theme=archlabs_1803")
  os.system('sh -c "$(curl -fsSL https://starship.rs/install.sh)"')
  os.system('''wget https://support.steampowered.com/downloads/1974-YFKL-4947/SteamFonts.zip &&
  unzip SteamFonts.zip -d SteamFonts/ && rm SteamFonts.zip &&
  sudo mkdir -p /usr/local/share/fonts &&
  sudo mv SteamFonts/* /usr/local/share/fonts &&
  rm -rf SteamFonts/''')

  os.system('''
  git clone https://github.com/thameera/vimv.git &&
  sudo cp vimv/vimv /usr/local/bin/ &&
  sudo chmod +x /usr/local/bin/vimv''')
  os.system("curl -sLf https://spacevim.org/install.sh | bash")

  os.system('''
  wget https://github.com/Superjo149/auryo/releases/download/v2.5.4/Auryo-2.5.4.AppImage &&
  chmod +x Auryo-2.5.4.AppImage &&
  mv Auryo-2.5.4.AppImage ~/AppImages/auryo''')

  os.system('''
  wget https://download.kde.org/stable/kdenlive/21.08/linux/kdenlive-21.08.1-x86_64.appimage &&
  chmod +x kdenlive-20.12.3a-x86_64.appimage &&
  mv kdenlive-20.12.3a-x86_64.appimage ~/AppImages/kdenlive''')

  os.system('''
  wget https://download.kde.org/stable/krita/4.4.8/krita-4.4.8-x86_64.appimage &&
  chmod +x krita-4.4.8-x86_64.appimage &&
  mv krita-4.4.8-x86_64.appimage ~/AppImages/krita''')

  os.system('''
  wget https://github.com/ppy/osu/releases/download/2021.907.0/osu.AppImage &&
  chmod +x osu.AppImage &&
  mv osu.AppImage ~/AppImages/osu''')

  os.system('''
  wget https://hyperbeam.com/download/linux &&
  chmod +x linux &&
  mv linux ~/AppImages/hyperbeam''')

