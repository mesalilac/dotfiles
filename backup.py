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
from lib.types import Dir, Entry, File

def duplicate_sources(backup_list: list[Entry]) -> list[Entry]:
    duplicates: list[Entry] = []
    sources: list[str] = []

    for item in backup_list:
        if item.src in sources:
            duplicates.append(item)
            continue

        sources.append(item.src)

    return duplicates

def backup(verbose: bool, no_prompt_for_confirm: bool):
    """
    Backup files and dirs
    """

    backup_list = config.backup_paths

    duplicates: list[Entry] = duplicate_sources(backup_list)

    for entry in duplicates:
        log.warning(f"'{entry.src}' already exists in backup list!")
        backup_list.remove(entry)

    for entry in backup_list:
        entry.src = os.path.expanduser(entry.src)
        entry.dest = f"{config.DOTFILES_DIR}/dotfiles/{entry.dest}"

        if not os.path.exists(entry.src):
            log.error(f"Failed to copy '{entry.src}' {entry.as_string()} not found")
            continue

        if isinstance(entry, Dir):
            rsync.copy_dir(
                entry, override=True, verbose=verbose
            )
        elif isinstance(entry, File):
            rsync.copy_file(entry)

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
