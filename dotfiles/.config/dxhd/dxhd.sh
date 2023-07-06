#!/bin/sh

## ------- general -------

# super + shift + return
  tabbed $TERMINAL --embed

# super + shift + p
  rofi -show window -theme $rofi_theme

# super + p
  rofi -show run -theme $rofi_theme

# super + e
  $FILEMANAGER

# super + space
  ~/scripts/./change_layout

# #alt + shift + s
  	# flameshot full -p ~/Screenshots
	# flameshot full -c

# #alt + shift + p
  	# flameshot gui -p ~/Screenshots
 	# flameshot gui -c

# super + up
  amixer -D pulse sset Master 10%+ ; pkill -RTMIN+2 dwmblocks

# super + down
  amixer -D pulse sset Master 10%- ; pkill -RTMIN+2 dwmblocks

## ------- bspwm -------

# super + alt + {q,r}
	bspc {quit,wm -r}

# super + {_,shift + }c
	bspc node -{c,k}

# super + {t,shift + t,s,f}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# super + {_,shift + }{h,j,k,l}
	bspc node -{f,s} {west,south,north,east}

# super + {b,comma,period}
	bspc node -f @{brother,first,second}

# super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

# super + alt + {h,j,k,l}
	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

# super + alt + shift + {h,j,k,l}
	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

# super + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}

# super + alt + p
	bspc config window_gap $(($(bspc config window_gap)+1))

# super + alt + o
	if [[ $(bspc config window_gap) -eq 0 ]]; then
		notify-send "window gap is $(bspc config window_gap)"
		else
			bspc config window_gap $(($(bspc config window_gap)-1))
	fi

## ------ F keys -------

# XF86AudioLowerVolume
    playerctl volume 0.02-

# XF86AudioRaiseVolume
    playerctl volume 0.02+

# XF86AudioMute
    playerctl volume 0.0

# XF86AudioStop
    playerctl stop

# XF86AudioPrev
    playerctl previous

# XF86AudioPlay
    playerctl play-pause

# XF86AudioNext
    playerctl next

# XF86Tools
    $TERMINAL -e cmus

# XF86Calculator
    gnome-calculator


