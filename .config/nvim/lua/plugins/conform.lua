return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			notify_on_error = true,
			formatters_by_ft = {
				["*"] = { "trim_newlines", "trim_whitespace" },
				sql = { "sqlfluff" },
				yaml = { "yamlfmt" },
				json = { "jq" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				sh = { "shfmt" },
				python = { "black" },
				lua = { "stylua" },
				markdown = { "prettier" },
			},
		},
	},
}
