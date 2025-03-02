return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				sql = { "sqlfluff" },
				javascript = { "eslint" },
				c = { "clangtidy" },
				cpp = { "clangtidy" },
				sh = { "shellcheck" },
				python = { "flake8" },
				markdown = { "cspell" },
			}
		end,
	},
}
