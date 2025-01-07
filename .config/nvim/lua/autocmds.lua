local my_autocmds = vim.api.nvim_create_augroup("my_autocmds", { clear = true })

-- Resize splits if window got resized
vim.api.nvim_create_autocmd("VimResized", {
    group = my_autocmds,
    command = "tabdo wincmd =",
})

-- Set 2 space indendation for some filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript,html,css,json",
    group = my_autocmds,
    callback = function()
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- Set quickfix list options
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    group = my_autocmds,
    callback = function()
        vim.opt_local.buflisted = false
        vim.opt_local.relativenumber = false
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

-- Set lint on insert leave
vim.api.nvim_create_autocmd("InsertLeave", {
    group = my_autocmds,
    callback = function()
        require("lint").try_lint()
    end,
})
