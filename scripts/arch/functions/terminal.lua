local menu = require "functions.menu"

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
        print()
    end
end

return terminal