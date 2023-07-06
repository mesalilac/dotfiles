udiskie -aNq &

if [[ -z $DISPLAY && $(tty) = "/dev/tty1" ]]; then
    # clear
    # export DESKTOP_ENV=$(echo -e "tty\nawesomewm" | smenu -Mc -m "Select desktop session")
    # clear
    # [ ! $DESKTOP_ENV = "tty" ] && exec startx

    exec startx
fi

