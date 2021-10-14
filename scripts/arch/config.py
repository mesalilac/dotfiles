def find_root_dir() -> str: 
  # check if ~/dotfiles exists use ~/dotfiles 
  # else use ~/projects/shell/dotfiles 
  ...

config = {
  "file_manager": "nemo",
  "music_playercli": "cmus",
  "video_player": "mpv",
  "browser": "brave",         # google-chrome firefox brave
  "terminal": "alacritty",    # st kitty alacritty
  "window_manager": "bspwm",   # dwm openbox bspwm,
  "root": find_root_dir()
}
