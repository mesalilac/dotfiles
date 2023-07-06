from os import getenv
from lib.types import Path

HOME = str(getenv("HOME"))

DOTFILES_DIR = f"{HOME}/.dotfiles"

### backup config ###
backup_paths: list[Path] = [
    # from ~/.config/
    {
        "src": "~/.config/systemd",
        "dest": ".config/",
        "exclusions": [],
    },
    {"src": "~/.config/zsh", "dest": ".config/", "exclusions": []},
    {"src": "~/.config/bash", "dest": ".config/", "exclusions": []},
    {
        "src": "~/.config/alacritty",
        "dest": ".config/",
        "exclusions": [],
    },
    {
        "src": "~/.config/bashtop",
        "dest": ".config/",
        "exclusions": [],
    },
    {"src": "~/.config/bspwm", "dest": ".config/", "exclusions": []},
    {"src": "~/.config/btops", "dest": ".config/", "exclusions": []},
    {
        "src": "~/.config/compton",
        "dest": ".config/",
        "exclusions": [],
    },
    {"src": "~/.config/deadd", "dest": ".config/", "exclusions": []},
    {"src": "~/.config/dxhd", "dest": ".config/", "exclusions": []},
    {
        "src": "~/.config/jgmenu",
        "dest": ".config/",
        "exclusions": [],
    },
    {"src": "~/.config/kitty", "dest": ".config/", "exclusions": []},
    {"src": "~/.config/mpv", "dest": ".config/", "exclusions": []},
    {
        "src": "~/.config/openbox",
        "dest": ".config/",
        "exclusions": [],
    },
    {
        "src": "~/.config/polybar",
        "dest": ".config/",
        "exclusions": [],
    },
    {"src": "~/.config/sxhkd", "dest": ".config/", "exclusions": []},
    {"src": "~/.config/cmus", "dest": ".config/", "exclusions": []},
    {
        "src": "~/.config/BetterDiscord",
        "dest": ".config/",
        "exclusions": [],
    },
    {"src": "~/.config/mpd.conf", "dest": ".config/", "exclusions": []},
    {"src": "~/.config/rofi", "dest": ".config/", "exclusions": []},
    {
        "src": "~/.config/discover_overlay",
        "dest": ".config/",
        "exclusions": ["discover_overlay.pid"],
    },
    {
        "src": "~/.config/picom.conf",
        "dest": ".config/",
        "exclusions": [],
    },
    {
        "src": "~/.config/gromit-mpx.ini",
        "dest": ".config/",
        "exclusions": [],
    },
    # from ~/
    {"src": "~/scripts", "dest": "home/", "exclusions": []},
    {"src": "~/.themes", "dest": "home/", "exclusions": []},
    {"src": "~/.icons", "dest": "home/", "exclusions": []},
    {"src": "~/.bashrc", "dest": "home/", "exclusions": []},
    {"src": "~/.bash_profile", "dest": "home/", "exclusions": []},
    {"src": "~/.bash_logout", "dest": "home/", "exclusions": []},
    {"src": "~/.dialogrc", "dest": "home/", "exclusions": []},
    {"src": "~/.imwheelrc", "dest": "home/", "exclusions": []},
    {"src": "~/.xbindkeysrc", "dest": "home/", "exclusions": []},
    {"src": "~/.xinitrc", "dest": "home/", "exclusions": []},
    {"src": "~/.xprofile", "dest": "home/", "exclusions": []},
    {"src": "~/.Xresources", "dest": "home/", "exclusions": []},
    {"src": "~/.zshenv", "dest": "home/", "exclusions": []},
    {"src": "~/.gitconfig", "dest": "home/", "exclusions": []},
    #
    # .local
    #
    {"src": "~/.local/share/fonts", "dest": ".local/share/", "exclusions": []},
    {"src": "~/.local/share/nemo", "dest": ".local/share/", "exclusions": []},
]
