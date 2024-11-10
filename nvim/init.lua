-- Configs
require("options")
require("keymaps")
require("autocmds")

-- Plugins
require "paq" {
    "savq/paq-nvim",

    -- Verbs
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "tpope/vim-sexp-mappings-for-regular-people",
    "vim-scripts/ReplaceWithRegister",

    -- Objects
    "michaeljsmith/vim-indent-object",
    "wellle/targets.vim",

    -- Visual Plugins
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "nvim-lualine/lualine.nvim",
    "Mofiqul/vscode.nvim",

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",

    -- Tools
    "Olical/conjure",
}

-- Plugin Settings
vim.g.netrw_banner = false
vim.cmd.colorscheme "vscode"
require('lualine').setup({
    options = {
        icons_enabled = false,
        theme = "onedark"
    },
})

-- LSP Settings
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
}

local cmp = require('cmp')
cmp.setup({
    sources = {{name = 'nvim_lsp'}},
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})
