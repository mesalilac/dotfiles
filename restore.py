#!/bin/env python3

import argparse
from config import HOME, DOTFILES_DIR
from lib.rsync import rsync
from lib.resotre import sync_repo

def restore(verbose: bool):
    rsync.copy_dir(src=f"{DOTFILES_DIR}/dotfiles/.config", dest=HOME, verbose=verbose)
    rsync.copy_dir(src=f"{DOTFILES_DIR}/dotfiles/home/.", dest=HOME, verbose=verbose)
    rsync.copy_dir(
        src=f"{DOTFILES_DIR}/dotfiles/.local", dest=HOME, verbose=verbose
    )

    sync_repo("https://github.com/senpai-10/nvim-config", f"{HOME}/.config/nvim")
    sync_repo("https://github.com/senpai-10/awesome-config", f"{HOME}/.config/awesome")

if __name__ == "__main__":
    parser = argparse.ArgumentParser("backup dotfiles")
    parser.add_argument("--verbose", help="Show info when copying", action="store_true")

    args = parser.parse_args()

    restore(verbose=args.verbose)
