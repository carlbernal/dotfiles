-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Set vim options
require("options")

-- Set plugins
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		-- Text object and verb
		"tpope/vim-repeat",
		"tpope/vim-surround",
		"vim-scripts/ReplaceWithRegister",
		"wellle/targets.vim",
		-- Utilities
		{ "lewis6991/gitsigns.nvim", opts = {} },
	},
	dev = {
		-- My plugins
		path = "~/repo/nvim-plugins",
	},
	change_detection = {
		enable = false,
		notify = false,
	},
})

-- TODO configure
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
    underline = false,
	update_in_insert = false,
    -- severity_sort = true
})

-- Set all autocmds, user commands, and keymaps in their own separate file
require("autocmds")
require("user-commands")
require("keymaps")
