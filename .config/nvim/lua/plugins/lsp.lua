vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

local mason, mason_tool_installer = require("mason"), require("mason-tool-installer")

mason.setup({})
mason_tool_installer.setup({
    ensure_installed = { "lua_ls", "emmet_language_server", "eslint", "prettier", "cssls", "ts_ls", "html" },
    integrations = {
        ["mason-lspconfig"] = true,
    },
})

local fidget = require("fidget")
fidget.setup({})

local lazydev = require("lazydev")
lazydev.setup({})

vim.lsp.enable("lua_ls")
vim.lsp.enable("emmet_language_server")
vim.lsp.enable("eslint")
vim.lsp.enable("cssls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("html")

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
