-- Gitsigns vscode dark mode highlights
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#81b88b" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#e2c08d" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#c74e39" })

-- Remove highlighted line in qf and location list window
vim.api.nvim_set_hl(0, "QuickFixLine", { bg = "NONE", ctermbg = "NONE" })

-- Invert matching parenthesis highlight color
vim.api.nvim_set_hl(0, "MatchParen", { bg = "#3b424f", fg = "NONE" })
