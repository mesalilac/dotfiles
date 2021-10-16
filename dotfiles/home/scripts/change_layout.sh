# !/bin/bash

if [ ! -f ~/keyboard_layout ]; then
  echo "us" > ~/keyboard_layout
fi

keyboard_layout=$(cat ~/keyboard_layout)

case $keyboard_layout in
  "us")
    setxkbmap ara
    echo "ara" > ~/keyboard_layout
    ;;

  "ara")
    setxkbmap us
    echo "us" > ~/keyboard_layout
    ;;

  *)
    setxkbmap us
    echo "us" > ~/keyboard_layout
    ;;
esac

keyboard_layout=$(cat ~/keyboard_layout)
sleep 0.1 && notify-send 'keyboard layout' "$keyboard_layout"