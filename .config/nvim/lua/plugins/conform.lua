vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        conform.format()
    end,
})
