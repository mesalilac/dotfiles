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
    cd ../..
    cd themes
    
    mkdir -p ~/.config/kitty/ &&
    mkdir -p ~/.config/kitty/themes &&
    cp kitty/* ~/.config/kitty/themes/ &&
    touch ~/.config/kitty/kitty.conf &&
    echo -e "include themes/2.conf" >> ~/.config/kitty/kitty.conf &&
    echo -e "sync_to_monitor yes" >> ~/.config/kitty/kitty.conf &&
    gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty 
fi

