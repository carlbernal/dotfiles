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
    -- Verbs
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",
    -- Objects
    "michaeljsmith/vim-indent-object",
    "wellle/targets.vim",
    -- Utilities
    "mfussenegger/nvim-fzy",
    "romainl/vim-qf",
    "tpope/vim-fugitive",
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
  change_detection = {
    enable = false,
    notify = false,
  },
})

-- Set all autocmds, user commands, and keymaps in their own separate file
require("autocmds")
require("user-commands")
require("keymaps")
require("highlights")
