-- Conform format command
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- Open diagnostics errors
vim.api.nvim_create_user_command("E", function()
	vim.diagnostic.setloclist({ open = true })
end, {})

-- Open todos
vim.api.nvim_create_user_command("T", function()
	vim.cmd("cgetexpr system('todo')")
    -- TODO toggle if quickfix list is already open
end, {})

-- Print and copy file full path
vim.api.nvim_create_user_command("Path", function()
	local path = vim.fn.expand("%:p")
	print(path)
	vim.fn.setreg("+", path)
end, {})
