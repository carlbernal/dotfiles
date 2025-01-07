-- Gitsigns hunk text object
vim.keymap.set({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<CR>", {noremap = true, silent = true})

-- Search file
-- TODO add limits to what directory search can run
-- TODO add limits on how much file it will scan
vim.keymap.set("n", "<c-p>", require("telescope.builtin").find_files, {noremap = true, silent = true})

-- Format current file
vim.keymap.set("n", "==", ":<c-u>Format<cr>", {noremap = true, silent = true})

-- Buffer controls
vim.keymap.set("n", "<c-j>", ":bn<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<c-k>", ":bp<cr>", {noremap = true, silent = true})
-- https://stackoverflow.com/questions/1444322
vim.keymap.set("n", "<c-x>", ":bp<bar>sp<bar>bn<bar>bd<cr>", {noremap = true, silent = true})
