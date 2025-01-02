-- External Plugins
require("paq") {
    -- Verbs and Objects
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",
    "wellle/targets.vim",
    -- Utilities
    "savq/paq-nvim",
    "junegunn/fzf"
}

-- Configurations
require("options")
require("autocmds")
require("keymaps")

-- FZF Settings
vim.g.fzf_action = {
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit'
}
vim.g.fzf_layout = { down = '30%' }
vim.g.fzf_colors = { gutter = {'bg', 'Normal'} }
