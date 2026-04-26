local plugins = {
    "oil",
    "mini",
    "lsp",
    "which-key",
}

for _, name in pairs(plugins) do
    require("plugins." .. name)
end
