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
vim.g["loaded_python3_provider"] = false
vim.g["loaded_node_provider"] = false
vim.g["loaded_ruby_provider"] = false
vim.g["loaded_perl_provider"] = false

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
    "tpope/vim-fugitive",
    "mfussenegger/nvim-fzy",
    "romainl/vim-qf",
    { "lewis6991/gitsigns.nvim", opts = {} },
    -- Syntax
    {
      dir = "~/vim-soy",
      name = "vim-soy",
    },
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
    {
      "luochen1990/rainbow",
      event = { "BufReadPre", "BufNewFile" },
      init = function()
        vim.g["rainbow_active"] = 1
      end,
      config = function()
        vim.cmd("RainbowToggleOn")
      end,
    }
  },
  change_detection = {
    enable = false,
    notify = false,
  },
})

-- Set other options
require("autocmds")
require("user-commands")
require("keymaps")
require("highlights")
require("lsp")
