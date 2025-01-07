return {
	{
		"nvim-telescope/telescope.nvim",
		-- Current release
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
		opts = function()
			require("telescope").load_extension("fzy_native")

			local actions = require("telescope.actions")
			local opts = {
				defaults = {
					preview = {
						hide_on_startup = true,
					},
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
				pickers = {},
				extensions = {
					fzy_native = {
						override_generic_sorter = true,
						override_file_sorter = true,
					},
				},
			}

			return opts
		end,
	},
}
