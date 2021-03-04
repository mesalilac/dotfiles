#! /bin/bash

installing () {
    echo -e "- \e[92m\e[1mInstalling $1\e[0m"
}

configure () {
    echo -e "- \e[1;93mConfigure $1\e[0m"
}


PS3='Please enter your choice: '
options=("install all packages" "install kitty" "install st" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "install all packages")
            cd ~
            installing "zip"
            yes | sudo pacman -S zip
            installing "unzip"
            yes | sudo pacman -S unzip
            installing "neofetch"
            yes | sudo pacman -S neofetch
            installing "neovim"
            yes | sudo pacman -S neovim
            installing "alsa-utils"
            yes | sudo pacman -S alsa-utils
            installing "vscode"
            yes | sudo pacman -S code
            installing "discord"
            yes | sudo pacman -S discord
            installing "feh"
            yes | sudo pacman -S feh
            installing "git"
            yes | sudo pacman -S git
            
            installing "google chrome"
            cd Downloads
            git clone https://aur.archlinux.org/google-chrome.git
            cd google-chrome/
            yes | makepkg -si
            cd ~
            
            installing "htop"
            yes | sudo pacman -S htop
            installing "imagemagick"
            yes | sudo pacman -S imagemagick
            installing "nodejs"
            yes | sudo pacman -S nodejs
            installing "noto fonts emoji"
            yes | sudo pacman -S noto-fonts-emoji

            installing "noto fonts sc"
            cd Downloads
            https://aur.archlinux.org/noto-fonts-sc.git
            cd noto-fonts-sc
            yes | makepkg -si
            cd ~

            installing "npm"
            yes | sudo pacman -S npm
            installing "pulseaudio"
            yes | sudo pacman -S pulseaudio
            installing "python3"
            yes | sudo pacman -S python3
            installing "python pip"
            yes | sudo pacman -S python-pip
            installing "rxvt unicode"
            yes | sudo pacman -S rxvt-unicode
            installing "scrot"
            yes | sudo pacman -S scrot
            installing "ttf font awesome"
            yes | sudo pacman -S ttf-font-awesome
            installing "which"
            yes | sudo pacman -S which
            installing "wget"
            yes | sudo pacman -S wget
            installing "curl"
            yes | sudo pacman -S curl
	    installing "xbindkeys"
	    yes | sudo pacman -S xbindkeys
	    configure "xbindkeys"
	    echo '"setxkbmap us"' >> ~/.xbindkeysrc
	    echo -e "\tAlt+Shift+1" >> ~/.xbindkeysrc
	    echo '"setxkbmap ara"' >> ~/.xbindkeysrc
	    echo -e "\tAlt+Shift+2" >> ~/.xbindkeysrc
            ;;
        "install kitty")
            cd ~
            installing "kitty"
            # yes | sudo pacman -S kitty && echo -e "\n"
            configure "kitty"; echo -e "\n"


            echo "1) Theme (1)"
            echo -e "0) Default\n"

            echo -e "Please enter your choice: "
            read theme

            echo ""

            if [[ $theme == 1 ]]
            then
                mkdir -p ~/.config/kitty/themes
                curl https://raw.githubusercontent.com/Senpai-10/my-linux/main/themes/1/1.conf \
                -o ~/.config/kitty/themes/1.conf

                echo "include ~/.config/kitty/themes/1.conf" >> ~/.config/kitty/kitty.conf
            fi
            
            echo "sync_to_monitor (y/n): "
            read stm

            if [[ $stm == "y" ]]
            then
                echo "sync_to_monitor yes" >> ~/.config/kitty/kitty.conf
            fi

            echo "background_opacity (1 is solid): "
            read bo
            echo "background_opacity $bo" >> ~/.config/kitty/kitty.conf
            
            ;;
        "install st")
            cd ~
            echo "1) Luke's fork of st"
            echo ": "
            read st

            if [[ $st == 1 ]]
            then
                installing "Luke's fork of st"
                git clone https://github.com/LukeSmithxyz/st
                cd st
                sudo make install
                cd ~
            fi
            
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
