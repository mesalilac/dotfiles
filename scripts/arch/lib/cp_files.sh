mkdir -p ~/.config && 
mkdir -p ~/.config/nvim &&
mkdir -p ~/.config/mpv &&
mkdir -p ~/.config/mpv/scripts &&
mkdir -p /usr/share/cmus/ &&
mkdir -p ~/.themes &&
mkdir -p ~/.icons &&


# dotfiles/
cp $DIR_PATH/dotfiles/nvim/init.vim ~/.config/nvim/ || echo "can't copy init.vim" >> ~/log
cp $DIR_PATH/dotfiles/.* ~/
cp -rf $DIR_PATH/dotfiles/.profile ~/
# cp -r $DIR_PATH/dotfiles/compton ~/.config/
cp $DIR_PATH/dotfiles/picom.conf ~/.config
cp $DIR_PATH/dotfiles/mpv_scripts/* ~/.config/mpv/scripts/ || echo "can't copy mpv scripts" >> ~/log
touch ~/.config/mpv/mpv.conf && echo "osc=no\nfs" >> ~/.config/mpv/mpv.conf
cp -rf $DIR_PATH/dotfiles/scripts ~/
cp -rf $DIR_PATH/dotfiles/jgmenu ~/.config/
cp -rf $DIR_PATH/dotfiles/openbox ~/.config/
cp -rf $DIR_PATH/dotfiles/polybar ~/.config/


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
