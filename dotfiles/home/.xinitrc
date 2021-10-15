#!/bin/sh

window_manager="bspwm"

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrandr --output HDMI-1 --primary
xrandr --output LVDS-1 --off

~/scripts/./autostart &

if [[ $window_manager = "openbox" ]]; then
  echo "openbox" > ~/.wm
  nemo-desktop &
  exec openbox-session
fi

if [[ $window_manager = "dwm" ]]; then
  echo "dwm" > ~/.wm
  exec dwmblocks &
  exec dwm
fi

if [[ $window_manager = "bspwm" ]]; then
  echo "bspwm" > ~/.wm
  exec bspwm
fi
