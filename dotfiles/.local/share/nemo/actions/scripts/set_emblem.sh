#!/usr/bin/env bash

# gio set -t unset "${dir}" metadata::custom-icon

for dir in "$@"; do
    if [[ -d "${dir}" ]]; then
        IMAGE="${dir}/$(ls "${dir}" | grep -E '^[0-9]+\.(png|jpe?g)$' | sort -V | head -n 1)"
        NEW_IMAGE_PATH=""${HOME}"/.cache/custom-icons"
        NEW_IMAGE="${NEW_IMAGE_PATH}/$(sha256sum "${IMAGE}" | cut -d ' ' -f 1)"

        mkdir -p "${NEW_IMAGE_PATH}"
        cp "${IMAGE}" "${NEW_IMAGE}"

        # normalize image filename
        # this doesn't work
        # IMAGE="$(printf '%s' "${IMAGE}" | jq -sRr @uri)"

        # echo "${IMAGE}"

        if [[ -f "${NEW_IMAGE}" ]]; then
            gio set "${dir}" metadata::custom-icon "file://${NEW_IMAGE}"
        fi
        # gio set -t stringv "${dir}" metadata::emblems emblem-default
    fi
done
