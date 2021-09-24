#! /usr/bin/bash

mkdir -p /usr/share/cmus/ &&
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
