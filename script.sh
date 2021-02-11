#!/bin/bash


echo "Installing some basic system utilities."

cd ~
sudo apt-get update -qq

# Install Multimedia Codecs
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo apt install -yy ubuntu-restricted-extras

sudo apt-get install -yy htop

echo "Installing Google Chrome."

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -yy ./google-chrome-stable_current_amd64.deb

echo "Installing SimpleScreenRecorder and Spotify."

sudo apt-get update -qq
sudo apt-get install -yy simplescreenrecorder spotify-client

echo "Installing discord"

sudo apt update
sudo apt install -yy gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi -n ~/discord.deb


echo "Installing development stuff."

# install vscode
sudo apt install -yy software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -yy code

# install node, npm

sudo apt install -yy nodejs
sudo apt install -yy npm

# install python3

sudo apt-get install -yy python3

# install git

sudo apt install -yy git



