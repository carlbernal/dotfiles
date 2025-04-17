local default = {
  noremap = true,
  silent = true,
}

-- Remap shift + enter to zt
vim.keymap.set("n", "<s-cr>", "zt", default)

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

-- Remove default LSP mappings
vim.keymap.set("n", "<c-w>d", "<nop>", default)
vim.keymap.set("n", "K", "<nop>", default)
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")
vim.keymap.del("i", "<C-s>")
vim.keymap.del("s", "<C-s>")

-- Diagnostics mappings
vim.keymap.set("n", "<c-cr>", function()
  vim.diagnostic.setloclist({ open = true })
end, default)

-- FZF keymaps
vim.keymap.set("n", "<c-p>", "<cmd>FzfLua files<cr>", default)
vim.keymap.set("n", "<c-\\>", "<cmd>FzfLua buffers<cr>", default)

-- Open tagbar
vim.keymap.set("n", "<c-->", "<cmd>TagbarToggle<cr>", default)

-- -- Close tagbar
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tagbar",
  callback = function()
    vim.keymap.set("n", "<esc>", "<c-w>c", { buffer = true })
  end,
})

-- Gitsigns Textobject
vim.keymap.set({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<cr>", default)

-- Slime keymaps
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python,scheme,lisp,clojure",
  callback = function()
    -- Send file to repl
    vim.keymap.set("n", "<c-c><c-k>", function()
      local filetype = vim.bo.filetype
      local path = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
      local cmd = ""

      if filetype == "python" then
        cmd = "%run -i " .. path .. "\n"
      elseif filetype == "scheme" or filetype == "lisp" then
        cmd = '(load "' .. path .. '")\n'
      end

      -- https://github.com/jpalardy/vim-slime/blob/main/autoload/slime.vim#L140
      vim.fn["slime#send"](cmd)
    end, default)
    -- Clear screen
    vim.keymap.set("n", "<c-c><c-l>", '<cmd>SlimeSend0 "\x0c"<cr>', default)
    -- Clear input
    vim.keymap.set("n", "<c-c><c-u>", '<cmd>SlimeSend0 "\x15"<cr>', default)
  end,
})
