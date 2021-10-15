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

  # pacman(config["file_manager"])
  # pacman(config["music_playercli"])
  # pacman(config["video_player"])
  # if config["browser"] == "google-chrome" or config["browser"] == "brave": yay(config["browser"])
  # if config["browser"] == "firefox": pacman(config["browser"])