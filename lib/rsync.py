# Simple wrapper for rsync command

import subprocess

from .types import Dir, File
from .logger import log

class Rsync:
    def copy_file(self, target: File):
        src = target.src
        dest = target.dest

        log.copy(src=src, dest=dest)
        subprocess.run(["rsync", src, dest], check=False)

    def copy_dir(self, target: Dir, override=False, root=False, verbose=False):
        src = target.src
        dest = target.dest
        exclude = target.exclude

        command = []

        if root is True:
            command.append("sudo")

        command.append("rsync")
        opts = ["-ra"]

        if override is True:
            opts.append("--delete")

        if verbose is True:
            opts.append("--human-readable")
            opts.append("--progress")

        for item in exclude:
            opts.append("--exclude=" + item)

        opts.append("--mkpath")

        command.extend(opts)

        command.append(src)
        command.append(dest)

        log.copy(src=src, dest=dest)
        subprocess.run(command, check=False)

rsync = Rsync()
