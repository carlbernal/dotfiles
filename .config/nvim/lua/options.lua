vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Platform Settings
vim.opt.mouse = "nvi"
vim.opt.mousemodel = "extend"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- File Management
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.autowriteall = true
local tmpdir = vim.loop.os_getenv("TMPDIR") or "/tmp"
vim.opt.backupdir:prepend(tmpdir .. "//")
vim.opt.directory:prepend(tmpdir .. "//")

-- UI Settings
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,100"
vim.opt.number = true
vim.opt.showcmd = false
vim.opt.statusline = "%y %l:%c" .. "%=" .. "%t"
vim.opt.pumheight = 11
vim.opt.jumpoptions = "view"
vim.opt.shortmess:append("WcCI")
vim.opt.fillchars:append({ eob = " " })
vim.g.netrw_banner = 0

-- Search Settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

-- Indentation
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

-- Completion
vim.opt.wildmenu = true
vim.opt.wildoptions = "fuzzy,pum"
vim.opt.complete = ".,w"
vim.opt.completeopt = "menuone,noinsert,fuzzy"

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
})
