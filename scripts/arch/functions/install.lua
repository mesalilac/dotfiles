local install = {}

function install.pacman(package)
    os.execute(string.format("sudo pacman -S %s --noconfirm", package))
end

function install.yay(package)
    os.execute(string.format("yay -S %s", package))
end

return install