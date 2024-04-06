#!/usr/bin/env bash

# gio set -t unset "${dir}" metadata::custom-icon

for dir in "$@"; do
    IMAGE="$(ls "${dir}"/*.{png,jpg,jpeg} 2>/dev/null | head -1)"

    # echo "${IMAGE}"

    gio set "${dir}" metadata::custom-icon "file://${IMAGE}"
    # gio set -t stringv "${dir}" metadata::emblems emblem-default
done
