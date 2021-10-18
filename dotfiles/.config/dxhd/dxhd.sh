#!/bin/sh

## ------- general -------

#super+shift+return
  $TERMINAL

#super+x
  prompt "shutdown your computer?" "shutdown now"

#super+shift+p
  rofi -show window -theme $rofi_theme

#super+p
  rofi -show run -theme $rofi_theme
  
#super+e
  $FILEMANAGER
  
#super+space
  ~/scripts/./change_layout.sh
  
#alt+shift+s
  flameshot full -p ~/Screenshots

#alt+shift+p
  flameshot gui -p ~/Screenshots
  
#super+up
  amixer -D pulse sset Master 10%+ ; pkill -RTMIN+2 dwmblocks

#super+down
  amixer -D pulse sset Master 10%- ; pkill -RTMIN+2 dwmblocks

## ------- bspwm -------

#super + alt + {q,r}
	bspc {quit,wm -r}

#super + {_,shift + }c
	bspc node -{c,k}

#super + {t,shift + t,s,f}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

#super + {_,shift + }{h,j,k,l}
	bspc node -{f,s} {west,south,north,east}

#super + {b,comma,period}
	bspc node -f @{brother,first,second}

#super + bracket{left,right}
	bspc desktop -f {prev,next}.local

#super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

#super + alt + {h,j,k,l}
	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

#super + alt + shift + {h,j,k,l}
	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

#super + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}
