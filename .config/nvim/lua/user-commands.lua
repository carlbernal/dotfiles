-- ============================================================================
-- Editing
-- ============================================================================

-- Conform format command
vim.api.nvim_create_user_command("Conform", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({
    async = true,
    lsp_format = "fallback",
    range = range
  })
end, { range = true })

-- ============================================================================
-- LSP
-- ============================================================================

-- LSP code action
vim.api.nvim_create_user_command("CodeAction", function()
  vim.lsp.buf.code_action()
end, {})

-- ============================================================================
-- Utilities
-- ============================================================================

-- Open todos
vim.api.nvim_create_user_command("T", function()
  local output = vim.fn.system('todo')
  if vim.v.shell_error ~= 0 then
    vim.notify("Error running todo script", vim.log.levels.ERROR)
    return
  end

  if output == "" or output:match("^%s*$") then
    vim.notify("No TODOs found!", vim.log.levels.WARN)
    return
  end

  vim.fn.setqflist({}, 'r', {
    title = 'TODOs',
    lines = vim.split(output, '\n', { trimempty = true })
  })

  if #vim.fn.getqflist() == 0 then
    vim.notify("No TODOs found!", vim.log.levels.WARN)
    return
  end

  vim.cmd("copen")
  vim.cmd("wincmd p")
end, {})

-- Print and copy file full path
vim.api.nvim_create_user_command("Path", function()
  local path = vim.fn.expand("%:p")
  if path == "" then return end
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, {})
