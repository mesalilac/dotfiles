'''

Options for config

file_manager      |  nemo
music_player_cli  |  cmus
video_player      |  mpv
browser           |  google-chrome, firefox
terminal          |  st, kitty, alacritty
window_manager    |  dwm, openbox, bspw

'''

from pathlib import Path

_path = str(Path().absolute())

config = {
  "file_manager": "nemo",
  "music_player_cli": "cmus",
  "video_player": "mpv",
  "browser": "google-chrome",
  "terminal": "alacritty",
  "window_manager": "bspwm",
  "path": _path
}