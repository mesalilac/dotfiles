#!/bin/env python3

import argparse
from config import HOME, DOTFILES_DIR
from lib.rsync import rsync
from lib.resotre import sync_repo
from lib.types import Dir, File


def restore(verbose: bool):
    rsync.copy_dir(Dir(f"{DOTFILES_DIR}/dotfiles/.config", HOME), verbose=verbose)
    rsync.copy_dir(Dir(f"{DOTFILES_DIR}/dotfiles/home/.", HOME), verbose=verbose)
    rsync.copy_dir(Dir(f"{DOTFILES_DIR}/dotfiles/.local", HOME), verbose=verbose)

    # -m flag makes ffmpegthumbnailer use embeded thumbnailers
    rsync.copy_file(
        File(
            f"{DOTFILES_DIR}/dotfiles/thumbnailers/ffmpegthumbnailer.thumbnailer",
            "/usr/share/thumbnailers/",
        ),
        sudo=True,
    )

    sync_repo("https://github.com/senpai-10/nvim-config", f"{HOME}/.config/nvim")
    sync_repo("https://github.com/senpai-10/awesome-config", f"{HOME}/.config/awesome")


if __name__ == "__main__":
    parser = argparse.ArgumentParser("backup dotfiles")
    parser.add_argument("--verbose", help="Show info when copying", action="store_true")

    args = parser.parse_args()

    restore(verbose=args.verbose)
