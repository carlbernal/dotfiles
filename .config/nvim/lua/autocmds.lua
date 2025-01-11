local my_autocmds = vim.api.nvim_create_augroup("my_autocmds", { clear = true })

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

-- Set 2 space indendation for some filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = my_autocmds,
	pattern = "javascript,html,css,json",
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
	end,
})

-- Set aerial scratch window options
vim.api.nvim_create_autocmd("FileType", {
	group = my_autocmds,
	pattern = "aerial",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})

-- Set lint events
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
	callback = function()
		require("lint").try_lint()
	end,
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
