local Statusline = {
    showpath = true,
    showbranch = true,
    icons = {
        path_hidden = "",
        branch_hidden = "",
    },
}

local function git()
    local git_info = vim.b.gitsigns_status_dict

    if not git_info or git_info.head == "" then
        return ""
    end

    local head = git_info.head
    local added = git_info.added and (" +" .. git_info.added) or ""
    local removed = git_info.removed and (" -" .. git_info.removed) or ""
    local changed = git_info.changed and (" ~" .. git_info.changed) or ""

    if not Statusline.showbranch then
        head = Statusline.icons.branch_hidden
    end

    return table.concat({
        "[ ",
        head,
        added,
        changed,
        removed,
        "]",
    })
end

local function filepath()
    local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")

    if fpath == "" or fpath == "." then
        return ""
    end

    if Statusline.showpath then
        return string.format("%%<%s/", fpath)
    end

    return Statusline.icons.path_hidden .. "/"
end

function Statusline.active()
    return table.concat({
        "[",
        filepath(),
        "%t] ",
        git(),
        "%=",
        "%y [%P %l:%c]",
    })
end

function Statusline.inactive()
    return "[%f]%=%y [%P %l:%c]"
end

function Statusline.togglepath()
    Statusline.showpath = not Statusline.showpath

    vim.cmd("redrawstatus")
end

function Statusline.togglebranch()
    Statusline.showbranch = not Statusline.showbranch

    vim.cmd("redrawstatus")
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = group,
    desc = "Activate statusline on focus",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.require('modules/statusline').active()"
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = group,
    desc = "Deactivate statusline when unfocused",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.require('modules/statusline').inactive()"
    end,
})

return Statusline
