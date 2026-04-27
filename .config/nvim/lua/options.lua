local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 10
opt.wrap = false

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"

opt.mouse = "a"
opt.undofile = true
opt.swapfile = false

opt.winborder = "rounded"
opt.laststatus = 2

require("modules/statusline")
