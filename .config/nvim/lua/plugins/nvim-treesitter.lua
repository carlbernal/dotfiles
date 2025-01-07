return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		opt = {
			ensure_installed = {
				"sql",
				"json",
				"html",
				"css",
				"javascript",
				"go",
				"cpp",
				"c",
				"bash",
				"python",
				"lua",
				"commonlisp",
			},
			auto_install = false,
			sync_install = false,
			indent = { enable = true },
			highlight = {
				enabled = true,
				-- Disable slow treesitter highlight for large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				-- Disable vim regex highlighting
				additional_vim_regex_highlighting = false,
			},
		},
	},
}
