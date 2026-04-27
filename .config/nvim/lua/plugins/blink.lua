vim.pack.add({
    "https://github.com/saghen/blink.cmp",
    "https://github.com/saghen/blink.lib",
    "https://github.com/rafamadriz/friendly-snippets",
})

local blink = require("blink.cmp")

blink.setup({
    sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            },
        },
    },
    completion = {
        menu = {
            auto_show_delay_ms = 0,
        },
    },
})
