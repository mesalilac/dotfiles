#!/usr/bin/env python

"""
TODO:
    List image files in the pwd
    Run identify and rename the file with
        the extention that's in identify
    List all the file changes and ask for confirmation
"""

import os
import subprocess


def file_list() -> list[str]:
    result = []

    for i in os.listdir():
        if any(x in i for x in [".png", ".jpeg", ".jpg"]) and os.path.isfile(i):
            result.append(i)

    return result


def main():
    image_list = file_list()

    for img_file_name in image_list:
        img_file_path = os.path.join(os.path.curdir, img_file_name)

        cmd = subprocess.run(
            args=f"identify '{img_file_path}'",
            shell=True,
            check=True,
            capture_output=True,
            text=True,
        )

        if cmd.returncode == 0:
            ext = cmd.stdout.split()[1]
            new_file_name = img_file_name.split(".")
            old_ext = new_file_name.pop(-1)

            if ext.lower() != old_ext.replace(".", ""):
                new_file_name.append("." + ext.lower())
                new_file_name = "".join(new_file_name)

                new_img_path = os.path.join(os.curdir, new_file_name)

                print(f"{img_file_path} -> {new_img_path}")
                os.rename(img_file_path, new_img_path)


if __name__ == "__main__":
    raise SystemExit(main())
