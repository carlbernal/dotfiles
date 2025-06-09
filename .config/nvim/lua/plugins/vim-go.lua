return {
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
    config = function()
      vim.g["go_list_type"] = "quickfix"
      vim.g["go_fmt_command"] = "goimports"
      vim.g["go_fmt_autosave"] = false
      vim.g["go_doc_keywordprg_enabled"] = false
      vim.g["go_textobj_enabled"] = false
      vim.g["go_gopls_matcher"] = "fuzzy"
      vim.g["go_template_autocreate"] = false
    end,
  },
}
