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
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end
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

-- Filter quickfix to 1 row per valid item and manage window
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  group = my_autocmds,
  pattern = "make",
  callback = function()
    local qf = vim.fn.getqflist()
    local clean_qf = {}

    for _, item in ipairs(qf) do
      if item.valid == 1 then
        table.insert(clean_qf, item)
      end
    end

    vim.fn.setqflist(clean_qf, "r")

    if #clean_qf > 0 then
      vim.cmd("cwindow")
    else
      vim.cmd("cclose")
      if vim.v.shell_error == 0 then
        vim.notify("Success", vim.log.levels.INFO)
      end
    end
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
local lint_group = vim.api.nvim_create_augroup("NvimLint", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_group,
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

-- ============================================================================
-- Makeprg Settings
-- ============================================================================

vim.api.nvim_create_autocmd("FileType", {
  group = my_autocmds,
  pattern = "c,cpp",
  callback = function()
    local git_root = require("utils").find_git_root()
    if not git_root then
      return
    end

    if vim.uv.fs_stat(git_root .. "/build/Makefile") then
      vim.opt_local.makeprg = string.format("make -C %q", git_root .. "/build")
    elseif vim.uv.fs_stat(git_root .. "/Makefile") then
      vim.opt_local.makeprg = string.format("make -C %q", git_root)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = my_autocmds,
  pattern = "go",
  callback = function()
    vim.opt_local.makeprg = "go build"
  end,
})
