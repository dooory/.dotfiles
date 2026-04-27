local map = vim.keymap.set

vim.g.mapleader = " "

local wk = require("which-key")

-- Better window navigation
map("n", "<C-h>", "<C-w>h") -- move left
map("n", "<C-j>", "<C-w>j") -- move down
map("n", "<C-k>", "<C-w>k") -- move up
map("n", "<C-l>", "<C-w>l") -- move right

-- Move lines up and down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Better indenting in visual mode (keeps selection)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Split windows
map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>s", ":split<CR>")

-- Paste without overwriting register
map("v", "p", '"_dP')

map("n", "<leader>r", ":restart<CR>", { desc = "Restart neovim" })

wk.add({
    {
        "<leader>l",
        group = "Statusline toggles",
    },
})

map("n", "<leader>lp", function()
    local statusline = require("modules/statusline")
    statusline.togglepath()
end, {
    desc = "Toggle statusline path",
})

map("n", "<leader>lb", function()
    local statusline = require("modules/statusline")
    statusline.togglebranch()
end, {
    desc = "Toggle statusline git branch",
})
