import os
import shutil


def confirm_prompt(message: str, default: str) -> bool:
    """
    **message**
        Message that will be displayed
    **default**:
        pass `y or n`
    """

    options = ["Y" if default == "y" else "y", "N" if default == "n" else "n"]

    answer = str(input(f"{message} [{'/'.join(options)}] ") or default).lower()

    if answer not in ["y", "yes", "n", "no"]:
        print(f"Unknown answer! using default: {default}")
        answer = default

    if answer in ("yes", "y"):
        return True

    return False


def remove_trailing_slash(string):
    if string.endswith("/"):
        string = string[:-1]

    return string


def remove_dir_or_file(path):
    if os.path.isdir(path):
        shutil.rmtree(path)

    elif os.path.isfile(path):
        os.remove(path)
