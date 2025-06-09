return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" },
      lazy = true
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    local function get_git_root()
      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error ~= 0 then
        return nil
      end
      return git_root
    end

    local git_root = get_git_root() or vim.loop.cwd()
    vim.g["db_ui_save_location"] = git_root .. "/queries"
    vim.g["db_ui_execute_on_save"] = true
    vim.g["db_ui_show_help"] = false
    vim.g["db_ui_use_nvim_notify"] = true
  end,
}
