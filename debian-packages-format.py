#!/usr/bin/env python


import argparse
import subprocess
import os
from dataclasses import dataclass
from collections import defaultdict

file_path = os.path.join(os.getcwd(), "lib/debian-packages.sh")


def find_longest_pkg_name() -> int:
    longest = 0

    with open(file_path) as f:
        for line in f.readlines():
            line = line.strip()
            if line.startswith('"'):
                package = line.replace('"', "").split(" ")[0]
                if len(package) > longest:
                    longest = len(package)
            elif line.startswith("#") and '"' in line:
                line = line.removeprefix("#")
                line = line.strip()
                package = line.replace('"', "").split(" ")[0]
                if len(package) > longest:
                    longest = len(package)

    return longest


@dataclass
class Pkg:
    name: str
    desc: str
    section: str
    unused: bool

    def __init__(self, name: str):
        self.name = name
        self.desc = "No desc."
        self.section = "Unknown"
        self.unused = False

    def extract_info(self):
        output = subprocess.getoutput(f"apt-cache show {self.name}")

        for line in output.splitlines():
            if line.startswith("Description:") or line.startswith("Description-en:"):
                self.desc = line.split(":")[1].strip().title()
            elif line.startswith("Section:"):
                self.section = line.split(":")[1].strip().title()


class Sections:
    def __init__(self):
        self.sections: dict[str, list[Pkg]] = defaultdict(list)

        self.__load()

    def __load(self):
        with open(file_path) as f:
            for line in f.readlines():
                line = line.strip()

                if line.startswith("#") and '"' in line and "#" in line:
                    # Example: -> # "nemo-audio-tab" # not found on debian
                    # Get pkg len and pad comment after it

                    line = line.removeprefix("#")
                    line = line.strip()  # remove whitespace

                    package_name, comment = line.split(
                        "#"
                    )  # pkg: "nemo-audio-tab" , comment:  not found on debian

                    package_name = package_name.replace('"', "")
                    package_name = package_name.strip()
                    comment = comment.strip()
                    pkg = Pkg(package_name)
                    pkg.section = "Unused"
                    pkg.desc = comment
                    pkg.unused = True

                    self.sections[pkg.section].append(pkg)
                    continue

                # skip Comment, or invalid packages
                if line.startswith("#") or '"' not in line:
                    continue

                package_name = line.replace('"', "").split(" ")[0]
                pkg = Pkg(package_name)
                pkg.extract_info()

                self.sections[pkg.section].append(pkg)

    def to_str(self) -> str:
        output: list[str] = []

        longest_pkg_name: int = find_longest_pkg_name()

        output.append("export APT_PACKAGES=(")
        output.append("")

        for section, pkgs in sorted(self.sections.items()):
            output.append(f"# {section}:")
            for pkg in pkgs:
                commented_out = "# " if pkg.unused else ""
                padded_desc = (
                    " " * (longest_pkg_name - len(pkg.name) + 1) + "# " + pkg.desc
                )
                output.append(f'\t  {commented_out}"{pkg.name}"{padded_desc}')
            output.append("")

        output.append(")")

        return "\n".join(output) + "\n"  # + "\n" Fixes "No newline at end of file"

    def remove_pkg(self, pkg: Pkg):
        pkgs = self.sections[pkg.section]
        if pkg in pkgs:
            pkgs.remove(pkg)

        if len(pkgs) == 0:
            del self.sections[pkg.section]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output", type=str, help="Output to file")
    parser.add_argument(
        "-p", "--print", action="store_true", help="Print output to stdout"
    )

    subparsers = parser.add_subparsers(dest="cmd")

    subparsers.add_parser("add").add_argument("pkgs", nargs="+")

    subparsers.add_parser("remove").add_argument("pkgs", nargs="+")

    subparsers.add_parser("list")

    args = parser.parse_args()

    sections = Sections()

    if args.cmd == "add":
        for pkg_name in args.pkgs:
            pkg = Pkg(pkg_name)
            pkg.extract_info()

            sections.sections[pkg.section].append(pkg)
    elif args.cmd == "remove":
        for pkg_name in args.pkgs:
            pkg = Pkg(pkg_name)
            pkg.extract_info()

            sections.remove_pkg(pkg)
    elif args.cmd == "list":
        longest_pkg_name = find_longest_pkg_name()

        for section, pkgs in sorted(sections.sections.items()):
            print(f"{section}:")
            for pkg in pkgs:
                padded_desc = (
                    " " * (longest_pkg_name - len(pkg.name) + 1) + " - " + pkg.desc
                )
                print(f"\t{pkg.name}{padded_desc}")
            print("")
            print("")

    if args.output:
        print("Writing to {}".format(args.output))
        with open(args.output, "w") as f:
            f.write(sections.to_str())

    if args.print:
        print(sections.to_str())


if __name__ == "__main__":
    main()
