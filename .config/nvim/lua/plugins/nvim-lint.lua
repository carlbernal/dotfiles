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
				go = { "golangci" },
				cpp = { "clangtidy" },
				c = { "clangtidy" },
				bash = { "shellcheck" },
				python = { "flake8" },
				lua = { "luacheck" },
			}
		end,
	},
}
