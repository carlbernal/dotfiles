-- Open todos
vim.api.nvim_create_user_command("T", function()
  vim.cmd("cgetexpr system('todo')")
  -- TODO toggle if quickfix list is already open
end, {})

-- Print and copy file full path
vim.api.nvim_create_user_command("Path", function()
  local path = vim.fn.expand("%:p")
  print(path)
  vim.fn.setreg("+", path)
end, {})
