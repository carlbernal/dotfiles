return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = true,
      formatters_by_ft = {
        ["*"] = { "trim_newlines", "trim_whitespace" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "jq" },
        dart = { "dart_format" },
      },
    },
  },
}
