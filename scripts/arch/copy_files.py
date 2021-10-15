from config import config
import os

def copy_files():
  ''' copy all files '''
  root = config["root"]
  cd_root = f"cd {root}"
  
  os.system(f'''
  {cd_root} &&
  mkdir -p /usr/share/cmus/ &&
  mkdir -p ~/.icons &&
  mkdir -p ~/.config/BetterDiscord &&
  mkdir -p /usr/share/fonts/TTF &&
  
  cp -rf dotfiles/.config ~/.config
  cp -rf dotfiles/home/* ~/

  git clone https://github.com/powerline/fonts.git
  cd fonts
  ./install.sh
  cd ..
  sudo cp fonts/* ~/.local/share/fonts/

  sudo cp themes/cmus/*.theme /usr/share/cmus/
  ''')