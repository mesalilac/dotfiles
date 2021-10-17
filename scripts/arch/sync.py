from config import config
from os import system

def sync():
  ''' sync dotfiles '''
  root = config["root"]
  cd_root = f"cd {root}/dotfiles"
  
  # home
  system(f'''
    {cd_root} &&
    cp -r home/scripts ~/ 
    cp -r home/.themes ~/
    cp -r home/.shell_profile ~/
    cp -r home/.icons ~/
    cp home/.xinitrc ~/
    cp home/.bashrc ~/
    cp home/.zshrc ~/
    cp home/.yarnrc ~/
    cp home/.xbindkeysrc ~/
    cp home/.imwheelrc ~/
  ''')

  # .config

  system(f'''
    {cd_root} &&
    cp .config/bspwm -r ~/.config
    cp .config/btops -r ~/.config
    cp .config/compton -r ~/.config
    cp .config/jgmenu -r ~/.config
    cp .config/kitty -r ~/.config
    cp .config/deadd -r ~/.config
    cp .config/mpv -r ~/.config
    cp .config/nvim -r ~/.config
    cp .config/openbox -r ~/.config
    cp .config/polybar -r ~/.config
    cp .config/sxhkd -r ~/.config
    cp .config/picom.conf ~/.config
  ''')