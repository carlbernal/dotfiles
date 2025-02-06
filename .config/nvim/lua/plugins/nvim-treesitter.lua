return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		opt = {
			sync_install = false,
			auto_install = true,
			indent = { enable = false },
			highlight = {
				enabled = false,
				additional_vim_regex_highlighting = false,
			},
		},
	},
}
