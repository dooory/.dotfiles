vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/folke/lazydev.nvim",
})

local fidget = require("fidget")
fidget.setup({})

local lazydev = require("lazydev")
lazydev.setup({})

vim.lsp.enable("lua_ls")
