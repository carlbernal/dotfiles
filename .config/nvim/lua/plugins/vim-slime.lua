return {
	{
		"jpalardy/vim-slime",
		ft = {
			"python",
			"lua",
			"sql",
		},
		init = function()
			-- Must be configured before plugin is loaded
			vim.g["slime_target"] = "neovim"
		end,
		config = function()
			-- Options after plugin is loaded
			vim.g["slime_bracketed_paste"] = true
			vim.g["slime_input_pid"] = false
			vim.g["slime_suggest_default"] = true
			vim.g["slime_menu_config"] = false
			vim.g["slime_neovim_ignore_unlisted"] = false
		end,
	},
}
