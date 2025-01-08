return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				sql = { "sqlfluff" },
				-- json = {},
				-- html = {},
				-- css = {},
				javascript = { "eslint" },
				go = { "golangcilint" },
				cpp = { "clangtidy" },
				c = { "clangtidy" },
				sh = { "shellcheck" },
				python = { "flake8" },
				-- lua = {},
			}
		end,
	},
}
