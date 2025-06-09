return {
  {
    "ervandew/supertab",
    config = function()
      vim.g["SuperTabDefaultCompletionType"] = "context"
      vim.g["SuperTabCrMapping"] = true
    end,
  },
}
