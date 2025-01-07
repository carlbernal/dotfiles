return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.ts_ls.setup{}
            lspconfig.lua_ls.setup{}
            lspconfig.gopls.setup{}
            lspconfig.clangd.setup{}
            lspconfig.pyright.setup{}
        end
    }
}
