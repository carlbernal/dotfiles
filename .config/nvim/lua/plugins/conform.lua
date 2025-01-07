return {
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = true,
			formatters_by_ft = {
				sql = { "sqlfluff" },
				json = { "jq" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				go = { "gofmt" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				bash = { "shfmt" },
				python = { "black" },
				lua = { "stylua" },
			},
		},
	},
}
