return {
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			backends = {
				"treesitter",
				"lsp",
				"markdown",
			},
			layout = {
				min_width = 30,
				max_width = 50,
				preserve_equality = false,
			},
			close_on_select = true,
			ignore = {
				unlisted_buffers = true,
			},
		},
	},
}
