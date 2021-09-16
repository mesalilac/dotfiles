#! /usr/bin/bash

[[ -z $terminal ]] && echo "Error: see ~/log " &&
echo "no terminal in config.sh" >> ~/log

if [[ $terminal == "st" ]]
then
    cd ~
    git clone https://github.com/senpai-10/st.git
    cd st
    sudo make install
    gsettings set org.cinnamon.desktop.default-applications.terminal exec st
fi

if [[ $terminal == "kitty" ]]
then
    pac "kitty"
    gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty 
fi

if [[ $Terminal == "alacritty" ]]
then
  sudo pacman -S alacritty
  gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty 
fi


