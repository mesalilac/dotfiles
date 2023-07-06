#!/bin/env python3

from os import getenv
from lib.rsync import rsync
from lib.resotre import sync_repo
import argparse

HOME = str(getenv("HOME"))


def restore(verbose: bool):
    DOTPATH = f"{HOME}/.dotfiles"

    rsync.copy_dir(src=f"{DOTPATH}/dotfiles/.config", dest=HOME, verbose=verbose)
    rsync.copy_dir(src=f"{DOTPATH}/dotfiles/home/.", dest=HOME, verbose=verbose)
    rsync.copy_dir(
        src=f"{DOTPATH}/dotfiles/.local", dest=HOME, verbose=verbose
    )

    sync_repo("https://github.com/senpai-10/nvim-config", f"{HOME}/.config/nvim")
    sync_repo("https://github.com/senpai-10/awesome-config", f"{HOME}/.config/awesome")


if __name__ == "__main__":
    parser = argparse.ArgumentParser("backup dotfiles")
    parser.add_argument("--verbose", help="Show info when copying", action="store_true")

    args = parser.parse_args()

    restore(verbose=args.verbose)
