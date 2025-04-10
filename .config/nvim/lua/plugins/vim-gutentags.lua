return {
  {
    "ludovicchabant/vim-gutentags",
    config = function()
      vim.g["gutentags_cache_dir"] = vim.fn.expand("~/.tags")
      vim.g["gutentags_ctags_extra_args"] = {
        "--options=" .. vim.fn.expand("~/.ctags"),
      }
    end,
  },
}
