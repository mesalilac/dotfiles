if [[ -z $DISPLAY && $(tty) = "/dev/tty1" ]]; then
    udiskie -aNq &

    # exec startx
    exec sway
fi

