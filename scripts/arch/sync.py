from config import config
from os import system

def sync():
  ''' sync dotfiles '''
  root = config["root"]
  cd_root = f"cd {root}/dotfiles"
  
  # home
  system(f'''
    {cd_root} &&
    cp -r home/ ~/ 
  ''')

  # .config

  system(f'''
    {cd_root} &&
    cp .config/ -r ~/.config
  ''')