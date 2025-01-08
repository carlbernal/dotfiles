local my_autocmds = vim.api.nvim_create_augroup("my_autocmds", { clear = true })

-- Resize splits if window got resized
vim.api.nvim_create_autocmd("VimResized", {
	group = my_autocmds,
	-- TODO limit number of buffers per window to 2
	command = "tabdo wincmd =",
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

-- Set lint events
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
	group = my_autocmds,
	callback = function()
		require("lint").try_lint()
	end,
})
