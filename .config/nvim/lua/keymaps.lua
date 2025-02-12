local default = {
	noremap = true,
	silent = true,
}

-- Remove c-c echo message
vim.keymap.set("n", "<c-c>", "<c-c>", { silent = true })

-- Remap esc in terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", default)

-- Search directory for file
vim.keymap.set("n", "<c-p>", function()
	local fzy = require("fzy")
	fzy.execute("fd --type f --strip-cwd-prefix", fzy.sinks.edit_file)
end, default)

-- Format file using conform
vim.keymap.set("n", "==", ":<c-u>Format<cr>", default)

-- View code outline
vim.keymap.set("n", "<c-->", ":<c-u>AerialToggle<cr>", default)

-- Buffer controls
vim.keymap.set("n", "<c-j>", ":bn<cr>", default)
vim.keymap.set("n", "<c-k>", ":bp<cr>", default)
-- https://stackoverflow.com/questions/1444322
vim.keymap.set("n", "<c-x>", ":bp<bar>sp<bar>bn<bar>bd!<cr>", default)

-- Remap shift + enter to zt
vim.keymap.set("n", "<s-cr>", "zt", default)

-- Remove default LSP mappings
vim.keymap.set("n", "gd", "<nop>", default)
vim.keymap.set("n", "gr", "<nop>", default)
vim.keymap.set("n", "gi", "<nop>", default)
vim.keymap.set("n", "crn", "<nop>", default)
vim.keymap.set("n", "crr", "<nop>", default)
vim.keymap.set("n", "<c-w>d", "<nop>", default)

-- Restore gq default behavior
vim.keymap.set("n", "gq", "gq", default)
vim.keymap.set("v", "gq", "gq", default)

-- LSP mappings
vim.keymap.set("n", "K", vim.lsp.buf.hover, default)
vim.keymap.set("n", "R", vim.lsp.buf.rename, default)
vim.keymap.set("n", "<c-.>", vim.lsp.buf.code_action, default)

-- Diagnostics mappings
vim.keymap.set("n", "<c-cr>", function()
	vim.diagnostic.setloclist({ open = true })
end, default)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, default)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, default)

-- Gitsigns mappings
vim.keymap.set({ "o", "x" }, "ih", ":Gitsigns select_hunk<cr>", default)
vim.keymap.set("n", "]c", ":Gitsigns next_hunk<cr>", default)
vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<cr>", default)

-- Reserve
vim.keymap.set("n", "<c-e>", "<nop>", default)
vim.keymap.set("n", "<c-b>", "<nop>", default)
vim.keymap.set("n", "<c-+>", "<nop>", default)
