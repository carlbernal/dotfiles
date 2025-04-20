return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = true,
      formatters_by_ft = {
        ["*"] = { "trim_newlines", "trim_whitespace" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        css = { "prettier" },
        go = { "gofmt" },
        html = { "prettier" },
        javascript = { "prettier" },
        json = { "jq" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "black" },
        sh = { "shfmt" },
        sql = { "sqlfluff" },
        yaml = { "yamlfmt" },
      },
    },
  },
}
