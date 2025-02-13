return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				sql = { "sqlfluff" },
				javascript = { "eslint" },
				cpp = { "clangtidy" },
				c = { "clangtidy" },
				sh = { "shellcheck" },
				python = { "flake8" },
				markdown = { "vale" },
			}
		end,
	},
}
