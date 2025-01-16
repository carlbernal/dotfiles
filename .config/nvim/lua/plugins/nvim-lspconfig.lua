return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local extraSchemas = {
				-- {
				-- 	description = "My custom JSON schema",
				-- 	fileMatch = "foo.json",
				-- 	name = "foo.json",
				-- 	url = "https://example.com/schema/foo.json",
				-- },
			}

			lspconfig.jsonls.setup({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas({
							extra = extraSchemas,
						}),
						validate = { enable = true },
					},
				},
			})

			-- lspconfig.html.setup({})
			lspconfig.cssls.setup({})

			lspconfig.ts_ls.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.pyright.setup({})
		end,
	},
}
