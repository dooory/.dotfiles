vim.pack.add({
    "https://www.github.com/rmagatti/auto-session",
})

local autosession = require("auto-session")

autosession.setup({
    suppressed_dirs = {
        "~/",
        "~/Downloads",
        "/",
    },
})
