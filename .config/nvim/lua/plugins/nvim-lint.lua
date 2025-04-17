return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        c = { "cppcheck" },
        cpp = { "cppcheck" },
        javascript = { "eslint_d" },
        lua = { "luacheck" },
        python = { "flake8" },
        sh = { "shellcheck" },
        sql = { "sqlfluff" },
      }
    end,
  },
}
