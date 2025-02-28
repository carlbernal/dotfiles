return {
	{
		"eraserhd/parinfer-rust",
		build = "cargo build --release",
		ft = {
			"scheme",
			"lisp",
		},
		config = function()
			vim.g["parinfer_mode"] = "indent"
		end,
	},
}
