

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

function main()
    local screen = require "functions.screen"
    local menu = require "functions.menu"

    local packages = require "functions.packages"
    local window_manager = require "functions.window_manager"

    screen.clear()

    menu = menu.prompt{optoins=[[
packages               
window manager
terminal
update
quit
]], title="install"}

    if menu == "packages" then screen.clear(); packages.install() end
    if menu == "window manager" then screen.clear(); window_manager.install() end

    if menu == "update" then screen.clear(); os.execute("sudo pacman -Syu") end
    if menu == "quit" then screen.clear(); os.execute("exit") end

end


main()
