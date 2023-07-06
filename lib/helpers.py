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

    if answer == "y" or answer == "yes":
        return True

    return False


def remove_trailing_slash(s):
    if s.endswith("/"):
        s = s[:-1]

    return s

def remove_dir_or_file(p):
    if os.path.isdir(p):
        shutil.rmtree(p)

    elif os.path.isfile(p):
        os.remove(p)
