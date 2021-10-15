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
