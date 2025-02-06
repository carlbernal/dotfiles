return {
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
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
			highlight_mode = "none",
			highlight_closest = false,
			highlight_on_hover = false,
			highlight_on_jump = false,
			close_on_select = true,
			ignore = {
				unlisted_buffers = true,
			},
		},
	},
}
