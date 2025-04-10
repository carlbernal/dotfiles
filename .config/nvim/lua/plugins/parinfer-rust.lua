return {
  {
    "eraserhd/parinfer-rust",
    build = "cargo build --release",
    ft = {
      "scheme",
      "lisp",
      "clojure",
    },
    config = function()
      vim.g["parinfer_mode"] = "smart"
    end,
  },
}
