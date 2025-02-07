return {
	{
		"jpalardy/vim-slime",
		ft = {
			"commonlisp",
			"scheme",
			"python",
			"sql",
		},
		init = function()
			vim.g["slime_target"] = "neovim"
			vim.g["slime_python_ipython"] = 1
		end,
	},
}
