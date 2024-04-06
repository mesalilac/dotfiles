from os import getenv
from typing import List
from lib.types import Dir, File, Entry

HOME: str = str(getenv("HOME"))

DOTFILES_DIR: str = f"{HOME}/.dotfiles"

backup_paths: List[Entry] = [
    # .config/
    Dir("~/.config/systemd", ".config/"),
    Dir("~/.config/zsh", ".config/"),
    Dir("~/.config/alacritty", ".config/"),
    Dir("~/.config/bashtop", ".config/"),
    Dir("~/.config/jgmenu", ".config/"),
    Dir("~/.config/kitty", ".config/"),
    Dir("~/.config/mpv", ".config/"),
    Dir("~/.config/cmus", ".config/"),
    Dir("~/.config/BetterDiscord", ".config/"),
    Dir("~/.config/mpd.conf", ".config/"),
    Dir("~/.config/rofi", ".config/"),
    Dir("~/.config/discover_overlay", ".config/"),
    Dir("~/.config/gpick", ".config/"),
    Dir("~/.config/gtk-3.0", ".config/"),
    Dir("~/.config/qt5ct", ".config/"),
    File("~/.config/picom.conf", ".config/"),
    File("~/.config/gromit-mpx.ini", ".config/"),
    File("~/.config/scout.toml", ".config/"),
    # home/
    Dir("~/scripts", "home/"),
    Dir("~/.themes", "home/"),
    Dir("~/.icons", "home/"),
    Dir("~/.screenlayout", "home/"),
    File("~/.tmux.conf", "home/"),
    File("~/.dialogrc", "home/"),
    File("~/.imwheelrc", "home/"),
    File("~/.xbindkeysrc", "home/"),
    File("~/.xinitrc", "home/"),
    File("~/.xprofile", "home/"),
    File("~/.Xresources", "home/"),
    File("~/.zshenv", "home/"),
    File("~/.gitconfig", "home/"),
    # .local
    Dir("~/.local/share/fonts", ".local/share/"),
    Dir("~/.local/share/nemo", ".local/share/"),
    Dir("~/.local/share/zap", ".local/share/"),
    Dir("~/.local/share/eog", ".local/share/"),
    File(
        "/usr/share/thumbnailers/ffmpegthumbnailer.thumbnailer",
        "thumbnailers/",
    ),
]
