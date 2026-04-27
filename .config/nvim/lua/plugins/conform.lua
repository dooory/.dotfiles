vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettier" },
        js = { "prettier" },
        css = { "prettier" },
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        conform.format()
    end,
})

vim.keymap.set("n", "<leader>bf", function()
    conform.format()
end, {
    desc = "Format Buffer",
})
