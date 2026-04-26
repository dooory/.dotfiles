local plugins = {
    "oil",
    "mini",
    "lsp",
}

for _, name in pairs(plugins) do
    require("plugins." .. name)
end
