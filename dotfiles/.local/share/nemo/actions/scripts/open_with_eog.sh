#!/bin/env bash

# Open all supplied dirs from selection
for dir in "$@"; do
    TARGET_DIR="$dir"

    eog "$TARGET_DIR" &
done

