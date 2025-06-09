-- Conform format command
vim.api.nvim_create_user_command("Format", function(args)
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

-- Open todos
vim.api.nvim_create_user_command("T", function()
  vim.cmd("cgetexpr system('todo')")
end, {})

-- Print and copy file full path
vim.api.nvim_create_user_command("Path", function()
  local path = vim.fn.expand("%:p")
  if path == "" then return end
  print(path)
  vim.fn.setreg("+", path)
end, {})

-- Go commands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- :A! creates alternate file if it's not found
    vim.api.nvim_buf_create_user_command(0, "A", function(opts)
      vim.fn["go#alternate#Switch"](opts.bang and 1 or 0, "edit")
    end, { bang = true })
    vim.api.nvim_buf_create_user_command(0, "AV", function(opts)
      vim.fn["go#alternate#Switch"](opts.bang and 1 or 0, "vsplit")
    end, { bang = true })
    vim.api.nvim_buf_create_user_command(0, "AS", function(opts)
      vim.fn["go#alternate#Switch"](opts.bang and 1 or 0, "split")
    end, { bang = true })
  end,
})
