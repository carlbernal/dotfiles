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

-- Search commands
vim.api.nvim_create_user_command("Sc", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, {})

-- Gitsigns commands
vim.api.nvim_create_user_command("Gn", "Gitsigns next_hunk", {})
vim.api.nvim_create_user_command("Gs", "Gitsigns stage_hunk", {})
vim.api.nvim_create_user_command("Gu", "Gitsigns undo_stage_hunk", {})
vim.api.nvim_create_user_command("Gp", "Gitsigns preview_hunk", {})
vim.api.nvim_create_user_command("Gb", "Gitsigns blame_line", {})

-- Open diagnostics errors
vim.api.nvim_create_user_command("E", function()
    vim.diagnostic.setqflist({ open = true })
end, {})
