local menu = require "functions.menu"
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

            echo "exec slstatus &" >> ~/.xinitrc
            echo "exec dwm" >> ~/.xinitrc
        ]])
    end

end

return window_manager

