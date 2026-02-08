local opts = {
  noremap = true,
  silent = true,
}

-- ============================================================================
-- General
-- ============================================================================

-- Swap zt and zz
vim.keymap.set("n", "zz", "zt", opts)
vim.keymap.set("n", "zt", "zz", opts)

-- Clear search, diff, and messages
vim.keymap.set("n", "<c-l>", function()
  vim.cmd("nohlsearch")
  vim.cmd("diffupdate")
  vim.cmd('echo ""')
end, opts)

-- Remove c-c echo message
vim.keymap.set("n", "<c-c>", "<c-c>", { silent = true })

-- Remap esc in terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", opts)

-- Delete buffer
vim.keymap.set("n", "<c-x>", function()
  require('bufdelete').bufdelete(0, true)
  vim.notify("Buffer closed", vim.log.levels.INFO)
end, opts)

-- Close all buffers but this one
vim.keymap.set("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  local bd = require("bufdelete").bufdelete
  local count = 0
  local failed = 0

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.bo[buf].buflisted then
      local success = pcall(bd, buf, true)
      if success then
        count = count + 1
      else
        failed = failed + 1
      end
    end
  end

  if count > 0 then
    local msg = "Closed " .. count .. " other buffers"
    if failed > 0 then
      msg = msg .. " (" .. failed .. " failed)"
    end
    vim.notify(msg, vim.log.levels.INFO)
  else
    vim.notify("No other buffers to close", vim.log.levels.WARN)
  end
end, opts)

-- ============================================================================
-- Editing
-- ============================================================================

-- Add InsertLeave event to verbs
local function refresh(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, function()
    local count = vim.v.count > 0 and vim.v.count or ""
    vim.cmd("silent! normal! " .. count .. rhs)
    vim.cmd("silent! doautocmd InsertLeave")
  end, opts)
end
for _, k in ipairs({ "x", "p", "u", "<c-r>", "~", "D", "dd" }) do
  refresh("n", k, k)
end
refresh("v", "d", "d")

-- Restore gq default behavior
vim.keymap.set("n", "gq", "gq", opts)
vim.keymap.set("v", "gq", "gq", opts)

-- ============================================================================
-- LSP
-- ============================================================================

-- Remove default LSP keymaps
local del_map = {
  n = { "grn", "gri", "gO", "<c-w>d", "K" },
  i = { "<c-s>" },
  s = { "<c-s>" }
}
for mode, keys in pairs(del_map) do
  for _, key in ipairs(keys) do
    pcall(vim.keymap.del, mode, key)
  end
end

-- Remap R to lsp rename
vim.keymap.set("n", "R", vim.lsp.buf.rename, opts)

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
end, opts)

-- ============================================================================
-- Plugins
-- ============================================================================

-- Find file
vim.keymap.set("n", "<c-p>", function()
  local fzy = require("fzy")
  fzy.execute("fd --type f --strip-cwd-prefix", fzy.sinks.edit_file)
end, opts)

-- Format file
vim.keymap.set("n", "==", "<cmd>Conform<cr>", opts)

-- Gitsigns textobject
vim.keymap.set({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<cr>", opts)

-- Code outline
vim.keymap.set("n", "<c-o>", function()
  local ft = vim.bo.filetype
  local patterns = {
    c        = [[^\w\+\s\+\**\w\+\s*(]],
    cpp      = [[^\(class\|struct\|namespace\)\s\|^\w\+\s\+\**\w\+\s*(]],
    go       = [[^\(func\|type\)\s]],
    javascript = [[^\s*\(function\|class\|const\s\+\w\+\s*=\s*(\|export\)\s]],
    lua      = [[^\s*\(local\s\+\)\?function\s]],
    markdown = [[^#\+\s]],
    python   = [[^\s*\(class\|def\)\s]],
    sh       = [[^\s*\(function\s\+\)\?\w\+\s*()]],
  }

  local pattern = patterns[ft]
  if not pattern then
    vim.notify("No outline pattern for " .. ft, vim.log.levels.WARN)
    return
  end

  vim.cmd(string.format("silent! lvimgrep /%s/j %%", pattern))

  if #vim.fn.getloclist(0) > 0 then
    vim.fn.setloclist(0, {}, 'a', {title = ''})
    vim.cmd("lopen")
  else
    vim.notify("No symbols found", vim.log.levels.INFO)
  end
end, opts)
