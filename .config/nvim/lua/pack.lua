local plugins = {
    "oil",
    "mini",
}

for _, name in pairs(plugins) do
    require("plugins." .. name)
end
