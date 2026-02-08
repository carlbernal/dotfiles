local my_autocmds = vim.api.nvim_create_augroup("my_autocmds", { clear = true })

-- ============================================================================
-- General
-- ============================================================================

-- Resize splits if window got resized
vim.api.nvim_create_autocmd("VimResized", {
  group = my_autocmds,
  command = "tabdo wincmd =",
})

-- Additional autowrite events
vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave" }, {
  group = my_autocmds,
  command = "silent! write",
})

-- Highlight when copying text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = my_autocmds,
  callback = function()
    vim.highlight.on_yank()
  end
})

-- https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
vim.cmd([[
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction
" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction
" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
]])

-- ============================================================================
-- FileType Settings
-- ============================================================================

-- Set 2 space indentation for some filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = my_autocmds,
  pattern = "css,html,javascript,json,lua",
  callback = function()
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Set quickfix list options
vim.api.nvim_create_autocmd("FileType", {
  group = my_autocmds,
  pattern = "qf",
  callback = function()
    vim.opt_local.signcolumn = "no"
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true

    -- Quickfix / locationlist keymaps
    local map_opts = { buffer = true, silent = true }
    vim.keymap.set("n", "<cr>", function()
      local ok = pcall(function() vim.cmd(".ll") end)
      if not ok then pcall(function() vim.cmd(".cc") end) end
      vim.cmd("cclose | lclose")
      vim.cmd("normal! zt")
    end, map_opts)
    vim.keymap.set("n", "<esc>", "<cmd>cclose | lclose<cr>", map_opts)
  end,
})

-- Set terminal mode options
vim.api.nvim_create_autocmd("TermOpen", {
  group = my_autocmds,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.scrolloff = 0
  end,
})

-- ============================================================================
-- LSP & Completion
-- ============================================================================

-- Set omnifunc fallback
vim.api.nvim_create_autocmd("LspAttach", {
  group = my_autocmds,
  callback = function(args)
    if vim.bo[args.buf].omnifunc == "" then
      vim.bo[args.buf].omnifunc = "syntaxcomplete#Complete"
    end
  end,
})

-- Set lint events
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
  callback = function()
    require("lint").try_lint()
  end,
})

-- Global LSP config
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
