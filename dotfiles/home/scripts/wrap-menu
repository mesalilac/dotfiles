#!/usr/bin/env bash

# Script to help connect and disconnect from WARP
# CLI to the WARP service daemon

COMMANDS=(
    "status"
    "connect"
    "disconnect"
)

COMMAND="$(printf '%s\n' "${COMMANDS[@]}" | rofi -dmenu)"

if [[ -z "${COMMAND}" ]]; then
    notify-send "Error" "Invaild command"
    exit 1
fi

if [[ "${COMMAND}" = "status" ]]; then
    if OUTPUT=$(warp-cli status); then
        notify-send "${COMMAND}" "${OUTPUT}"
    else
        notify-send "Error" "Failed to run: 'warp-cli ${COMMAND}'"
    fi
fi

if [[ "${COMMAND}" = "connect" ]]; then
    if OUTPUT=$(warp-cli connect); then
        notify-send "${COMMAND}" "${OUTPUT}"
    else
        notify-send "Error" "Failed to run: 'warp-cli ${COMMAND}'"
    fi
fi

if [[ "${COMMAND}" = "disconnect" ]]; then
    if OUTPUT=$(warp-cli disconnect); then
        notify-send "${COMMAND}" "${OUTPUT}"
    else
        notify-send "Error" "Failed to run: 'warp-cli ${COMMAND}'"
    fi
fi

