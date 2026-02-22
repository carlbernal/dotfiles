return {
  {
    "jpalardy/vim-slime",
    ft = "python,lua,sql",
    init = function()
      vim.g["slime_target"] = "neovim"
    end,
    config = function()
      vim.g["slime_python_ipython"] = true
      vim.g["slime_input_pid"] = false
      vim.g["slime_suggest_default"] = true
      vim.g["slime_menu_config"] = false
      vim.g["slime_neovim_ignore_unlisted"] = false
    end,
  },
}
