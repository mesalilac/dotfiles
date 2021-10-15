from tools import (pacman, yay)
from config import config

def packages():
  ''' install all packages '''

  pacman(config["file_manager"])
  