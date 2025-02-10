-- Remove c-c echo message
vim.keymap.set("n", "<c-c>", "<c-c>", { silent = true })

-- Search directory for file
vim.keymap.set("n", "<c-p>", function()
	local fzy = require("fzy")
	fzy.execute("fd", fzy.sinks.edit_file)
end, { noremap = true, silent = true })

-- Format file
vim.keymap.set("n", "==", ":<c-u>Format<cr>", { noremap = true, silent = true })

-- View code outline
vim.keymap.set("n", "<c-->", ":<c-u>AerialToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-+>", "<nop>", { noremap = true, silent = true })

-- Buffer controls
vim.keymap.set("n", "<c-j>", ":bn<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-k>", ":bp<cr>", { noremap = true, silent = true })
-- https://stackoverflow.com/questions/1444322
vim.keymap.set("n", "<c-x>", ":bp<bar>sp<bar>bn<bar>bd<cr>", { noremap = true, silent = true })

-- Remap shift + enter to zt
vim.keymap.set("n", "<s-cr>", "zt", { noremap = true, silent = true })

-- Toggle diagnostics
vim.keymap.set("n", "<c-e>", function()
	vim.diagnostic.setloclist({ open = true })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<c-b>", "<nop>", { noremap = true, silent = true })

-- Remap esc in terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { noremap = true, silent = true })

-- Gitsigns mappings
vim.keymap.set({ "o", "x" }, "ih", ":Gitsigns select_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "]c", ":Gitsigns next_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<cr>", { noremap = true, silent = true })
