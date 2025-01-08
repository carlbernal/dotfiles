-- Search directory for file
vim.keymap.set("n", "<c-p>", require("telescope.builtin").find_files, { noremap = true, silent = true })

-- Format file
vim.keymap.set("n", "==", ":<c-u>Format<cr>", { noremap = true, silent = true })

-- View code outline
vim.keymap.set("n", "--", ":<c-u>AerialToggle<cr>", { noremap = true, silent = true })

-- Buffer controls
vim.keymap.set("n", "<c-j>", ":bn<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-k>", ":bp<cr>", { noremap = true, silent = true })
-- https://stackoverflow.com/questions/1444322
vim.keymap.set("n", "<c-x>", ":bp<bar>sp<bar>bn<bar>bd<cr>", { noremap = true, silent = true })

-- Gitsigns mappings
vim.keymap.set({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "]c", ":Gitsigns next_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "[c", ":Gitsigns prev_hunk<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cs", ":Gitsigns stage_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cu", ":Gitsigns undo_stage_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>cs", ":Gitsigns stage_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>cu", ":Gitsigns undo_stage_hunk<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cp", ":Gitsigns preview_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cb", ":Gitsigns blame_line<cr>", { noremap = true, silent = true })
