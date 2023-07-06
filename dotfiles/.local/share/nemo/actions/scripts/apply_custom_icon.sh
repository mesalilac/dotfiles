#!/bin/bash

#Shell script for nemo action apply_custom_icons
#Requires zenity - apt install zenity
#Requires imagemagick - apt install imagemagick
#Requires wmctrl - apt install wmctrl

#Make a local custom-icons directory if it does not exist

ICONS_DIR="$HOME/.cache/custom-icons/icons"

mkdir -p "$ICONS_DIR"

function create_custom_icon {
    if [ -n "$1" ] || [ -n "$2" ]; then
        cp "$2" /tmp/icon.png

        OUTPUT_FILE="$ICONS_DIR"/custom-icon-$(identify -format %#\\n /tmp/icon.png | cut -c 1-24)

        # move /tmp/icon.png to $ICONS_DIR
        mv -f /tmp/icon.png "$OUTPUT_FILE".png

        #Apply new icon to directory
        gio set "$1" metadata::custom-icon "file://$OUTPUT_FILE.png"
    fi
}

ANSWER=$(zenity --list --radiolist \
    --text "Use file selection dialogue:" \
    --hide-header \
    --column "option" \
    --column "desc" \
    TRUE "pick image to use as folder icon" \
    FALSE "use a random image" \
    FALSE "loop dir and set for all subdirs the first image inside of them" \
)

#Random image or picker?
if [ "$ANSWER" == "pick image to use as folder icon" ]; then
    #Picker
    if [ -d "$1" ]; then
        SOURCE_DIR="$1"
    else
        SOURCE_DIR=$(xdg-user-dir PICTURES)
    fi

    SOURCE_PIC=$(zenity --file-selection --filename="$SOURCE_DIR"/ --file-filter='Supported media (jpg/png/gif/tiff/mp3/mp4/mkv/avi/mov) | *.jp*g *JP*G *.png *.PNG *.gif *.GIF *.tif* *.TIF^ *.mp* *.MP* *.mkv *.MKV *.avi *.AVI *.mov *.MOV' --file-filter='All files | *' --title "Select source file")

    if [ -z "$SOURCE_PIC" ]; then
        exit 1;
    fi
    create_custom_icon "$1" "$SOURCE_PIC"
elif [ "$ANSWER" == "use a random image" ]; then
    #Random image select a maxdepth
    DEPTH=$(zenity --entry --title="Select maximum depth." --entry-text="1" --text="Confirm the maximum number of sub directory levels to search for images\n\nThe value should be greater than 0\n")

    if [ -z "$DEPTH" ]; then
        exit 1;
    fi

    if [[ ! $DEPTH =~ ^[0-9]+$ ]] || [[ $DEPTH = "0" ]]; then
        zenity --info --width=250 --text="Depth must be an integer greater than 0. Aborting operation. Please try again.";
        exit 1
    fi

    SOURCE_PIC=$(find -L "$1" -maxdepth "$DEPTH" -iname '*.jp*g' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.tif*' -o -iname '*.mp*' -o -iname '*.mkv' -o -iname '*.avi' -o -iname '*.mov' | shuf -n1)

    if [ -z "$SOURCE_PIC" ]; then
        zenity --error --width=250 --text="Could not apply a random custom emblem\n\nNo supported file type found in directory"
        exit 1;
    fi
    create_custom_icon "$1" "$SOURCE_PIC"
elif [ "$ANSWER" == "loop dir and set for all subdirs the first image inside of them" ]; then
    THIS_DIR="$1"

    echo "Changing folders icons........"
    find -L "$THIS_DIR" -type d -maxdepth 1 | while read dir_name; do
        if [ "$dir_name" == "$THIS_DIR" ]; then
            continue
        fi

        SOURCE_PIC="$dir_name/$(ls "$dir_name" | sort -V | head -n 1)"

        if [ -z "$SOURCE_PIC" ]; then
            exit 1;
        fi

        create_custom_icon "$dir_name" "$SOURCE_PIC"
    done
    echo "Done........"
fi

# auto reload current location
# xdotool key ctrl+r
