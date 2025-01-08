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
				json = { "jq" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				go = { "gofmt" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				sh = { "shfmt" },
				python = { "black" },
				lua = { "stylua" },
			},
		},
		init = function()
			vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
