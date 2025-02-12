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
				max_width = 0.9,
				min_width = 0.9,
				preserve_equality = false,
				default_direction = "float",
			},
			close_automatic_events = {
				"unsupported",
			},
			highlight_mode = "none",
			highlight_closest = false,
			highlight_on_hover = false,
			highlight_on_jump = false,
			close_on_select = true,
			ignore = {
				unlisted_buffers = true,
			},
			float = {
                border = "single",
				relative = "win",
				max_height = 0.8,
				min_height = 0.8,
			},
			keymaps = {
				["<esc>"] = "actions.close",
			},
		},
	},
}
