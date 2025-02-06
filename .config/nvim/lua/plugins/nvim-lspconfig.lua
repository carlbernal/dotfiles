return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.jsonls.setup({})
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})

			lspconfig.ts_ls.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.pyright.setup({})
		end,
	},
}
