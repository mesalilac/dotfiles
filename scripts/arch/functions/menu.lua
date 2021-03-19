local menu = {}

function menu.prompt(arg)
    local handle = io.popen(string.format("echo -e \"%s\" | smenu -c -W $'\n' -N -M -m \"%s\"", arg.optoins, arg.title))

    local result = handle:read("*a")
    handle:close()
    return result
end

return menu