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

-- Close all buffers but this one https://stackoverflow.com/questions/4545275
vim.keymap.set("n", "<c-d>", ":<c-u>%bd|e#<cr>", default)

-- Remove c-c echo message
vim.keymap.set("n", "<c-c>", "<c-c>", { silent = true })

-- Clear
vim.keymap.set("n", "<c-l>", function()
  vim.cmd("nohlsearch")
  vim.cmd("diffupdate")
  vim.cmd('echo ""')
end, default)

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
vim.keymap.del("i", "<c-s>")
vim.keymap.del("s", "<c-s>")

-- LSP
vim.keymap.set("n", "R", vim.lsp.buf.rename, default)

-- Toggle diagnostics
local prev_win
vim.keymap.set("n", "<c-m>", function()
  if vim.fn.getloclist(0, { winid = 0 }).winid == 0 then
    prev_win = vim.api.nvim_get_current_win()
    vim.diagnostic.setloclist({ open = true })
  else
    vim.cmd("lclose")
    if prev_win and vim.api.nvim_win_is_valid(prev_win) then
      vim.api.nvim_set_current_win(prev_win)
    end
  end
end, default)

-- Find file
vim.keymap.set("n", "<c-p>", function()
  local fzy = require("fzy")
  fzy.execute("fd --type f --strip-cwd-prefix", fzy.sinks.edit_file)
end, default)

-- Format file
vim.keymap.set("n", "==", "<cmd>Format<cr>", default)

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
  pattern = "python,scheme,lisp,lua",
  callback = function()
    local opts = {
      noremap = true,
      silent = true,
      buffer = true
    }

    -- Send file to repl
    vim.keymap.set("n", "<c-c><c-k>", function()
      local path = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
      local filetype = vim.bo.filetype
      local cmd = nil

      if filetype == "python" then
        cmd = "%run -i " .. path .. "\n"
      elseif filetype == "scheme" or filetype =="lisp" then
        cmd = '(load "' .. path .. '")\n'
      elseif filetype == "lua" then
        cmd = 'dofile("' .. path .. '")\n'
      end

      vim.fn["slime#send"](cmd)
    end, opts)

    -- Clear screen
    vim.keymap.set("n", "<c-c><c-l>", '<cmd>SlimeSend0 "\x0c"<cr>', opts)

    -- Clear input
    vim.keymap.set("n", "<c-c><c-u>", '<cmd>SlimeSend0 "\x15"<cr>', opts)
  end,
})
