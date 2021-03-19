local screen = require "functions.screen"
local menu = require "functions.menu"
local packages = require "functions.packages"

os.execute([[
    if pacman -Qe "yay" > /dev/null ; then
        echo
    else
        cd ~
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
    fi

    if pacman -Qe "smenu" > /dev/null ; then
        echo
    else
        yay -S smenu
    fi
]])

screen.clear()

menu = menu.prompt{optoins=[[
packages               
window manager
terminal
update
quit
]]
                ,title="window manager"}

if menu == "packages" then packages.install() end

if menu == "update" then screen.clear(); os.execute("sudo pacman -Syu") end
if menu == "quit" then os.execute("exit") end