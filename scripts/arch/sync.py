from config import config
from os import system

def sync():
  ''' sync dotfiles '''
  root = config["root"]
  cd_root = f"cd {root}/dotfiles"
  
  # home
  system(f'''
    {cd_root} &&
    cp -r ~/scripts home/
    cp -r ~/.themes home/
    cp -r ~/.shell_profile home/
    cp -r ~/.icons home/
    cp ~/.xinitrc home/
    cp ~/.bashrc home/
    cp ~/.zshrc home/
    cp ~/.yarnrc home/
    cp ~/.xbindkeysrc home/
    cp ~/.imwheelrc home/
  ''')

  # .config

  system(f'''
    {cd_root} &&
    cp ~/.config/bspwm -r .config/
    cp ~/.config/btops -r .config/
    cp ~/.config/compton -r .config/
    cp ~/.config/jgmenu -r .config/
    cp ~/.config/kitty -r .config/
    cp ~/.config/mpv -r .config/
    cp ~/.config/nvim -r .config/
    cp ~/.config/openbox -r .config/
    cp ~/.config/polybar -r .config/
    cp ~/.config/sxhkd -r .config/
    cp ~/.config/picom.conf -r .config/
  ''')