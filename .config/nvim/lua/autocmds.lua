-- Resize splits if window got resized
vim.api.nvim_create_autocmd("VimResized", {
    command = "tabdo wincmd =",
})

-- Set 2 space indendation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript,html,css,json",
  callback = function()
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
