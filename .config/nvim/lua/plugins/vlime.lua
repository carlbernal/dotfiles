return {
  {
    "vlime/vlime",
    ft = "lisp",
    init = function()
      vim.g["vlime_force_default_keys"] = true
      vim.g["vlime_indent_keywords"] = {}
      vim.g["vlime_enable_autodoc"] = false
    end,
  },
}
