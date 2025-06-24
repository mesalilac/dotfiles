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
import shutil


def file_list() -> list[str]:
    result = []

    for i in os.listdir():
        if any(x in i for x in [".png", ".jpeg", ".jpg"]) and os.path.isfile(i):
            result.append(i)

    return result


class ImageFile:
    old_path: str
    new_path: str

    def __init__(self, old_path: str, new_path: str) -> None:
        self.old_path = old_path
        self.new_path = new_path


def main():
    image_list = file_list()
    results: list[ImageFile] = []

    for img_file_name in image_list:
        img_file_path = os.path.join(os.path.curdir, img_file_name)

        cmd = subprocess.run(
            args=["identify", img_file_path],
            shell=False,
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
                results.append(ImageFile(img_file_path, new_img_path))

    if len(results) > 0:
        print("Do you want to rename files?")
        confirm = input("y/n: ")

        if confirm.lower() == "y":
            for image in results:
                print(f"{image.old_path} -> {image.new_path}")
                shutil.move(image.old_path, image.new_path)


if __name__ == "__main__":
    raise SystemExit(main())
