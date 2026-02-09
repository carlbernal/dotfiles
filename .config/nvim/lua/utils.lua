local M = {}

function M.find_git_root()
  local result = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
  if vim.v.shell_error == 0 then
    return vim.trim(result)
  end
  return nil
end

return M
