local install = {}

function install.pacman(package)
    os.execute(string.format("sudo pacman -S %s --noconfirm || echo \"- installation failed pacman %s\" >> ~/arch_script_log", package, package))
end

function install.yay(package)
    os.execute(string.format("yay -S %s || echo \"- installation failed yay %s\" >> ~/arch_script_log", package, package))
end

return install