#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# NOTE: Not starting gnome-keyring-daemon makes gcr-prompter starts faster
# eval "$(/usr/bin/gnome-keyring-daemon --replace -d --components=secrets,ssh,pcks11)"
# export SSH_AUTH_SOCK

# merge in defaults and keymaps
[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
    dbus-update-activation-environment DISPLAY XAUTHORITY
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
    done
    unset f
fi

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# .screenlayout/main.sh
# xrandr --output DP-4 --primary --scale 0.75x0.75 --filter bilinear -r 165
xrandr --output eDP-1 --primary --scale 0.75x0.75 --filter bilinear -r 165 \
       --output HDMI-0 --auto --pos 1920x0

# start awesomewm
exec dbus-run-session awesome
