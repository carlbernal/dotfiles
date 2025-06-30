return {
  {
    "eraserhd/parinfer-rust",
    build = "cargo build --release",
    ft = "lisp,scheme",
    config = function()
      vim.g["parinfer_mode"] = "smart"
    end,
  },
}
