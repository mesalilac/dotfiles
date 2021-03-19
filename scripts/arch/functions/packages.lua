local screen = require "functions.screen"
local install = require "functions.install"
local menu = require "functions.menu"

local packages = {}

function packages.install()
    print("installing packages")
    install.pacman("nemo")
end

return packages