import os

def get_home_dir() -> str:
  return os.path.expanduser("~")

def find_root_dir() -> str: 
  '''
    check if dotfiles exists in ~/projects/shell/dotfiles or ~/dotfiles and return path
  '''
  home = get_home_dir()
  if os.path.exists(f"{home}/projects/shell/dotfiles"):
    return f"{home}/projects/shell/dotfiles"

  if os.path.exists(f"{home}/dotfiles"):
    return f"{home}/dotfiles"

config = {
  "file_manager": "nemo",
  "music_playercli": "cmus",
  "video_player": "mpv",
  "browser": "brave",         # google-chrome firefox brave
  "terminal": "alacritty",    # st kitty alacritty
  "window_manager": "bspwm",   # dwm openbox bspwm,
  "root": find_root_dir(),
  "home": get_home_dir()
}
