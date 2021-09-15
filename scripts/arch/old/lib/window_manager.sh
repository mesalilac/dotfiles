#! /usr/bin/bash

if [[ $window_manager == "dwm" ]] 
then
    mkdir -p ~/wm &&
    cd ~/wm &&

    git clone https://github.com/Senpai-10/dwm.git &&
    cd dwm &&
    sudo make install &&
    cd .. &&

    git clone https://github.com/Senpai-10/dmenu.git &&
    cd dmenu &&
    sudo make install &&
    cd .. &&

    git clone https://github.com/Senpai-10/dwmblocks.git &&
    cd dwmblocks &&
    sudo make install &&
    cd .. &&
fi

if [[ $window_manager == "openbox" ]]
then
    pac "openbox"
    pac "obconf"
    pac "lxappearance-obconf"
    pac "menumaker"
fi

if [[ $window_manager == "bspwm" ]]
then
    pac "bspwm"
    pac "sxhkd"
    ya "btops-git"
fi