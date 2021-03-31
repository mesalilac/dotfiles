local menu = require "functions.menu"
local install = require "functions.install"
local window_manager = {}


function window_manager.install()
    WindowManager = menu.prompt{optoins=[[
dwm               
]], title="window manager"}

    if WindowManager == "dwm" then
        os.execute([[
            mkdir -pv ~/wm
            cd ~/wm 

            git clone https://github.com/Senpai-10/dwm.git 
            cd dwm
            sudo make install 
            cd ..

            git clone https://github.com/Senpai-10/dmenu.git 
            cd dmenu
            sudo make install 
            cd ..

            installing "slstatus"
            git clone https://github.com/Senpai-10/slstatus.git 
            cd slstatus
            sudo make install 
            cd ..

            sudo echo "exec slstatus &" >> ~/.xinitrc
            sudo echo "exec dwm" >> ~/.xinitrc
        ]])
    end

    compositor = menu.prompt{optoins=[[
compton               
picom
]], title="compositor"}

    if compositor == "compton" then
        install.yay("compton-tryon-git")
        os.execute([[
            sudo cp -r ../../dotfiles/compton ~/.config/
            sudo echo \"compton --config ~/.config/compton/compton.conf &\" >> ~/.xinitrc
        ]])
    end

    if compositor == "picom" then
        install.pacman("picom")
        os.execute([[
            sudo cp ../../dotfiles/picom.conf ~/.config/
            sudo echo \"picom -f &\" >> ~/.xinitrc
        ]])
    end

end

return window_manager

