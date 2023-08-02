#!/usr/bin/env bash

# convert videos from major_brand: isom to major_brand: mp42
# in bulk
# helped me beacuse i can't stream videos with major_brand: isom

NO_COLOR='\033[0m'
BIGreen='\033[1;92m'

rm -rf temp
mkdir temp
for i in *.mp4
do
    echo -e "${BIGreen}Converting ${i}${NO_COLOR}"
    ffmpeg -i "$i" -c:v libx264 -preset slow -crf 20 -c:a aac -b:a 160k -vf format=yuv420p -movflags +faststart temp/${i}
    # ffmpeg -i "$i" -map 0 -c copy -brand mp42 -movflags +faststart "temp/${i}"
    # ffmpeg -y -i "temp/${i}" -vcodec libx264 ${i}
done

