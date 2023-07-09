import subprocess
from os import path
from lib import colors
from lib.logger import log


def sync_repo(url: str, clone_path: str):
    """
    git pull if repo is found and clone if not

    **url**
        git repo url for clonning if necessary
    **clone_path**
        path to git repo on system (example: $HOME/.config/nvim)
    """

    if clone_path.endswith("/"):
        clone_path = clone_path[:-1]

    name = path.basename(clone_path)

    if path.exists(clone_path):
        log.info(
            f"Pulling latest changes for {colors.light_yellow(name)} from {colors.light_yellow(url)}"
        )
        subprocess.check_call(["git", "pull"], cwd=clone_path)
    else:
        log.info(
            f"Cloning {colors.light_yellow(name)} to {colors.light_yellow(clone_path)}"
        )
        clone(url, clone_path)


def clone(repo_url: str, repo_path: str):
    """clone a git repo"""
    command = []

    command.append("git")
    command.append("clone")
    command.append(repo_url)
    command.append(repo_path)

    subprocess.run(command, check=False)
