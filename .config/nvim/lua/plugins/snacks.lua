vim.pack.add({
    "https://github.com/folke/snacks.nvim",
})

local snacks = require("snacks")

snacks.setup({
    picker = {
        enabled = true,
    },
    gitbrowse = {
        enabled = true,
    },
})

local function mapPicker(key, command, desc, args)
    vim.keymap.set("n", string.format("<leader>%s", key), function()
        snacks.picker[command](args)
    end, { desc = desc })
end

mapPicker("fb", "buffers", "Buffers")
mapPicker("fc", "files", "Config Files", { cwd = vim.fn.stdpath("config") })
mapPicker("ff", "files", "Files")
mapPicker("fr", "recent", "Recent Files")
mapPicker("fg", "grep", "Grep")

mapPicker("gl", "git_log", "Log")
mapPicker("gg", "git_files", "Files")

mapPicker("ld", "lsp_definitions", "Goto Definition")
mapPicker("lr", "lsp_references", "References")
mapPicker("lr", "lsp_references", "References")
mapPicker("li", "lsp_implementations", "Goto Implementation")
mapPicker("li", "lsp_implementations", "Goto Implementation")

vim.keymap.set("n", "<leader>go", function()
    snacks.gitbrowse.open()
end, { desc = "Open Repo In Browser" })

local wk = require("which-key")

wk.add({
    {
        "<leader>f",
        group = "Files",
    },
    {
        "<leader>g",
        group = "Git",
    },
    {
        "<leader>l",
        group = "LSP",
    },
})
