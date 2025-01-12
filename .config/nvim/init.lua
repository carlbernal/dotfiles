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

-- Disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

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
		-- TODO replace targets with treesitter-objects
		"wellle/targets.vim",
		-- Utilities
		"romainl/vim-qf",
		{ "lewis6991/gitsigns.nvim", opts = {} },
		-- Colorscheme
		{
			"tomasiser/vim-code-dark",
			lazy = false,
			priority = 1000,
			init = function()
				vim.g["codedark_conservative"] = 1
				vim.cmd("colorscheme codedark")
			end,
		},
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

-- TODO put lsp in a separate file
-- TODO configure lsp
-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#configuration
-- Remove mappings to K, [d, ]d, and <c-w> d
-- Remove formatexpr lsp format
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = false,
	update_in_insert = false,
	-- severity_sort = true
})
-- TODO configure lsp actions
-- TODO if possible, create a common lsp config and include them on all lsps

-- TODO make sure no lsp run only on directory that requires a root marker
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- References
-- https://github.com/oryband/dotfiles/blob/aef18869243d48b025337d3ba41f2b410b7a6cb0/.config/nvim/lua/user/init.lua#L10
-- https://neovim.io/doc/user/diagnostic.html
-- https://neovim.io/doc/user/lsp.html#_lua-module:-vim.lsp.codelens

-- Set all autocmds, user commands, and keymaps in their own separate file
require("autocmds")
require("user-commands")
require("keymaps")
require("highlights")
