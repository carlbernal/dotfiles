return {
  {
    "preservim/tagbar",
    init = function()
      vim.g["tagbar_autoclose"] = true
      vim.g["tagbar_autofocus"] = true
      vim.g["tagbar_sort"] = false
      vim.g["tagbar_compact"] = true
      vim.g["tagbar_indent"] = 2

      -- Customize metadata
      vim.g["tagbar_show_data_type"] = true
      vim.g["tagbar_show_visibility"] = true
      vim.g["tagbar_show_prefix"] = true
      vim.g["tagbar_show_suffix"] = true
      vim.g["tagbar_show_tag_count"] = true

      -- Remove tagbar mappings for folding
      vim.g["tagbar_map_openfold"] = ""
      vim.g["tagbar_map_closefold"] = ""
    end,
  },
}
