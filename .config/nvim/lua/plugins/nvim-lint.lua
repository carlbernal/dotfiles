return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        c = { "clangtidy" },
        clojure = { "clj-kondo" },
        cpp = { "clangtidy" },
        go = { "golangcilint" },
        javascript = { "eslint" },
        lua = { "luacheck" },
        python = { "flake8" },
        sh = { "shellcheck" },
        sql = { "sqlfluff" },
      }
    end,
  },
}
