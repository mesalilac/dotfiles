#!/bin/env bash

set -eu

cd ~/AppImages/ || :

NOTIFY_TITLE="Krita appimage updater"

# Get latest krita appimage download link
KRITA_APPIMAGE_LINK=$(curl -s https://krita.org/en/download/krita-desktop/ | grep -i class=piwik_download | sed 's/^.*https/https/' | sed 's/appimage.*/appimage/')

# check if $KRITA_APPIMAGE_LINK is not empty
if [ -n "$KRITA_APPIMAGE_LINK" ]
then
    # get file name from url
    FILE_NAME=$(echo "$KRITA_APPIMAGE_LINK" | sed -n 's/^\(.*\/\)*\(.*\)/\2/p')

    # check if an appimage with the same version already exists
    # meaning you have the latest version!
    if [ -f "$FILE_NAME" ]
    then
        notify-send "$NOTIFY_TITLE" "No updates found!"
        exit 0
    fi

    # removing old krita appimage
    rm -f krita*.appimage

    notify-send -t 15000 "$NOTIFY_TITLE" "Downloading $FILE_NAME..."

    # download appimage
    wget -O "$FILE_NAME" "$KRITA_APPIMAGE_LINK"

    # make the downloaded file executable
    chmod +x "$FILE_NAME"

    notify-send -t 15000 "$NOTIFY_TITLE" "Done!"
fi

