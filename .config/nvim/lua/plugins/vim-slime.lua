return {
	{
		"jpalardy/vim-slime",
		ft = {
			"python",
			"sql",
		},
		init = function()
			vim.g["slime_target"] = "neovim"
			vim.g["slime_python_ipython"] = true
		end,
		config = function()
			vim.g["slime_input_pid"] = false
			vim.g["slime_suggest_default"] = true
			vim.g["slime_menu_config"] = false
			vim.g["slime_neovim_ignore_unlisted"] = false
		end,
	},
}
