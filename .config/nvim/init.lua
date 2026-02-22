-- ============================================================================
-- General
-- ============================================================================

-- Set leaders
vim.g["mapleader"] = ","
vim.g["maplocalleader"] = ","

-- Disable unused providers to speed up startup
vim.g["loaded_python3_provider"] = false
vim.g["loaded_node_provider"] = false
vim.g["loaded_ruby_provider"] = false
vim.g["loaded_perl_provider"] = false

-- ============================================================================
-- Bootstrap lazy.nvim
-- ============================================================================

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

-- ============================================================================
-- Core Config
-- ============================================================================

require("options")
require("keymaps")

-- ============================================================================
-- Plugins
-- ============================================================================

require("lazy").setup({
  spec = {
    { import = "plugins" },
    -- Inline plugins
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",
    "michaeljsmith/vim-indent-object",
    "wellle/targets.vim",
    "neovim/nvim-lspconfig",
    "tpope/vim-fugitive",
    "mfussenegger/nvim-fzy",
    "romainl/vim-qf",
    "famiu/bufdelete.nvim",
    { "lewis6991/gitsigns.nvim", opts = {} },
    -- Colorscheme
    {
      "tomasiser/vim-code-dark",
      lazy = false,
      priority = 1000,
      init = function()
        -- vim.g["codedark_conservative"] = false
        vim.g["codedark_conservative"] = true
        vim.cmd("colorscheme codedark")
      end,
    },
  },
  change_detection = {
    enable = false,
    notify = false,
  },
})

-- ============================================================================
-- Post-Plugin Config
-- ============================================================================

require("autocmds")
require("user-commands")
require("highlights")

-- ============================================================================
-- LSP
-- ============================================================================

vim.lsp.enable({
  "buf_ls",
  "clangd",
  "gopls",
  "lua_ls",
  "pyrefly",
  "ts_ls",
})
