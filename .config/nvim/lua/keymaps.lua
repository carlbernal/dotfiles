local default = {
  noremap = true,
  silent = true,
}

-- Swap zt and zz
vim.keymap.set("n", "zz", "zt", default)
vim.keymap.set("n", "zt", "zz", default)

-- Remap esc in terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", default)

-- Delete buffer https://stackoverflow.com/questions/1444322
vim.keymap.set("n", "<c-x>", ":<c-u>bp<bar>sp<bar>bn<bar>bd!<cr>", default)

-- Remove c-c echo message
vim.keymap.set("n", "<c-c>", "<c-c>", { silent = true })

-- Add InsertLeave event to various verbs
vim.keymap.set("n", "x", "x:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "p", "p:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "u", "u:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "<c-r>", "<c-r>:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "~", "~:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "D", function()
  vim.cmd("normal! D")
  vim.cmd("doautocmd InsertLeave")
end, { silent = true })
vim.keymap.set("n", "dd", function()
  vim.cmd("normal! dd")
  vim.cmd("doautocmd InsertLeave")
end, { silent = true })
vim.keymap.set("v", "d", function()
  vim.cmd('normal! d')
  vim.cmd("doautocmd InsertLeave")
end, { silent = true })

-- Restore gq default behavior
vim.keymap.set("n", "gq", "gq", default)
vim.keymap.set("v", "gq", "gq", default)

-- Remove default LSP keymap
vim.keymap.set("n", "<c-w>d", "<nop>", default)
vim.keymap.set("n", "K", "<nop>", default)
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")
vim.keymap.del("i", "<C-s>")
vim.keymap.del("s", "<C-s>")

-- LSP
vim.keymap.set("n", "R", vim.lsp.buf.rename, default)
vim.keymap.set("n", "<c-.>", vim.lsp.buf.code_action, default)

-- Diagnostics
vim.keymap.set("n", "<c-m>", function()
  vim.diagnostic.setloclist({ open = true })
end, default)

-- FZF
vim.keymap.set("n", "<c-p>", "<cmd>FzfLua files<cr>", default)
vim.keymap.set("n", "<c-\\>", "<cmd>FzfLua buffers<cr>", default)

-- Format file
vim.keymap.set("n", "==", "<cmd>Format<cr>", default)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "==", "<cmd>GoFmt<cr>", default)
  end,
})

-- Tagbar
vim.keymap.set("n", "<c-o>", "<cmd>TagbarToggle<cr>", default)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tagbar",
  callback = function()
    vim.keymap.set("n", "<esc>", "<c-w>c", { buffer = true })
  end,
})

-- Gitsigns textobject
vim.keymap.set({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<cr>", default)

-- Slime
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Send file to ipython
    vim.keymap.set("n", "<c-c><c-k>", function()
      local path = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
      vim.fn["slime#send"]("%run -i " .. path .. "\n")
    end, default)

    -- Clear screen
    vim.keymap.set("n", "<c-c><c-l>", '<cmd>SlimeSend0 "\x0c"<cr>', default)

    -- Clear input
    vim.keymap.set("n", "<c-c><c-u>", '<cmd>SlimeSend0 "\x15"<cr>', default)
  end,
})
