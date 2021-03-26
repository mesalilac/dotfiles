local screen = require "functions.screen"
local install = require "functions.install"
local menu = require "functions.menu"

local packages = {}

function packages.install()
    -- setup user folders
    os.execute([[
        mkdir -p ~/Documents
        mkdir -p ~/Pictures
        mkdir -p ~/Downloads
        mkdir -p ~/Music
        mkdir -p ~/Videos
        mkdir -p ~/Screenshots
    ]])

    -- utilities
    install.pacman("zip")
    install.pacman("unzip")
    install.pacman("wget")
    install.pacman("bashtop")
    install.pacman("cmus")
    install.pacman("bat")
    install.pacman("picom")
    install.pacman("easytag")
    install.pacman("nemo")
    install.pacman("ffmpegthumbnailer")
    install.pacman("ffmpegthumbs")
    install.pacman("mpv")
    install.pacman("vlc")
    install.pacman("pavucontrol")
    install.pacman("nitrogen")
    install.pacman("udisks2")
    install.pacman("ntfs-3g")
    install.pacman("neofetch")
    install.pacman("neovim")
    install.pacman("alsa-utils")
    install.pacman("code")
    install.pacman("feh")
    install.pacman("git")
    install.pacman("discord")
    install.pacman("htop")
    install.pacman("imagemagick")
    install.pacman("nodejs")
    install.pacman("npm")
    install.pacman("pulseaudio")
    install.pacman("python3")
    install.pacman("python-pip")
    install.pacman("rxvt-unicode")
    install.pacman("scrot")
    install.pacman("which")
    install.pacman("curl")
    install.pacman("highlight")
    install.pacman("youtube-dl")
    install.pacman("tree")
    install.pacman("xbindkeys")
    install.pacman("imwheel")
    install.yay("figma-linux")
    install.yay("cava")

    -- fonts
    install.pacman("ttf-dejavu")
    install.pacman("ttf-liberation")
    install.pacman("ttf-font-awesome")
    install.pacman("noto-fonts-emoji")
    install.yay("noto-fonts-sc")
    install.yay("ttf-ms-fonts")
    os.execute([[
        cd ~/Downloads
        wget https://support.steampowered.com/downloads/1974-YFKL-4947/SteamFonts.zip
        unzip SteamFonts.zip -d SteamFonts/ && rm SteamFonts.zip
        sudo mkdir -p /usr/local/share/fonts
        sudo mv SteamFonts/* /usr/local/share/fonts
        rm -rf SteamFonts/
        cd ~
    ]])

    -- browser
    browser = menu.prompt{optoins=[[
Google chrome               
Firefox
]], title="browser"}

    if browser == "Google chrome" then install.yay("google-chrome") end
    if browser == "Firefox" then install.pacman("firefox") end

    -- copy dot files
    os.execute([[
        cd ../..
        cd dotfiles
        sudo mkdir -p ~/.config/nvim/
        
        sudo cp .* ~/
        sudo cp nvim/init.vim ~/.config/nvim/

        sudo echo \"imwheel -b 45\" >> ~/.xinitrc
    ]])

    -- copy cmus themes
    os.execute([[
        cd ../../themes/cmus
        sudo cp *.theme /usr/share/cmus/
    ]])

end

return packages
