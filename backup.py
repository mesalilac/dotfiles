#!/bin/env python3

"""
Backup files and dirs or cleanup dotfiles
"""

# backup script written in python
# will replace backup.sh soon

import os
import argparse
import config
from lib.logger import log
from lib.rsync import rsync
from lib.backup import cleanup, push_changes

def check_for_duplicate_sources(backup_list, src: str) -> bool:
    """return True if SOURCE does already exists in list"""
    for key in backup_list:
        if key["src"] == src:
            return True

    return False

def backup(verbose: bool, no_prompt_for_confirm: bool):
    """
    Backup files and dirs
    """

    backup_list = config.backup_paths

    for item in backup_list:
        src = os.path.expanduser(item["src"])
        dest = item["dest"]
        exclusions = item["exclusions"]

        dest = f"{config.DOTFILES_DIR}/dotfiles/{dest}"

        if not os.path.exists(src):
            log.error(f"Failed to copy '{src}' file/dir not found")
            continue

        if check_for_duplicate_sources(backup_list, src):
            log.warning(f"'{src}' already exists in backup list. skipping...")
            continue

        if os.path.isdir(src):
            rsync.copy_dir(
                src, dest, override=True, exclude=exclusions, verbose=verbose
            )
        elif os.path.isfile(src):
            rsync.copy_file(src, dest)

    push_changes(no_prompt_for_confirm, cwd=config.DOTFILES_DIR)


if __name__ == "__main__":
    parser = argparse.ArgumentParser("backup dotfiles")

    parser.add_argument(
        "-y", "--yes", help="Don't prompt for confirmation", action="store_true"
    )
    parser.add_argument("-v", "--verbose", help="Show info when copying", action="store_true")
    parser.add_argument("-c", "--cleanup",
            help="Remove files/dirs not in backup_paths list",
            action="store_true")

    args = parser.parse_args()

    if args.cleanup:
        cleanup("~/.dotfiles/dotfiles/", config.backup_paths, no_prompt_for_confirm=args.yes)

    backup(verbose=args.verbose, no_prompt_for_confirm=args.yes)
