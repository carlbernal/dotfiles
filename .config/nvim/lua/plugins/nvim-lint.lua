return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				sql = { "sqlfluff" },
				-- yaml = {},
				-- json = {},
				-- html = {},
				-- css = {},
				javascript = { "eslint" },
				typescript = { "eslint" },
				cpp = { "clangtidy" },
				c = { "clangtidy" },
				sh = { "shellcheck" },
				python = { "flake8" },
				-- lua = {},
				markdown = { "vale" },
			}
		end,
	},
}
