# Simple wrapper for rsync command

import subprocess
from .logger import log

class __Rsync:
    def copy_file(self, src: str, dest: str):
        log.copy(src=src, dest=dest)
        subprocess.run(["rsync", src, dest])

    def copy_dir(self, src: str, dest: str, override=False, exclude=[], root=False, verbose=False):
        command = []

        if root == True:
            command.append("sudo")

        command.append("rsync")
        opts = ["-ra"]

        if override == True:
            opts.append("--delete")

        if verbose == True:
            opts.append("--human-readable")
            opts.append("--progress")

        if len(exclude) > 0:
            for item in exclude:
                opts.append("--exclude=" + item)

        opts.append("--mkpath")

        command.extend(opts)

        command.append(src)
        command.append(dest)

        log.copy(src=src, dest=dest)
        subprocess.run(command)


rsync = __Rsync()
