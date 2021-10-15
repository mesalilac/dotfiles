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

  if config["terminal"] == "alacritty" or config["terminal"] == "kitty": 
    pacman(config["terminal"])
    os.system(f"gsettings set org.cinnamon.desktop.default-applications.terminal exec {config['terminal']}")
  if config["terminal"] == "st":
    os.system('''cd ~
    git clone https://github.com/LukeSmithxyz/st &&
    cd st &&
    sudo make install''')
    os.system(f"gsettings set org.cinnamon.desktop.default-applications.terminal exec {config['terminal']}")

  if config["window_manager"] == "bspwm":
    pacman("bspwm")
    pacman("sxhkd")
    yay("btops-git")

  if config["window_manager"] == "openbox":
    pacman("openbox")
    pacman("obconf")
    pacman("lxappearance-obconf")
    pacman("menumaker")

