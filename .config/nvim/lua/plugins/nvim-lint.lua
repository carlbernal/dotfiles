return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        c = { "cppcheck" },
        cpp = { "cppcheck" },
        javascript = { "eslint_d" },
        lua = { "luacheck" },
        proto = { "buf_lint" },
        python = { "ruff" },
        sh = { "shellcheck" },
        sql = { "sqlfluff" },
      }
    end,
  },
}
