from tools import (pacman, yay)
from config import config

def packages():
  ''' install all packages '''

  pacman(config["file_manager"])
  pacman(config["music_playercli"])
  pacman(config["video_player"])
  if config["browser"] == "google-chrome" or config["browser"] == "brave": yay(config["browser"])
  if config["browser"] == "firefox": pacman(config["browser"])