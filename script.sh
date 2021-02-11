#!/bin/bash

# chmod +x <fileName>

echo -e "\e[92m\e[1mInstalling\e[0m some \e[1mbasic system utilities\e[0m."

cd ~
sudo apt-get update -qq

# Install Multimedia Codecs
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo apt install -yy ubuntu-restricted-extras

sudo apt install -yy htop xdotool 

echo -e "\e[92m\e[1mInstalling\e[0m \e[1mGoogle Chrome\e[0m."

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -yy ./google-chrome-stable_current_amd64.deb

echo -e "\e[92m\e[1mInstalling\e[0m \e[1mSimpleScreenRecorder\e[0m and \e[1mSpotify\e[0m."

sudo apt-get update -qq
sudo apt-get install -yy simplescreenrecorder spotify-client

echo -e "\e[92m\e[1mInstalling\e[0m \e[1mdiscord\e[0m"

sudo apt update
sudo apt install -yy gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi -n ~/discord.deb


echo -e "\e[92m\e[1mInstalling\e[0m \e[1mdevelopment\e[0m stuff."


echo -e "\e[92m\e[1mInstalling\e[0m \e[1mvscode\e[0m."
sudo apt install -yy software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -yy code


echo -e "\e[92m\e[1mInstalling\e[0m \e[1mnode, npm\e[0m."
sudo apt install -yy nodejs
sudo apt install -yy npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo apt-get install -yy --reinstall nodejs-legacy

echo -e "\e[92m\e[1mInstalling\e[0m \e[1mpython3\e[0m."
sudo apt-get install -yy python3


echo -e "\e[92m\e[1mInstalling\e[0m \e[1mgit\e[0m."
sudo apt install -yy git

echo -e "\e[92m\e[1mInstalling\e[0m \e[1mvim\e[0m."
sudo apt install -yy vim


echo -e "\e[92m\e[1mInstalling\e[0m \e[1mg++\e[0m."
sudo apt install -yy g++


# gaming
echo -e "\e[92m\e[1mInstalling\e[0m \e[1msteam\e[0m."
sudo apt install -yy steam
