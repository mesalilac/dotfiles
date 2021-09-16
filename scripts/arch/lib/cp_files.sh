#! /usr/bin/bash

mkdir -p ~/.config && 
mkdir -p ~/.config/nvim &&
mkdir -p ~/.config/mpv &&
mkdir -p ~/.config/mpv/scripts &&
mkdir -p /usr/share/cmus/ &&
mkdir -p ~/.themes &&
mkdir -p ~/.icons &&
mkdir -p ~/.config/BetterDiscord &&
mkdir -p /usr/share/fonts/TTF &&

# dotfiles/
cp -rf $DIR_PATH/dotfiles/.config ~/.config
cp -rf $DIR_PATH/dotfiles/home ~/

# fonts/
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
sudo cp $DIR_PATH/fonts/*.ttf /usr/share/fonts/TTF
# sudo cp $DIR_PATH/fonts/*.otf /usr/share/fonts/OTF


# themes/
sudo cp $DIR_PATH/themes/cmus/*.theme /usr/share/cmus/
cp -r $DIR_PATH/themes/gtk/* ~/.themes/ || echo "can't copy themes" >> ~/log
cp -r $DIR_PATH/themes/icons/* ~/.icons || echo "can't copy icons" >> ~/log
