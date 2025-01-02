-- Clear buffer search highlight
vim.keymap.set("n", "<leader><space>", ":nohl<cr>")

-- Fuzzy search files
vim.keymap.set("n", "<c-p>", ":<c-u>FZF<cr>")

