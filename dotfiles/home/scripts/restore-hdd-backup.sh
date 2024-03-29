#!/usr/bin/env bash

set -euo pipefail

BACKUP_PATH="/media/${USER}/backup"

cd "${BACKUP_PATH}"

cp --verbose --recursive .gnupg "${HOME}"
cp --verbose patchbay.qpwgraph "${HOME}"
cp --verbose .bash_history "${HOME}"
cp --verbose .bashrc "${HOME}"
cp --verbose .gitconfig "${HOME}"
cp --verbose .git-credentials "${HOME}"
cp --verbose .zsh_history "${HOME}"

sudo cp --verbose --recursive ./ssmtp /etc/

TAR_FILE="$(ls -rt dev_backup-*.tar.gz | tail -1)"

if [[ -f "${TAR_FILE}" ]]
then
    if [[ -d "${HOME}/dev" ]]
    then
        echo "${HOME}/dev already exists!"
    else
        tar -vxf "${TAR_FILE}" "${HOME}/dev"
    fi
fi
