local menu = require "functions.menu"
local install = require "functions.install"
local screen = require "functions.screen"

local terminal = {}

function terminal.install()
    Terminal = menu.prompt{optoins=[[
st               
kitty
]], title="terminal"}

    if Terminal == "st" then
        local st_build = menu.prompt{optoins=[[
Luke st               
suckless st
        ]], title="st build"}

        if st_build == "Luke st" then
            os.execute([[
                cd ~
                git clone https://github.com/LukeSmithxyz/st
                cd st
                sudo make install
            ]])
        end

        if st_build == "suckless st" then
            os.execute([[
                cd ~
                git clone https://git.suckless.org/st
                cd st
                sudo make install
            ]])
        end
    end

    if Terminal == "kitty" then
        install.pacman("kitty")

        screen.clear()

        function CopyTheme(theme_number)
            os.execute(string.format([[
                mkdir -p ~/.config/kitty/themes

                theme_number=%s

                cd ../../themes/$theme_number
                cp $theme_number.conf ~/.config/kitty/themes

                echo -e "include themes/$theme_number.conf" >> ~/.config/kitty/kitty.conf
                
            ]], theme_number))
        end

        theme = menu.prompt{optoins=[[
1               
2
default
]], title="kitty theme"}

        if theme == "1" then CopyTheme(1) end
        if theme == "2" then CopyTheme(2) end

        screen.clear()

        sync_to_monitor = menu.prompt{optoins=[[
yes               
no
]], title="sync_to_monitor"}

        if sync_to_monitor == "yes" then os.execute("echo 'sync_to_monitor yes' >> ~/.config/kitty/kitty.conf") end

        os.execute([[
            gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty
        ]])
    end
end

return terminal