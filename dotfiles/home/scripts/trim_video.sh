#!/bin/bash

# Arguments
FILE_RAW=$1
TRIM_EOF_DURATION=${2:-1.0} # Default is 1.0 second trimmed from EOF

# Prepare variables
BASE_PATH=$(dirname "$(readlink -f $FILE_RAW)")
FILENAME_EXT="$(basename "${FILE_RAW}")"
FILENAME_ONLY="${FILENAME_EXT%.*}"
EXT_ONLY="${FILENAME_EXT#*.}" # Or hardcode it like "mp4"
FILENAME_ONLY_PATH="${BASE_PATH}/${FILENAME_ONLY}"

# Trim EOF duration
INPUT_DURATION=$(ffprobe -v error -select_streams v:0 -show_entries stream=duration -of default=noprint_wrappers=1:nokey=1 "${FILENAME_ONLY_PATH}.${EXT_ONLY}")
OUTPUT_DURATION=$(bc <<< "$INPUT_DURATION"-"$TRIM_EOF_DURATION")
ffmpeg -i "${FILENAME_ONLY_PATH}.${EXT_ONLY}" -map 0 -c copy -t "$OUTPUT_DURATION" "${FILENAME_ONLY_PATH}_Trim_${TRIM_EOF_DURATION}.${EXT_ONLY}"
