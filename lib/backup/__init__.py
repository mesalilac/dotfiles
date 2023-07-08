import os
import subprocess
from datetime import datetime
from lib import colors
from lib.helpers import confirm_prompt, remove_trailing_slash, remove_dir_or_file
from lib.logger import log
from lib.types import Path

def format_git_status_output(output: str) -> str:
    tmp = ""

    for line in output.split("\n"):
        if "dotfiles/" in line:
            tmp += line+"\n"

    return tmp

def push_changes(no_prompt_for_confirm: bool, cwd: str):
    """push backup to github"""

    p = subprocess.Popen(["git", "status"], cwd=cwd, stdout=subprocess.PIPE)

    output = p.communicate()[0].decode("utf-8")

    if "dotfiles/" in output:
        formatted_output = format_git_status_output(output)

        log.info(f"Changes: \n{colors.light_yellow(formatted_output)}")

        if no_prompt_for_confirm == False:
            confirm = confirm_prompt(
                message="Do you want to push changes to github?", default="n"
            )

            if confirm == False:
                return

        date = str(datetime.now().strftime("%Y-%m-%d %I:%M:%S %p"))
        commit_message = f"backup: {date}"

        log.info("Staging all change in dotfiles/")
        subprocess.Popen(["git", "add", "dotfiles"], cwd=cwd).wait()

        log.info(f"Add a commit message `{commit_message}`")
        subprocess.Popen(["git", "commit", "-m", commit_message], cwd=cwd).wait()

        log.info("Pushing to github")
        subprocess.Popen(["git", "push"], cwd=cwd).wait()


def cleanup(
    dotfiles_dir: str, backup_paths: list[Path], no_prompt_for_confirm: bool
) -> None:
    """
    Remove files/dirs that are not in config.backup_paths from ~/.dotfiles/dotfiles/
    """

    dotfiles_dir = os.path.expanduser(dotfiles_dir)
    map: dict[str, list[str]] = {}
    cleaned_up = 0

    log.info("Starting Cleanup!")

    for item in backup_paths:
        src = remove_trailing_slash(os.path.basename(item["src"]))
        dest = remove_trailing_slash(item["dest"])

        map.setdefault(dest, []).append(src)

    # Removing dests that are not in backup_paths
    for dir in os.listdir(dotfiles_dir):
        if dir not in map.keys():
            full_path = os.path.join(dotfiles_dir, dir)
            full_path_style = colors.light_yellow(colors.selected(f" {full_path} "))

            if no_prompt_for_confirm:
                confirm = True
            else:
                confirm = confirm_prompt(
                    f"{full_path_style} dest not in backup_paths, remove it?", "y"
                )

            if confirm:
                remove_dir_or_file(full_path)
                cleaned_up += 1

    # Removing sources not in backup_paths
    for dest in map.keys():
        for dir in os.listdir(os.path.join(dotfiles_dir, dest)):
            if dir not in map[dest]:
                full_path = os.path.join(dotfiles_dir, dest, dir)
                full_path_style = colors.light_yellow(colors.selected(f" {full_path} "))

                if no_prompt_for_confirm:
                    confirm = True
                else:
                    confirm = confirm_prompt(
                        f"{full_path_style} source not in backup_paths, remove it?", "y"
                    )

                if confirm:
                    remove_dir_or_file(full_path)
                    cleaned_up += 1

    if cleaned_up == 0:
        log.info("Nothing to Cleanup!")
    else:
        log.info(f"Cleanup Done! ({cleaned_up} item/s)")
