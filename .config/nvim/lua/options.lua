vim.g.mapleader = vim.keycode("<space>")

-- Platform Settings
vim.opt.mouse = "nvi"
vim.opt.clipboard = "unnamedplus"

-- File Management
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.autowriteall = true
local tmpdir = vim.loop.os_getenv("TMPDIR") or "/tmp"
vim.opt.backupdir:prepend(tmpdir .. "//")
vim.opt.directory:prepend(tmpdir .. "//")

-- Visual Settings
vim.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = "no"
vim.opt.pumheight = 6
vim.opt.jumpoptions = "view"
vim.opt.shortmess:append("WcCI")
vim.opt.fillchars:append({eob = " ", vert = " "})
vim.g.netrw_banner = 0

-- Search Settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Indentation
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Completion
vim.opt.completeopt = "menuone,noinsert"
 
-- Highlight Overrides
vim.api.nvim_set_hl(0, "MatchParen", { fg = "NONE" })
