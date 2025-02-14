local default = {
	noremap = true,
	silent = true,
}

-- Remove c-c echo message
vim.keymap.set("n", "<c-c>", "<c-c>", { silent = true })

-- Remap esc in terminal mode
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", default)

-- Add InsertLeave event to various verbs instead of using TextChange and debounce
vim.keymap.set("n", "x", "x:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "p", "p:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "u", "u:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "r", "r:doautocmd InsertLeave<cr>", default)
vim.keymap.set("n", "~", "~:doautocmd InsertLeave<cr>", default)

-- Search directory for file
vim.keymap.set("n", "<c-p>", function()
	local fzy = require("fzy")
	fzy.execute("fd --type f --strip-cwd-prefix", fzy.sinks.edit_file)
end, default)

-- Format file using conform
vim.keymap.set("n", "==", ":<c-u>Format<cr>", default)

-- View code outline
vim.keymap.set("n", "<c-->", ":<c-u>AerialToggle<cr>", default)

-- Delete buffer https://stackoverflow.com/questions/1444322
vim.keymap.set("n", "<c-x>", ":<c-u>bp<bar>sp<bar>bn<bar>bd!<cr>", default)

-- Make <c-^> work with au buffer fix
vim.keymap.set("n", "<c-j>", ":<c-u>b #<cr>", default)

-- Remap shift + enter to zt
vim.keymap.set("n", "<s-cr>", "zt", default)

-- Remove default LSP mappings
vim.keymap.set("n", "<c-w>d", "<nop>", default)
vim.keymap.set("n", "K", "<nop>", default)

-- Restore gq default behavior
vim.keymap.set("n", "gq", "gq", default)
vim.keymap.set("v", "gq", "gq", default)

-- LSP mappings
vim.keymap.set("n", "R", vim.lsp.buf.rename, default)
vim.keymap.set("n", "<c-.>", vim.lsp.buf.code_action, default)

-- Diagnostics mappings
vim.keymap.set("n", "<c-cr>", function()
	vim.diagnostic.setloclist({ open = true })
end, default)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, default)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, default)

-- Gitsigns mappings
vim.keymap.set({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>", default)
vim.keymap.set("n", "]c", ":<c-u>Gitsigns next_hunk<cr>", default)
vim.keymap.set("n", "[c", ":<c-u>Gitsigns prev_hunk<cr>", default)

-- Reserve
vim.keymap.set("n", "<c-+>", "<nop>", default)
vim.keymap.set("n", "<c-[>", "<nop>", default)
vim.keymap.set("n", "<c-e>", "<nop>", default)
vim.keymap.set("n", "<c-b>", "<nop>", default)
-- vim.keymap.set("n", "<c-j>", "<nop>", default)
vim.keymap.set("n", "<c-k>", "<nop>", default)
vim.keymap.set("n", "<c-i>", "<nop>", default)
vim.keymap.set("n", "<c-o>", "<nop>", default)
vim.keymap.set("n", "<c-^>", "<nop>", default)
